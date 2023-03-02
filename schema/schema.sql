CREATE TABLE IF NOT EXISTS 'author' (
  'id' integer PRIMARY KEY AUTOINCREMENT,
  'first_name' text NOT NULL,
  'last_name' text NOT NULL,
);

CREATE TABLE IF NOT EXISTS 'game' (
  'id' integer PRIMARY KEY AUTOINCREMENT,
  'multiplayer' text NOT NULL,
  'last_played_at' date NOT NULL,
  'item_id' integer REFERENCES 'item'
);
