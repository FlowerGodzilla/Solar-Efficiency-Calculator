// Import necessary modules
const express = require("express");
const mysql = require("mysql");
const connectDB = require("./db");
const cors = require("cors");
const morgan = require("morgan");

const app = express();
app.use(cors());
app.use(morgan("dev"));
const port = process.env.PORT || 3000;

const db = connectDB();

app.get("/recycle_centers", async (req, res) => {
  const query = "SELECT * FROM recycling_centers";
  try {
    const [rows, fields] = await (await db).query(query);
    console.log(rows);
    res.status(200).json(rows);
  } catch (error) {
    console.error("Error fetching recycling centers:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
