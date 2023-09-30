-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2023-09-29 13:08:40 EDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE billing (
    transaction_id INTEGER NOT NULL,
    bill_date            DATE,
    username             VARCHAR(500),
    email                VARCHAR(500),
    order_total          FLOAT,
    payment_method       VARCHAR(500),
    movie_movie_id       INTEGER NOT NULL,
    user_user_id         INTEGER NOT NULL 
    
);

ALTER TABLE billing ADD CONSTRAINT billing_pk PRIMARY KEY ( transaction_id );

CREATE TABLE director (
    director_id          INTEGER NOT NULL,
    first_name           VARCHAR(500),
    last_name            VARCHAR(500),
    nationality          VARCHAR(500),
    director_description CLOB,
    date_of_birth        DATE
);

ALTER TABLE director ADD CONSTRAINT director_pk PRIMARY KEY ( director_id );

CREATE TABLE genre (
    genre_id       INTEGER NOT NULL,
    genre          VARCHAR2(300 CHAR)
);

ALTER TABLE genre ADD CONSTRAINT genre_pk PRIMARY KEY ( genre_id );

CREATE TABLE "language" (
    language_id    INTEGER,
    language       VARCHAR(500)
);

ALTER TABLE genre ADD CONSTRAINT lang_pk PRIMARY KEY ( language_id ); 

CREATE TABLE movie (
    movie_id                        INTEGER NOT NULL,
    title                           VARCHAR(500),
    cast                            CLOB,
    country_origin                  VARCHAR(500),
    runtime                         DATE,
    cost                            FLOAT(5),
    video_format                    VARCHAR(500),
    relese_date                     DATE,
    rating                          FLOAT(1),
    movie_description               CLOB,
    genre_genre_id                  INTEGER NOT NULL,
    director_director_id            INTEGER NOT NULL,
    language_language_id            INTEGER NOT NULL,
    productioncompany_company_id    INTEGER NOT NULL
);

ALTER TABLE movie ADD CONSTRAINT movie_pk PRIMARY KEY ( movie_id );

CREATE TABLE productioncompany (
    company_id          INTEGER NOT NULL,
    company_name        VARCHAR(500),
    filmstyle_info      CLOB,
    movie_movie_id      INTEGER NOT NULL
);

ALTER TABLE productioncompany ADD CONSTRAINT productioncompany_pk PRIMARY KEY ( company_id );

CREATE TABLE "User" (
    user_id                 INTEGER NOT NULL,
    username                VARCHAR(500),
    fname                   VARCHAR(500),
    lname                   VARCHAR(500),
    billing_transaction_id  INTEGER NOT NULL,
    current_points          FLOAT,
    email                   VARCHAR(500),
    date_of_birth           DATE,
    movie_movie_id          INTEGER NOT NULL,
    password                VARCHAR(500)

);

ALTER TABLE "User" ADD CONSTRAINT user_pk PRIMARY KEY ( user_id );

ALTER TABLE billing
    ADD CONSTRAINT billing_user_fk FOREIGN KEY ( user_user_id )
        REFERENCES "User" ( user_id );

ALTER TABLE billing
    ADD CONSTRAINT billing_movie_fk FOREIGN KEY ( movie_movie_id )
        REFERENCES movie ( movie_id );

ALTER TABLE movie
    ADD CONSTRAINT movie_genre_fk FOREIGN KEY ( genre_genre_id )
        REFERENCES genre ( genre_id );

ALTER TABLE movie
    ADD CONSTRAINT movie_director_fk FOREIGN KEY ( director_director_id )
        REFERENCES director ( director_id );

ALTER TABLE movie
    ADD CONSTRAINT movie_lang_fk FOREIGN KEY ( language_language_id )
        REFERENCES "language" (language_language_id);

ALTER TABLE movie
    ADD CONSTRAINT movie_pc_fk FOREIGN KEY ( productioncompany_company_id )
        REFERENCES productioncompany ( productioncompany_company_id );

ALTER TABLE productioncompany
    ADD CONSTRAINT productioncompany_movie_fk FOREIGN KEY ( movie_movie_id )
        REFERENCES movie ( movie_id );

ALTER TABLE "User"
    ADD CONSTRAINT user_movie_fk FOREIGN KEY ( movie_movie_id )
        REFERENCES movie ( movie_id );
    
ALTER TABLE "User"
    ADD CONSTRAINT user_bill_fk FOREIGN KEY ( billing_transaction_id )
        REFERENCES billing ( billing_transaction_id );

INSERT INTO thelanguage(LANGUAGE_ID, THELANGUAGE)
VALUES (1, 'English'); 

INSERT INTO genre(GENRE_ID, GENRE)
VALUES (1, 'Comedy');

INSERT INTO director(DIRECTOR_ID, FIRST_NAME, LAST_NAME, NATIONALITY, DIRECTOR_DESCRIPTION, DATE_OF_BIRTH)
VALUES (1, 'John', 'Dars', 'USA', 'Visionary maestro of laughter, crafting comedic masterpieces that tickle the funny bone and warm the heart.', TO_DATE('1970-01-01', 'YYYY-MM-DD'));

INSERT INTO productioncompany(COMPANY_ID, COMPANY_NAME, FILMSTYLE_INFO, MOVIES)
VALUES (5, 'Cinematic Creations', 'Specializing in visually stunning and emotionally resonant films', 'Laugh Fest');

INSERT INTO movie(movie_id, title, thecast, country_origin, runtime, thecost, video_format, release_date, rating, movie_description, genre_id, director_id, language_id, company_id)
VALUES (2, 'Laugh Fest', 'Emma Watson, Tom Hanks', 'USA', 144, 200, 'HD', TO_DATE('2023-11-15', 'YYYY-MM-DD'), 4.5, 'A hilarious comedy for all ages', 1, 1, 1, 5);

INSERT INTO "User" (USER_ID, USERNAME, FNAME, LNAME, CURRENT_POINTS, EMAIL, DATE_OF_BIRTH, MOVIE_PURCHASED, PASSKEY)
VALUES (1, 'john_doe', 'John', 'Doe', 150, 'john.doe@example.com', TO_DATE('1992-05-15', 'YYYY-MM-DD'), 'Laugh Fest', 'securepassword123');

INSERT INTO billing(TRANSACTION_ID, BILL_DATE, USERNAME, EMAIL, ORDER_TOTAL, PAYMENT_METHOD, MOVIE_ID, USER_ID)
VALUES (1, TO_DATE('2023-09-30', 'YYYY-MM-DD'), 'john_doe', 'john.doe@example.com', 25.99, 'Credit Card', 2, 1);

