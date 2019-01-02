<?php
require_once 'bd.php'; //Include da Classe de Conexão com o Banco
//Recebendo dados do formulário
$usuario = $_POST["usuario"];
$email = $_POST["email"];
$senha = md5($_POST["senha"]);
//Intanciando o objeto de conexão com banco
$ini_conn = new bd();
$conexao = $ini_conn->conecta_mysql();
//INSTRUÇÕES SQL
//SELECT
$usuario_existe = FALSE;
$email_existe = FALSE;
$select_sql = "select * from usuarios where usuario = '$usuario'";
$select_bd = mysqli_query($conexao, $select_sql);
$select_bd_return = mysqli_fetch_array($select_bd);
if(isset($select_bd_return["usuario"])){
    $usuario_existe = TRUE;
}
$select_sql = "select * from usuarios where email = '$email'";
$select_bd = mysqli_query($conexao, $select_sql);
$select_bd_return = mysqli_fetch_array($select_bd);
if(isset($select_bd_return["email"])){
    $email_existe = TRUE;
}
if($usuario_existe || $email_existe){
    $retorno_get = "";
    if($usuario_existe){
        $retorno_get.= "erro_usuario=1&";
    }
    if($email_existe){
        $retorno_get.= "erro_email=1&";
    }
    header("Location: inscrevase.php?".$retorno_get);
    die();
}
//INSERT
$insert_sql = "insert into usuarios(usuario, email, senha) values ('$usuario', '$email', '$senha')";
$insert_bd = mysqli_query($conexao, $insert_sql);
if($insert_bd){
    echo "Usário registrado com sucesso!";
} else {
    echo "Erro ao incluir o registro!";
}
?>

