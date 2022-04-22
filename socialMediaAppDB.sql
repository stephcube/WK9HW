socialmediaDB

create database if not exists socialMediaApp;

use socialMediaApp;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id int NOT NULL AUTO_INCREMENT,
	user_name varchar(20) NOT NULL,
	first_name varchar(40) NOT NULL,
	last_name varchar(40) NOT NULL,
	email varchar(64) NOT NULL,
	password varchar(40) NOT NULL,
	PRIMARY KEY (user_id),
	UNIQUE KEY (user_name),
	UNIQUE KEY (email)
);

CREATE TABLE posts (
	post_id int NOT NULL AUTO_INCREMENT,
	user_id int NOT NULL,
	post_title varchar(128) NOT NULL,
	post text NOT NULL,
	post_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (post_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE comments (
	comment_id int NOT NULL AUTO_INCREMENT,
	user_id int NOT NULL,
	post_id int NOT NULL,
	comment text NOT NULL,
	comment_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (comment_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (post_id) REFERENCES posts (post_id) ON DELETE CASCADE
);

