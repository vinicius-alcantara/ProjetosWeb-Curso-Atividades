<?php
session_start();
if(!isset($_SESSION["usuario"])){
    header("Location: index.php?erro=1");
}
require_once 'bd.php'; //Include da Classe de Conexão com o Banco

$id_usuario = $_SESSION["id_usuario"];
$tweet = $_POST["txt_tweet"];
//Intanciando o objeto de conexão com banco
$ini_conn = new bd();
$conexao = $ini_conn->conecta_mysql();
//INSTRUÇÕES SQL
//INSERT
$sql = "insert into tweet (id_usuario, tweet) values ('$id_usuario', '$tweet')";
mysqli_query($conexao, $sql);
?>

