const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const db = require('./dbConfig'); // เรียกใช้การตั้งค่าจากไฟล์ dbConfig.js

const app = express();
app.use(cors());
app.use(bodyParser.json());

// ตัวอย่าง API สำหรับ login
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

const port = 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
