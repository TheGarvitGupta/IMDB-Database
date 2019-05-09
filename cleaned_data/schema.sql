-- Connection string for the students (READ ONLY)
-- sqlplus 'student@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=oracleimdb.cmkp3uvpymor.us-east-2.rds.amazonaws.com) (PORT=1521))(CONNECT_DATA=(SID=ORCL)))'
-- Password: weakpassword

-- Master connection string (ADMIN)
-- sqlplus 'master@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=oracleimdb.cmkp3uvpymor.us-east-2.rds.amazonaws.com) (PORT=1521))(CONNECT_DATA=(SID=ORCL)))'

-- Tables:
-- 	cast_in.sql
-- 	cast.sql
-- 	cleaned_keyword.sql
-- 	crew_in.sql
-- 	crew.sql
-- 	finalized_genre_movie.sql
-- 	finalized_movie.sql
-- 	genres.sql
-- 	movie_keyword.sql
-- 

-- sed "s/\"/'/g" cast_in.sql > CLEANED_cast_in.sql
-- sed "s/\"/'/g" cast.sql > CLEANED_cast.sql
-- sed "s/\"/'/g" cleaned_keyword.sql > CLEANED_cleaned_keyword.sql
-- sed "s/\"/'/g" crew_in.sql > CLEANED_crew_in.sql
-- sed "s/\"/'/g" crew.sql > CLEANED_crew.sql
-- sed "s/\"/'/g" finalized_genre_movie.sql > CLEANED_finalized_genre_movie.sql
-- sed "s/\"/'/g" finalized_movie.sql > CLEANED_finalized_movie.sql
-- sed "s/\"/'/g" genres.sql > CLEANED_genres.sql
-- sed "s/\"/'/g" movie_keyword.sql > CLEANED_movie_keyword.sql


--	Drop all tables
DROP TABLE MOVIE;
DROP TABLE GENRE;
DROP TABLE CREW;
DROP TABLE MOVIE_CAST;
DROP TABLE KEYWORD;
DROP TABLE CAST_IN;
DROP TABLE CREW_IN;
DROP TABLE MOVIE_GENRE;
DROP TABLE MOVIE_KEYWORD;

-- INSERT INTO Movie(movie_id, title,runtime,release_year,rating,num_ratings) VALUES("16612","Carmencita","1","1894","5.8","1436");
CREATE TABLE MOVIE (
	movie_id number(7) PRIMARY KEY,
	title VARCHAR(255),
	runtime number(7),
	release_year number(7),
	rating float(2),
	num_ratings number(7)
);

-- INSERT INTO Genre (name) VALUES ("Action")
CREATE TABLE GENRE (
	name VARCHAR(255) PRIMARY KEY
);

-- INSERT INTO Crew(id, gender, name) VALUES ("7879", "2", "John Lasseter");
CREATE TABLE CREW (
	id number(7) PRIMARY KEY,
	gender number(7),
	name VARCHAR(255)
);

-- INSERT INTO Movie_Cast(id, gender, name) VALUES ("31", "2", "Tom Hanks");
CREATE TABLE MOVIE_CAST (
	id number(7) PRIMARY KEY,
	gender number(7) NOT NULL,
	name VARCHAR(255) NOT NULL
);

-- INSERT INTO Keyword(name) VALUES ("superhuman");
CREATE TABLE KEYWORD (
	name VARCHAR(255) PRIMARY KEY
);

-- INSERT INTO Cast_In(movie_id, cast_id, charac) VALUES ("862", "31", "Woody (voice)");
CREATE TABLE CAST_IN (
	movie_id number(7) NOT NULL CONSTRAINT movie_fk_1 REFERENCES MOVIE(movie_id),
	cast_id number(7) NOT NULL CONSTRAINT cast_fk_1 REFERENCES MOVIE_CAST(id),
	charac VARCHAR(255) NOT NULL
);

-- INSERT INTO Crew_In(movie_id, crew_id, job) VALUES ("862", "7879", "Director");
CREATE TABLE CREW_IN (
	movie_id number(7) NOT NULL CONSTRAINT movie_fk_2 REFERENCES MOVIE(movie_id),
	crew_id number(7) NOT NULL CONSTRAINT crew_fk_2 REFERENCES CREW(id),
	job VARCHAR(255)
);

-- INSERT INTO Movie_Genre(movie_id, genre_name) VALUES("16612","Documentary");
CREATE TABLE MOVIE_GENRE (
	movie_id number(7) NOT NULL CONSTRAINT movie_fk_3 REFERENCES MOVIE(movie_id),
	genre_name VARCHAR(255) NOT NULL CONSTRAINT genre_fk_3 REFERENCES GENRE(name)
);

-- INSERT INTO Movie_Keyword(kwd_name, movie_id) VALUES ("jealousy", "862");
CREATE TABLE MOVIE_KEYWORD (
	kwd_name VARCHAR(255),
	movie_id number(7) NOT NULL CONSTRAINT movie_fk_4 REFERENCES MOVIE(movie_id)
);