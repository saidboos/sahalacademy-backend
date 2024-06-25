
require('dotenv').config();
const express = require('express');
const app = express();
const cors = require('cors')
const commonRouter = require('./api/users/user.router');


app.use(cors({
    origin:'http://localhost:3000'
}))
app.use(express.json())

app.use('/api/common', commonRouter)

// app.post('/api/register', create);
// app.post('/api/login', login);
// app.post('/api/profile', checkToken, profile);

app.listen(process.env.APP_PORT, () => {
    console.log('Server up and running: ' + process.env.APP_PORT)
})