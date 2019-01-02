<?php

class bd {
    //Atributos
    private $host = "localhost";
    private $user = "root";
    private $passwd = "root!@#1nf0";
    private $database = "twitter";
    //Função
    public function conecta_mysql(){
    $link = mysqli_connect($this->host, $this->user, $this->passwd, $this->database) or die("Erro ao conectar no servidor: " . mysqli_error($link));
    mysqli_select_db($link, $this->database);
    return $link;
    //Define Formatação de Caracteres
    mysqli_query("SET NAMES 'utf8'");
    mysqli_query("SET character_set_connection=utf8");
    mysqli_query("SET character_set_client=utf8");
    mysqli_query("SET character_set_results=utf8");
    }//Fim Função
}//Fim Class

?>
