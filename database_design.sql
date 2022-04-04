# ADLISTER APP
# Users sign up for the site with an email and password
# Users create ads with a title and description and category.
# Each ad is associated with the user that created it.
# An ad can be in one or more categories (for example, "help wanted", "giveaway", or "furniture")

CREATE TABLE IF NOT EXISTS user (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ad (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(255) NOT NULL,
    creator_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(creator_id) REFERENCES user (id)
);

CREATE TABLE IF NOT EXISTS category (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    class VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ad_category(
    ad_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ad (id),
    FOREIGN KEY (category_id) REFERENCES category (id)
);

# For a given ad, what is the email address of the user that created it?
SELECT u.email
FROM ad
JOIN user AS u ON u.id = ad.creator_id
WHERE ad.id = 'given';
# For a given ad, what category, or categories, does it belong to?
SELECT c.id
FROM ad
JOIN ad_category AS ac on ad.id = ac.ad_id
JOIN category AS c on c.id = ac.category_id
WHERE ad.id = 'given';
# For a given category, show all the ads that are in that category.
SELECT ad.id
FROM category AS c
JOIN ad_category AS ac on c.id = ac.category_id
JOIN ad on ad.id = ac.ad_id
WHERE c.id = 'given';
# For a given user, show all the ads they have posted.
SELECT ad.title
FROM user
JOIN ad on user.id = ad.creator_id
WHERE user.id = 'given';


# QUIZ APP
# Administrators create questions
# Administrators create answers for each question
#   Each question should have one correct answer
# Administrators create quizzes
#   Quizzes have one or more questions associated with them
# Students (users) take quizzes
#   The application should record a student's answers for each question on the quiz

