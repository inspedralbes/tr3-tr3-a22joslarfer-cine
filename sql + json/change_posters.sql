ALTER TABLE movies ADD poster_bg1 VARCHAR(255);
ALTER TABLE movies ADD poster_bg2 VARCHAR(255);




UPDATE movies SET poster_bg1 = 'posters-large/suspiria1-min.jpg' WHERE title = 'Suspiria 2';
UPDATE movies SET poster_bg2 = 'posters-large/suspiria2-min.jpg' WHERE title = 'Suspiria 2';

UPDATE movies SET poster_bg1 = 'posters-large/thelighthouse1-min.jpg' WHERE title = 'The Lighthouse';
UPDATE movies SET poster_bg2 = 'posters-large/thelighthouse2-min.jpg' WHERE title = 'The Lighthouse';

UPDATE movies SET poster_bg1 = 'posters-large/alien1-min.jpg' WHERE title = 'Alien';
UPDATE movies SET poster_bg2 = 'posters-large/alien2-min.jpg' WHERE title = 'Alien';

UPDATE movies SET poster_bg1 = 'posters-large/pulpfiction1-min.jpg' WHERE title = 'Pulp Fiction';
UPDATE movies SET poster_bg2 = 'posters-large/pulpfiction2-min.jpg' WHERE title = 'Pulp Fiction';

UPDATE movies SET poster_bg1 = 'posters-large/thematrix1-min.jpg' WHERE title = 'The Matrix';
UPDATE movies SET poster_bg2 = 'posters-large/thematrix2-min.jpg' WHERE title = 'The Matrix';

UPDATE movies SET poster_bg1 = 'posters-large/darkcity1.jgp' WHERE title = 'Dark City';
UPDATE movies SET poster_bg2 = 'posters-large/darkcity2-min.jpg' WHERE title = 'Dark City';

UPDATE movies SET poster_bg1 = 'posters-large/theshining1.webp' WHERE title = 'The Shining';
UPDATE movies SET poster_bg2 = 'posters-large/theshining2-min.jpg' WHERE title = 'The Shining';