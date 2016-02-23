DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  user INTEGER
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question INTEGER,
  user INTEGER
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question INTEGER,
  parent_reply INTEGER,
  user INTEGER,
  body VARCHAR(255) NOT NULL
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user INTEGER,
  question INTEGER
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Eric', 'Summins'),
  ('Auseten', 'Geee'),
  ('Brian', 'Hayzlett'),
  ('Carson', 'Swope'),
  ('Meme', 'Doge');

INSERT INTO
  questions (title, body, user)
VALUES
  ('Why are some pepes rare?', 'All pepes are common to me.', 3),
  ('WTF are pepes?', 'They seem retarded...', 4),
  ('Who else is a professional memeologist?', 'I WOW for a living. #dank #memes', 5),
  ('How the f do magnets work?', 'lol like magic?', 4);

INSERT INTO
  question_follows (question, user)
VALUES
  (1, 5),
  (2, 4),
  (2, 2),
  (3, 1);

INSERT INTO
  replies (question, parent_reply, user, body)
VALUES
  (1, NULL, 1, "For the purposes of dankness."),
  (1, NULL, 4, "Scarcity."),
  (2, NULL, 1, "Green cartoon frogs from 4chan."),
  (2, 3, 4, "wtf is a 4chan?"),
  (2, NULL, 2, "only the dankest things on the internet"),
  (2, NULL, 5, "Such dank. So wow."),
  (3, NULL, 1, "No one else here is literally a meme."),
  (3, 7, 2, "How the f is a disembodied dog head using this website? You're literally just a picture of a shibe..."),
  (3, NULL, 4, "You makin bank, brah?");

INSERT INTO
  question_likes (question, user)
VALUES
  (1, 4),
  (2, 1),
  (2, 2),
  (4, 5);
