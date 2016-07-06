create table if not exists log
(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  level TEXT,
  message TEXT,
  handler TEXT,
  created_at TIMESTAMP DEFAULT (datetime('now','localtime'))
);
