<?php
session_start(); //Inicia Sessão dos usuários
require_once 'bd.php'; //Include da Classe de Conexão com o Banco
//Recebendo dados do formulário
$usuario = $_POST["usuario"]; 
$senha = md5($_POST["senha"]);
//Intanciando o objeto de conexão com banco
$ini_conn = new bd();
$conexao = $ini_conn->conecta_mysql();
//SQL
$sql = "select * from usuarios where usuario = '$usuario' and senha = '$senha'";
$resultado_id = mysqli_query($conexao, $sql);
if($resultado_id){
    $dados_usuario = mysqli_fetch_array($resultado_id);
    if($dados_usuario["usuario"]){
        $_SESSION["id_usuario"] = $dados_usuario["id"];
        $_SESSION["usuario"] = $dados_usuario["usuario"];
        $_SESSION["email"] = $dados_usuario["email"];
        header("Location: home.php");
    } else{
        header("Location: index.php?erro=1");
    }
}else{
    echo "Erro na excução da consulta. Por favor entrar em contato com admin do site!";
}
?>

