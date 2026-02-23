import 'dotenv/config';
import express from 'express';
// import DB from './config/db';

const app = express();

app.get('/todos', (req, res) => {
  res.json({
    todos: [{ id: 1, title: 'Buy groceries', completed: false }],
  });
});

// app.get('/todos', async (req, res) => {
//   try {
//     const result = await DB.query('SELECT * FROM todos');
//     res.json({ todos: result.rows });
//   } catch (err) {
//     console.error(err);
//     res.status(500).json({ error: 'Database error' });
//   }
// });

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
