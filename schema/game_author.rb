CREATE TABLE IF NOT EXISTS 'author' (
  'id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'first_name' TEXT NOT NULL,
  'last_name' TEXT NOT NULL,
  'publish_date' DATE NOT NULL,
  'item_id' INTEGER REFERENCES 'item' ('id')
);

CREATE TABLE IF NOT EXISTS 'game' (
  'id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'multiplayer' TEXT NOT NULL,
  'last_played_at' DATE NOT NULL,
  'item_id' INTEGER REFERENCES 'item' ('id')
);
