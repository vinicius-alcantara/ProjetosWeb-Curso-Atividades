<?php
session_start();
if(!isset($_SESSION["usuario"])){
    header("Location: index.php?erro=1");
}
require_once 'bd.php'; //Include da Classe de Conexão com o Banco

$id_usuario = $_SESSION["id_usuario"];

//Intanciando o objeto de conexão com banco
$ini_conn = new bd();
$conexao = $ini_conn->conecta_mysql();
//INSTRUÇÕES SQL
//SELECT
$sql = "select t.id_tweet, t.id_usuario, t.tweet, date_format(t.data_inclusao, '%d %b %Y %T') as data_inclusao_formatada, u.usuario ";
$sql.= "from tweet as t join usuarios as u on (t.id_usuario = u.id) ";
$sql.= "where id_usuario = $id_usuario ";
$sql.= "or id_usuario in (select seguindo_id_usuario from usuarios_seguidores where id_usuario = $id_usuario) ";
$sql.= "order by data_inclusao desc";

$resultado_id = mysqli_query($conexao, $sql);
if($resultado_id){
    while ($tweet = mysqli_fetch_array($resultado_id)){
        echo "<a href='#' class='list-group-item'>";
        echo '<h4 class="list-group-item-heading">'.$tweet['usuario'].' <small> - '.$tweet['data_inclusao_formatada'].'</small></h4>';
        echo '<p class="list-group-item-text"> '.$tweet["tweet"].' </p>';
        echo "</a>";
    }
}else{
    echo "Erro na execução da consulta!";
}

?>

