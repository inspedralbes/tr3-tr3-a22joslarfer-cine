
-- delete all data from the table
DELETE FROM movies;
-- insert data into the table movies
ALTER TABLE movies ADD COLUMN poster_bg1 DATE;
ALTER TABLE movies ADD COLUMN poster_bg2 DATE;



INSERT INTO movies (title, year, rating, poster, synopsis, genre_id, showing_date, poster_bg1, poster_bg2) VALUES
('Suspiria 2', 2018, 6.8, 'https://m.media-amazon.com/images/M/MV5BZGRjNjljOGEtZjFmMi00YzU1LWIxOWYtZTQzODMzNDQzMzY1XkEyXkFqcGdeQXVyNDE5MTU2MDE@._V1_.jpg', 'A darkness swirls at the center of a world-renowned dance company, one that will engulf the artistic director, an ambitious young dancer, and a grieving psychotherapist.', 2, '2024-05-01', 
'posters-large/suspiria1.jpg', 'posters-large/suspiria2.jpg'
),

('The Shining', 1980, 8.4, 'https://m.media-amazon.com/images/M/MV5BZWFlYmY2MGEtZjVkYS00YzU4LTg0YjQtYzY1ZGE3NTA5NGQxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg', 'A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future.', 3, '2024-05-02,'
'posters-large/theshining1.webp', 'posters-large/theshining2.webp'
),

('The Lighthouse', 2019, 7.5, 'https://m.media-amazon.com/images/M/MV5BZmE0MGJhNmYtOWNjYi00Njc5LWE2YjEtMWMxZTVmODUwMmMxXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg', 'Two lighthouse keepers try to maintain their sanity while living on a remote and mysterious New England island in the 1890s.', 4, '2024-05-03',
'posters-large/thelighthouse1.jpg', 'posters-large/thelighthouse2.jpg'
),


('Alien', 1979, 8.4, 'https://m.media-amazon.com/images/M/MV5BOGQzZTBjMjQtOTVmMS00NGE5LWEyYmMtOGQ1ZGZjNmRkYjFhXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_.jpg', 'After a space merchant vessel perceives an unknown transmission as a distress call, its landing on the source moon finds one of the crew attacked by a mysterious lifeform.', 5, '2024-05-04',
'posters-large/alien2.jpg', 'posters-large/alien1.jpg'
),


('Pulp Fiction', 1994, 8.9, 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 6, '2024-05-05',
'posters-large/pulpfiction2.jpg', 'posters-large/pulpfiction1.jpg'
),


('The Matrix', 1999, 8.7, 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 1, '2024-05-06',
'posters-large/thematrix1.jpg', 'posters-large/thematrix2.jpg'
),

('Dark City', 1998, 7.6, 'https://m.media-amazon.com/images/M/MV5BMGExOGExM2UtNWM5ZS00OWEzLTllNzYtM2NlMTJlYjBlZTJkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg', 'A man struggles with memories of his past, which includes a wife he cannot remember, and a nightmarish world without a sun.', 1, '2024-05-07', 
'posters-large/darkcity1.jpg', 'posters-large/darkcity2.jpg'
);


-- add poster_bg1 and poster_bg2 VALUES to the movies table using WHERE

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
```
