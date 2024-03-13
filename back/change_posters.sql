ALTER TABLE movies ADD poster_bg1 VARCHAR(255);
ALTER TABLE movies ADD poster_bg2 VARCHAR(255);

https://shotdeck.com/assets/images/stills/N95CFE36.jpg lighthouse1
https://shotdeck.com/assets/images/stills/GRBM1OUJ.jpg lighthouse2
https://shotdeck.com/assets/images/stills/K1FNOUZF.jpg lighthouse3

https://shotdeck.com/assets/images/stills/1VAHDORA.jpg matrix1
https://shotdeck.com/assets/images/stills/1XEVMCAR.jpg matrix2
https://shotdeck.com/assets/images/stills/8LFM465B.jpg matrix3

https://shotdeck.com/assets/images/stills/5A8R6HAX.jpg alien1
https://shotdeck.com/assets/images/stills/34WR95LI.jpg alien2

https://shotdeck.com/assets/images/stills/MK2FSPOT.jpg darkcity1
https://shotdeck.com/assets/images/stills/OV3RII35.jpg darkcity2
https://shotdeck.com/assets/images/stills/118EQZ5G.jpg darkcity3
https://shotdeck.com/assets/images/stills/U2X4AWJW.jpg darkcity4

https://shotdeck.com/assets/images/stills/1M76EHAG.jpg suspiria1
https://shotdeck.com/assets/images/stills/X4UC5AC8.jpg suspiria2

https://shotdeck.com/assets/images/stills/LY7LI2XL.jpg salaroja1
https://shotdeck.com/assets/images/stills/6UKPHFQJ.jpg salaroja2
https://shotdeck.com/assets/images/stills/TDSIUUPB.jpg salaroja3
https://shotdeck.com/assets/images/stills/2LLI7G3U.jpg salaroja4
https://shotdeck.com/assets/images/stills/V5WQJD6I.jpg salaroja5

https://shotdeck.com/assets/images/stills/LII1CFYU.jpg fiction1
https://shotdeck.com/assets/images/stills/MBZBNL17.jpg fiction2



UPDATE movies SET poster = 'https://m.media-amazon.com/images/M/MV5BZGRjNjljOGEtZjFmMi00YzU1LWIxOWYtZTQzODMzNDQzMzY1XkEyXkFqcGdeQXVyNDE5MTU2MDE@._V1_.jpg' WHERE title = 'Suspiria 2';
UPDATE movies SET poster = 'https://m.media-amazon.com/images/M/MV5BZWFlYmY2MGEtZjVkYS00YzU4LTg0YjQtYzY1ZGE3NTA5NGQxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg' WHERE title = 'The Shining';
UPDATE movies SET poster = 'https://m.media-amazon.com/images/M/MV5BZmE0MGJhNmYtOWNjYi00Njc5LWE2YjEtMWMxZTVmODUwMmMxXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg' WHERE title = 'The Lighthouse';
UPDATE movies SET poster = 'https://m.media-amazon.com/images/M/MV5BOGQzZTBjMjQtOTVmMS00NGE5LWEyYmMtOGQ1ZGZjNmRkYjFhXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_.jpg' WHERE title = 'Alien';
UPDATE movies SET poster = 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg' WHERE title = 'Pulp Fiction';
UPDATE movies SET poster = 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg' WHERE title = 'The Matrix';
UPDATE movies SET poster = 'https://m.media-amazon.com/images/M/MV5BMGExOGExM2UtNWM5ZS00OWEzLTllNzYtM2NlMTJlYjBlZTJkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg' WHERE title = 'Dark City';


UPDATE movies SET poster_bg1 = 'posters-large/suspiria1.jpg' WHERE title = 'Suspiria 2';
UPDATE movies SET poster_bg2 = 'posters-large/suspiria2.jpg' WHERE title = 'Suspiria 2';

UPDATE movies SET poster_bg1 = 'posters-large/thelighthouse1.jpg' WHERE title = 'The Lighthouse';
UPDATE movies SET poster_bg2 = 'posters-large/thelighthouse2.jpg' WHERE title = 'The Lighthouse';

UPDATE movies SET poster_bg1 = 'posters-large/alien1.jpg' WHERE title = 'Alien';
UPDATE movies SET poster_bg2 = 'posters-large/alien2.jpg' WHERE title = 'Alien';

UPDATE movies SET poster_bg1 = 'posters-large/pulpfiction1.jpg' WHERE title = 'Pulp Fiction';
UPDATE movies SET poster_bg2 = 'posters-large/pulpfiction2.jpg' WHERE title = 'Pulp Fiction';

UPDATE movies SET poster_bg1 = 'posters-large/thematrix1.jpg' WHERE title = 'The Matrix';
UPDATE movies SET poster_bg2 = 'posters-large/thematrix2.jpg' WHERE title = 'The Matrix';

UPDATE movies SET poster_bg1 = 'posters-large/darkcity1.jgp' WHERE title = 'Dark City';
UPDATE movies SET poster_bg2 = 'posters-large/darkcity2.jpg' WHERE title = 'Dark City';