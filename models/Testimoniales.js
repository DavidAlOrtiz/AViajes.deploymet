import Sequelize from 'sequelize';
import db from '../conf/db.js';

export const Testimoniales = db.define('testimoniales' ,{

    nombre:{
        type: Sequelize.STRING
    },
    correo:{
        type: Sequelize.STRING
    },
    mensaje:{
        type: Sequelize.STRING
    },

});