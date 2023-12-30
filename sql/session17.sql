CREATE TABLE users (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  created_at DATETIME DEFAULT NOW()
);

CREATE TABLE photos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  image_url VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  created_at DATETIME NOT NULL DEFAULT NOW(),
  CONSTRAINT FK_user_id FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments(
  id INT PRIMARY KEY AUTO_INCREMENT,
  comment_text VARCHAR(1024),
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  CONSTRAINT FK_comments_user_id FOREIGN KEY(user_id) REFERENCES users(id),
  CONSTRAINT FK_comments_photo_id FOREIGN KEY(photo_id) REFERENCES photos(id)
);

CREATE TABLE likes(
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  CONSTRAINT FK_likes_user_id FOREIGN KEY(user_id) REFERENCES users(id),
  CONSTRAINT FK_likes_photo_id FOREIGN KEY(photo_id) REFERENCES photos(id),
  PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows(
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  FOREIGN KEY(follower_id) REFERENCES users(id),
  FOREIGN KEY(followee_id) REFERENCES users(id),
  PRIMARY KEY(follower_id, followee_id)
);

ALTER TABLE photos
ADD COLUMN captions VARCHAR(255);

CREATE TABLE tags(
  id INT PRIMARY KEY AUTO_INCREMENT,
  tag_name VARCHAR(255) UNIQUE,
  created_at DATETIME DEFAULT NOW()
);

CREATE TABLE photo_tags(
  photo_id INT NOT NULL,
  tag_id INT NOT NULL,
  FOREIGN KEY(photo_id) REFERENCES photos(id),
  FOREIGN KEY(tag_id) REFERENCES tags(id),
  PRIMARY KEY(photo_id, tag_id)
);
