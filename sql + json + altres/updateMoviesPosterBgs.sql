

-- add poster_bg1 and poster_bg2 VALUES to the movies table using WHERE



ALTER TABLE movies ADD poster_bg1 VARCHAR(255);
ALTER TABLE movies ADD poster_bg2 VARCHAR(255);


UPDATE movies SET poster_bg1 = 'posters-large/suspiria1.jpg' WHERE title = 'Suspiria 2';
UPDATE movies SET poster_bg2 = 'posters-large/suspiria2.jpg' WHERE title = 'Suspiria 2';

UPDATE movies SET poster_bg1 = 'posters-large/theshining1.webp' WHERE title = 'The Shining';
UPDATE movies SET poster_bg2 = 'posters-large/theshining2.webp' WHERE title = 'The Shining';

UPDATE movies SET poster_bg1 = 'posters-large/thelighthouse1.jpg' WHERE title = 'The Lighthouse';
UPDATE movies SET poster_bg2 = 'posters-large/thelighthouse2.jpg' WHERE title = 'The Lighthouse';

UPDATE movies SET poster_bg1 = 'posters-large/alien1.webp' WHERE title = 'Alien';
UPDATE movies SET poster_bg2 = 'posters-large/alien2.jpg' WHERE title = 'Alien';

UPDATE movies SET poster_bg1 = 'posters-large/pulpfiction2.jpg' WHERE title = 'Pulp Fiction';
UPDATE movies SET poster_bg2 = 'posters-large/pulpfiction1.jpg' WHERE title = 'Pulp Fiction';

UPDATE movies SET poster_bg1 = 'posters-large/thematrix1.jpg' WHERE title = 'The Matrix';
UPDATE movies SET poster_bg2 = 'posters-large/thematrix2.jpg' WHERE title = 'The Matrix';

UPDATE movies SET poster_bg1 = 'posters-large/darkcity1.jpg' WHERE title = 'Dark City';
UPDATE movies SET poster_bg2 = 'posters-large/darkcity2.jpg' WHERE title = 'Dark City';




