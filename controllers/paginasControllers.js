import {Viaje} from '../models/viajes.js'
import {Testimoniales} from '../models/Testimoniales.js'

const paginaInicio = async (req, res) =>{

    const promiseDB = [];
    promiseDB.push(Viaje.findAll({limit: 3}));
    promiseDB.push(Testimoniales.findAll({limit: 3}));

    try {
        const resultado = await Promise.all(promiseDB)
        res.render("inicio",{
            pagina:"inicio",
            clase: "home",
            viajes: resultado[0],
            testimonios: resultado[1]
        })
    }
    catch(err){
        console.log(err);
    }
   
}

const paginaNosotros = (req, res) =>{
    const viaje = "Viaje a alemania";
    res.render("nosotros",{
        pagina:"Nosotros"
    })
}


const paginaTestimoniales = async  (req, res) =>{

    try{
        const testimonios = await Testimoniales.findAll();
        res.render("testimonial",{
            pagina:"Testimonios",
            testimonios
        })
    }catch(e){

    }

    
}

const paginaViajes = async (req, res) =>{

    const viajes = await Viaje.findAll();
    console.log(viajes);

    res.render("viajes",{
        pagina:"Proximos Viajes",
        viajes
    })
}

const paginaViajesDetalleViaje = async (req, res) =>{
    const {slug} = req.params;
    try{
        const viaje = await Viaje.findOne({ slug });
        res.render("viaje",{
            pagina: "Informacion Viaje",
            viaje
        })
    }catch(e){
        console.log(e)
    }
}

export {
    paginaInicio,
    paginaNosotros,
    paginaTestimoniales,
    paginaViajes,
    paginaViajesDetalleViaje
}