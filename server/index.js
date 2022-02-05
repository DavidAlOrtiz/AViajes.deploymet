//const express = require('express');
import express from 'express';
import router from '../routes/index.js'
import db from "../conf/db.js";

import  Dotenv from 'dotenv'
Dotenv.config({path: 'variables.env'})

const app = express();

//Conectar con la base de datos 
db.authenticate()
    .then(() => console.log("Base de datos conectada"))
    .catch((error) => console.log(erro))


//Habilitar pug en xpress
app.set("view engine", "pug");

//Obtener el año actual 
app.use((req, res, next) => {
    const year = new Date();
    res.locals.yearActual = year.getFullYear();
    res.locals.nombreCitio = "Agencia de Viajes"
    return next();
})
//Agregar body parse 
app.use(express.urlencoded({extended:true}))

//Definir la carpeta publica 
app.use(express.static("public"))

//Agrega el router
app.use("/", router);


//asignando los valores 
const host  = process.env.HOST || '0.0.0.0'
const port = process.env.PORT || 4000;
app.listen(port, host, ()=>{
    console.log("el servidor esta funcionando")
})