ALTER TABLE hasGenre
ADD CONSTRAINT hasGenre_pk PRIMARY KEY (genre_id, movie_id);

ALTER TABLE hasKeyword
ADD CONSTRAINT hasKeyword_pk PRIMARY KEY (keyword_id, movie_id);

ALTER TABLE belongsTocollection
ADD CONSTRAINT belongsTocollection_pk PRIMARY KEY (collection_id, movie_id);

ALTER TABLE hasProductioncompany 
ADD CONSTRAINT hasProductioncompany_pk PRIMARY KEY (pc_id, movie_id);

ALTER TABLE ratings 
ADD CONSTRAINT ratings_pk PRIMARY KEY (user_id, movie_id);
