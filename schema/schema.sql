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

CREATE TABLE Genre (
  id SERIAL NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
)

CREATE MusicAlbum (
  id SERIAL NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  publish_date DATE NOT NULL, 
  archived BOOLEAN NOT NULL, 
  genre_id INT NULL,
  author_id INT NULL,
  label_id INT NULL,
  FOREIGN KEY (genre_id) REFERENCES Genre (id),
  FOREIGN KEY (author_id) REFERENCES Author (id),
  FOREIGN KEY (label_id) REFERENCES Label (id),
  PRIMARY KEY (id)
)

