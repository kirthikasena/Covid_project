// require("dotenv").config();
const express = require("express");
const app = express();
const cors = require("cors");
const dotenv = require('dotenv');
const connectDB =require( './db.js');
// const connection = require("./db");
const userRoutes = require("./routes/users");
const authRoutes = require("./routes/auth");
const resultRoutes=require("./routes/results");



// database connection
// connection();

// middlewares
app.use(express.json());
// app.use(cors());




dotenv.config();

connectDB();
// cors
app.use(cors({ origin: true, credentials: true }));

// routes
app.use("/api/users", userRoutes);
app.use("/api/auth", authRoutes);
app.use("/api/results", resultRoutes);

const port = process.env.PORT || 8080;
app.listen(port, console.log(`Listening on port ${port}...`));