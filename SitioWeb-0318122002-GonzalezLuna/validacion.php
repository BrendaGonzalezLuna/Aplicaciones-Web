<?php

function isNull($nombre, $usuario, $email, $carrera, $favorita, $pasatiempo){
    if(strlen(trim($nombre)) <1 || strlen(trim($usuario)) <1 || strlen(trim($email)) <1 || strlen(trim($favorita)) <1 
    || strlen(trim($carrera)) <1 || strlen(trim($pasatiempo)) <1)
    {
        return true;
        } else {
        return false;
    }
}

