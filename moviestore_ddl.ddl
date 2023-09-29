-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2023-09-29 13:08:40 EDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE billing (
    transaction_id INTEGER NOT NULL,
    bill_date      DATE,
    fname          CLOB,
    email          CLOB,
    movie_id       CLOB,
    order_total    FLOAT,
    payment_method CLOB,
    username       CLOB,
    user_user_id   INTEGER NOT NULL
);

ALTER TABLE billing ADD CONSTRAINT billing_pk PRIMARY KEY ( transaction_id );

CREATE TABLE director (
    director_id          INTEGER NOT NULL,
    first_name           CLOB,
    last_name            CLOB,
    nationality          CLOB,
    director_description CLOB,
    date_of_birth        DATE,
    movie_movie_id       INTEGER NOT NULL
);

ALTER TABLE director ADD CONSTRAINT director_pk PRIMARY KEY ( director_id );

CREATE TABLE genre (
    genre_id       INTEGER NOT NULL,
    genre          VARCHAR2(300 CHAR),
    movie_movie_id INTEGER NOT NULL
);

ALTER TABLE genre ADD CONSTRAINT genre_pk PRIMARY KEY ( genre_id );

CREATE TABLE language (
    language_id    INTEGER,
    language       CLOB,
    movie_movie_id INTEGER NOT NULL
);

CREATE TABLE movie (
    movie_id               INTEGER NOT NULL,
    title                  VARCHAR2(300 CHAR),
    cast                   CLOB,
    director_id            INTEGER,
    country_origin         VARCHAR2(300 CHAR),
    runtime                DATE,
    cost                   FLOAT(5),
    video_format           CLOB,
    relese_date            DATE,
    rating                 FLOAT(1),
    genre_id               INTEGER,
    movie_description      CLOB,
    language_id            INTEGER,
    company_id             INTEGER,
    user_user_id           INTEGER NOT NULL,
    billing_transaction_id INTEGER NOT NULL
);

ALTER TABLE movie ADD CONSTRAINT movie_pk PRIMARY KEY ( movie_id );

CREATE TABLE productioncompany (
    company_id     INTEGER NOT NULL,
    company_name   CLOB,
    movie_id       INTEGER,
    filmstyle_info CLOB,
    movie_movie_id INTEGER NOT NULL
);

ALTER TABLE productioncompany ADD CONSTRAINT productioncompany_pk PRIMARY KEY ( company_id );

CREATE TABLE "User" (
    user_id        INTEGER NOT NULL,
    username       CLOB,
    fname          CLOB,
    lname          CLOB,
    transaction_id CLOB,
    current_points FLOAT,
    email          CLOB,
    date_of_birth  DATE,
    password       CHAR 
--  WARNING: CHAR size not specified 

);

ALTER TABLE "User" ADD CONSTRAINT user_pk PRIMARY KEY ( user_id );

ALTER TABLE billing
    ADD CONSTRAINT billing_user_fk FOREIGN KEY ( user_user_id )
        REFERENCES "User" ( user_id );

ALTER TABLE director
    ADD CONSTRAINT director_movie_fk FOREIGN KEY ( movie_movie_id )
        REFERENCES movie ( movie_id );

ALTER TABLE genre
    ADD CONSTRAINT genre_movie_fk FOREIGN KEY ( movie_movie_id )
        REFERENCES movie ( movie_id );

ALTER TABLE language
    ADD CONSTRAINT language_movie_fk FOREIGN KEY ( movie_movie_id )
        REFERENCES movie ( movie_id );

ALTER TABLE movie
    ADD CONSTRAINT movie_billing_fk FOREIGN KEY ( billing_transaction_id )
        REFERENCES billing ( transaction_id );

ALTER TABLE movie
    ADD CONSTRAINT movie_user_fk FOREIGN KEY ( user_user_id )
        REFERENCES "User" ( user_id );

ALTER TABLE productioncompany
    ADD CONSTRAINT productioncompany_movie_fk FOREIGN KEY ( movie_movie_id )
        REFERENCES movie ( movie_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 1
