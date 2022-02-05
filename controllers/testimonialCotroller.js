import {Testimoniales} from '../models/Testimoniales.js';


const guardarTestimoniales = async (req, res)=>{
    //validar 
    const {nombre, correo, mensaje} = req.body;
    const errores = [];

    if(nombre.trim() === ""){
        errores.push({nombre: "el nombre esta vacio"});
    } 
    if(correo.trim() === ""){
        errores.push({nombre: "el correo esta vacio"});
    } 
    if(mensaje.trim() === ""){
        errores.push({nombre: "el mensaje esta vacio"});
    } 

    if(errores.length > 0){
        
        //Le pasamos los viajes a nuestra pagina si hay error 
        const viajes = await Testimoniales.findAll();
        res.render("testimonial",{
            pagina : "Testimoniales",
            errores,
            nombre,
            correo,
            mensaje,
            viajes
        })
    }
    else{

        //Insertar los datos en la base de datos 
        try{
           await Testimoniales.create({
                nombre : nombre,
                correo : correo,
                mensaje
            })

            res.redirect('/testimoniales')
        }catch(e){
            console.log(e);
        }
        
    }
    
    
}

export {
    guardarTestimoniales
}