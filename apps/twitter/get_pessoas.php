<?php
session_start();
if(!isset($_SESSION["usuario"])){
    header("Location: index.php?erro=1");
}
require_once 'bd.php'; //Include da Classe de Conexão com o Banco

$id_usuario = $_SESSION["id_usuario"];
$nome = $_POST["txt_nome"];

//Intanciando o objeto de conexão com banco
$ini_conn = new bd();
$conexao = $ini_conn->conecta_mysql();
//INSTRUÇÕES SQL
//SELECT
$sql = "select u.*, us.id_usuario_seguidor from usuarios as u ";
$sql.= "left join usuarios_seguidores as us on (u.id = us.seguindo_id_usuario and us.id_usuario = $id_usuario) ";
$sql.= "where u.usuario like '%$nome%' and u.id != $id_usuario";

$resultado_id = mysqli_query($conexao, $sql);

if($resultado_id){
    while ($pessoa = mysqli_fetch_array($resultado_id)){
       $esta_seguindo_usuario_sn = isset($pessoa["id_usuario_seguidor"]) && !empty($pessoa["id_usuario_seguidor"]) ? 'S' : 'N';
       
        echo "<a href='#' class='list-group-item'>";
        echo '<strong>' .$pessoa['usuario']. '</strong> - ' .'<small>' .$pessoa['email']. '</small>';
        echo "<p class='list-group-item-text pull-right'>";
        
        $btn_seguir_display = "block";
        $btn_deixar_seguir_display = "block";
        
        if($esta_seguindo_usuario_sn == 'N'){
           $btn_deixar_seguir_display = "none";
        } else{
          $btn_seguir_display = "none";
        }
        
        echo '<button type="button" id="seguir_'.$pessoa[id].'" class="btn btn-default btn_seguir" data-id-usuario="'.$pessoa['id'].'" style="display: '.$btn_seguir_display.'" >Seguir</button>';
        
        echo '<button type="button" id="deixar_seguir_'.$pessoa['id'].'" class="btn btn-primary btn_deixar_seguir" data-id-usuario="'.$pessoa['id'].'" style="display: '.$btn_deixar_seguir_display.'">Deixar de seguir</button>';
        
        echo "</p>";
        echo "<div class='clearfix'></div>";
        echo "</a>";
    }
}else{
    echo "Erro na execução da consulta!";
}

?>

