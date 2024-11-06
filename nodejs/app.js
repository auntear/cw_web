// Import modules
const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');

// Initialize express app
const app = express();
app.use(cors());
app.use(bodyParser.json({ limit: '10mb' })); // กำหนดขนาด limit
app.use(bodyParser.urlencoded({ limit: '10mb', extended: true })); // เพิ่ม limit สำหรับ urlencoded

// Database configuration
const db = mysql.createConnection({
  host: '192.168.10.1',
  user: 'sa',
  password: 'P@ssw0rd',
  database: 'WebCW'
});

// Connect to MySQL
db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL');
});

// Login API
app.post('/login', (req, res) => {
  const { username, password } = req.body;

  const query = 'SELECT * FROM users WHERE username = ? AND password = ?';
  db.query(query, [username, password], (err, results) => {
    if (err) {
      return res.status(500).json({ error: err });
    }
    if (results.length > 0) {
      res.json({ message: 'Login successful', user: results[0] });
    } else {
      res.status(401).json({ message: 'Invalid username or password' });
    }
  });
});

// Insert Data API for Flutter
app.post('/addData', (req, res) => {
  const { name, age, img } = req.body;

  const sql = 'INSERT INTO messages (name, age, img) VALUES (?, ?, ?)';
  db.query(sql, [name, age, img], (err, result) => {
    if (err) {
      res.status(500).send({ message: 'Error saving data', error: err });
    } else {
      res.send({ message: 'Data saved successfully', data: result });
    }
  });
});

// Start server
const port = 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
