CREATE DATABASE IF NOT EXISTS YoutubeDB;
USE YoutubeDB;

CREATE TABLE YoutubeDB.`User` (
	id INT auto_increment NOT NULL,
	email varchar(255) NOT NULL,
	password varchar(100) NOT NULL,
	username varchar(255) NOT NULL,
	date_of_birth DATE NOT NULL,
	sex ENUM('M', 'F') NOT NULL,
	country varchar(100) NOT NULL,
	postal_code varchar(20) NOT NULL,
	CONSTRAINT User_PK PRIMARY KEY (id),
	CONSTRAINT User_UNIQUE UNIQUE KEY (email),
	CONSTRAINT User_UNIQUE_1 UNIQUE KEY (username)
)

CREATE TABLE videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    size BIGINT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    length TIME NOT NULL,
    thumbnail VARCHAR(255),
    views INT DEFAULT 0,
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0,
    status ENUM('public', 'hidden', 'private') NOT NULL,
    published_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES YoutubeDB.`User`(id)
);

CREATE TABLE tags (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE video_tags (
    video_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (video_id, tag_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);

CREATE TABLE channels (
    channel_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    creation_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES YoutubeDB.`User`(id)
);

CREATE TABLE subscriptions (
    user_id INT NOT NULL,
    channel_id INT NOT NULL,
    subscription_date DATETIME NOT NULL,
    PRIMARY KEY (user_id, channel_id),
    FOREIGN KEY (user_id) REFERENCES YoutubeDB.`User`(id),
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
);

CREATE TABLE video_likes (
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    liked_at DATETIME NOT NULL,
    PRIMARY KEY (user_id, video_id),
    FOREIGN KEY (user_id) REFERENCES YoutubeDB.`User`(id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

CREATE TABLE video_dislikes (
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    disliked_at DATETIME NOT NULL,
    PRIMARY KEY (user_id, video_id),
    FOREIGN KEY (user_id) REFERENCES YoutubeDB.`User`(id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

CREATE TABLE playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    creation_date DATETIME NOT NULL,
    status ENUM('public', 'private') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES YoutubeDB.`User`(id)
);

CREATE TABLE playlist_videos (
    playlist_id INT NOT NULL,
    video_id INT NOT NULL,
    PRIMARY KEY (playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    text TEXT NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES YoutubeDB.`User`(id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

CREATE TABLE comment_likes (
    user_id INT NOT NULL,
    comment_id INT NOT NULL,
    liked_at DATETIME NOT NULL,
    PRIMARY KEY (user_id, comment_id),
    FOREIGN KEY (user_id) REFERENCES YoutubeDB.`User`(id),
    FOREIGN KEY (comment_id) REFERENCES comments(comment_id)
);

CREATE TABLE comment_dislikes (
    user_id INT NOT NULL,
    comment_id INT NOT NULL,
    disliked_at DATETIME NOT NULL,
    PRIMARY KEY (user_id, comment_id),
    FOREIGN KEY (user_id) REFERENCES YoutubeDB.`User`(id),
    FOREIGN KEY (comment_id) REFERENCES comments(comment_id)
);

