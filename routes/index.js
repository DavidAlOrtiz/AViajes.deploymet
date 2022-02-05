import express from 'express';
import {paginaInicio, 
        paginaNosotros,
        paginaTestimoniales, 
        paginaViajes,
        paginaViajesDetalleViaje} from '../controllers/paginasControllers.js'
import {guardarTestimoniales} from "../controllers/testimonialCotroller.js";
const router = express.Router();


router.get("/", paginaInicio);

router.get("/nosotros", paginaNosotros);

router.get("/testimoniales", paginaTestimoniales);
router.post("/testimoniales", guardarTestimoniales);

router.get("/viajes", paginaViajes);

//Agregando la ruta con el comodin
router.get("/viajes/:viaje", paginaViajesDetalleViaje);



export default router;