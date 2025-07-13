import express from 'express';

const app = express();
const port = process.env.PORT || 8000;

app.get('/api', (_req, res) => {
    console.log("GET API Called");
    res.send('Hello, world!');
});

app.post('/api/:id', (req, res) => {
    console.log("POST API Called");
    res.send('POST request received with id: ' + req.params.id);
});

app.listen(port as number, "0.0.0.0" ,() => {
    console.log(`Server is running on port ${port}`);
});
