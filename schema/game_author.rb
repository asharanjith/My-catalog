CREATE TABLE IF NOT EXISTS 'authors' (
  'id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'first_name' TEXT NOT NULL,
  'last_name' TEXT NOT NULL,
  'publish_date' DATE NOT NULL,
  'archived' BOOLEAN NOT NULL DEFAULT FALSE,
);

CREATE TABLE IF NOT EXISTS 'game' (
  'id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'multiplayer' TEXT NOT NULL,
  'last_played_at' DATE NOT NULL,
  'archived' BOOLEAN NOT NULL DEFAULT FALSE,
);