DROP TABLE Posts;
/*DROP TABLE Users;
DROP TABLE Profile;*/

CREATE TABLE Users (
    username VARCHAR(12) NOT NULL UNIQUE,
    password VARCHAR(15) NOT NULL,
    joindate DATE DEFAULT CURRENT_DATE,
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY
);

CREATE TABLE Profile (
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    email VARCHAR(100) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    userid int,
    profid INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY
);


CREATE TABLE Posts (
    content VARCHAR(140) NOT NULL,
    authorid INT NOT NULL,
    postdate DATE DEFAULT CURRENT_DATE,
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY
);

INSERT INTO Users (username, password, joindate) VALUES
    ('johndoe', 'password', '2013-05-09'),
    ('jilljack', 'password', '2013-10-31');

INSERT INTO Profile (firstname, lastname, email, zip, userid) VALUES
    ('John', 'Doe', 'jd@example.com', '98008',1),
    ('Jill', 'Jack', 'jj@nowhere.com', '24201',2);


INSERT INTO Posts (content, authorid, postdate) VALUES
    ('I''m a white-hat hacking my wonky Twonky server.', 1, '2013-05-09'),
    ('My wonky Twonky server conked out.', 1, '2014-06-23'),
    ('I see good reason not to configure Twonky.', 2, '2013-11-01');

ALTER TABLE Posts
ADD FOREIGN KEY (authorid)
REFERENCES Users(id);

ALTER TABLE Profile
ADD FOREIGN KEY (userid)
REFERENCES Users(id);
