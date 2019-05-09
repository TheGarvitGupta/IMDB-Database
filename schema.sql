-- Connection string for the students (READ ONLY)
-- sqlplus 'student@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=oracleimdb.cmkp3uvpymor.us-east-2.rds.amazonaws.com) (PORT=1521))(CONNECT_DATA=(SID=ORCL)))'
-- Password: weakpassword

-- Master connection string (ADMIN)
-- sqlplus 'master@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=oracleimdb.cmkp3uvpymor.us-east-2.rds.amazonaws.com) (PORT=1521))(CONNECT_DATA=(SID=ORCL)))'
-- Password: Susan!#%24

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

-- INSERT INTO Cast_In(movie_id, cast_id, charac) VALUES ("862", "31", "Woody (voice)");
CREATE TABLE cast_in_imdb {
	movie_id number(7) NOT NULL;
	cast_id number(7) NOT NULL;
	charac VARCHAR(255) NOT NULL;
}

-- INSERT INTO Movie_Cast(id, gender, name) VALUES ("31", "2", "Tom Hanks");
CREATE TABLE cast_imdb {
	id number(7) NOT NULL;
	gender number(7) NOT NULL;
	name VARCHAR(255) NOT NULL;
}

-- INSERT INTO Keyword(name) VALUES ("superhuman");
CREATE TABLE cleaned_keyword_imdb {
	name VARCHAR(255)
}

-- INSERT INTO Crew_In(movie_id, crew_id, job) VALUES ("862", "7879", "Director");
CREATE TABLE crew_in_imdb {
	movie_id number(7)
	crew_id number(7)
	job VARCHAR(255)

}

-- INSERT INTO Crew(id, gender, name) VALUES ("7879", "2", "John Lasseter");
CREATE TABLE crew_imdb {
	id number(7)
	gender number(7)
	name VARCHAR(255)
}

-- INSERT INTO Movie_Genre(movie_id, genre_name) VALUES("16612","Documentary");
CREATE TABLE finalized_genre_movie_imdb {
	movie_id number(7)
	genre_name VARCHAR(255)
}

-- INSERT INTO Movie(movie_id, title,runtime,release_year,rating,num_ratings) VALUES("16612","Carmencita","1","1894","5.8","1436");
CREATE TABLE finalized_movie_imdb (
	movie_id number(7),
	title VARCHAR(255),
	runtime number(7),
	release_year number(7),
	rating float(2),
	num_ratings number(7),
	CONSTRAINT movie_pk PRIMARY KEY (movie_id)
)

-- INSERT INTO Genre (name) VALUES ("Action")
CREATE TABLE genres_imdb {
	name VARCHAR(255) PRIMARY KEY
}

-- INSERT INTO Movie_Keyword(kwd_name, movie_id) VALUES ("jealousy", "862");
CREATE TABLE movie_keyword_imdb {
	kwd_name VARCHAR(255)
	movie_id number(7) REFERENCES
}