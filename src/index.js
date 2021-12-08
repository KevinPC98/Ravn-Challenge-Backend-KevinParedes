const express = require("express");
const app = express();

app.set("port",3000);
app.set("json spaces",2);
app.use(express.json());
app.use(express.urlencoded({extended:false}));

//routes
app.use(require("./routes/index"));


app.listen(app.get('port'), () => {
    console.log(`Servidor corriendo en el puerto ${app.get('port')}`);
});