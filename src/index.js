const express = require("express");
const app = express();

app.use((req, res) => {
    res.status(200);
    res.contentType("html");
    res.send("<h1>Hello world!</h1>");
})

app.listen(9000)
