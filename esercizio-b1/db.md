# table name: uni_bari
id                  BIGINT      PRIMARY KEY     NOTNULL     AUTO_INCREMENT  UNIQUE
id_dipartimento     BIGINT      INDEX   

## table name: dipartimento
id                  BIGINT          PRIMARY KEY     NOTNULL     AUTO_INCREMENT  UNIQUE
id_corso            BIGINT          INDEX   
info_corso          TEXT
inizio_corso        DATE
iscrizioni          TEXT

## table name: corso
id                  BIGINT          PRIMARY KEY     NOTNULL     AUTO_INCREMENT  UNIQUE
id_professore       BIGINT          INDEX 
id_alunno           BIGINT          INDEX 
nome_corso          VARCHAR(100)            
data_inizio         DATE
note                TEXT            NULL

## table name: professore
id                  BIGINT          PRIMARY KEY     NOTNULL     AUTO_INCREMENT  UNIQUE
nome                VARCHAR(100)    NOTNULL
cognome             VARCHAR(100)    NOTNULL 
materia_specifica   VARCHAR(100)    Null
tipo_contratto      VARCHAR(100)    NULL       

## table name: alunno
id                  BIGINT          PRIMARY KEY     NOTNULL     AUTO_INCREMENT  UNIQUE
matricola           VARCHAR(10)     NULL            UNIQUE
nome                VARCHAR(100)    NOTNULL
cognome             VARCHAR(100)    NOTNULL 
telefono            VARCHAR(10)     NULL
data_di_nascita     TIMESTAMP
address             VARCHAR(100)    NULL

## table name: voti
id                  BIGINT          PRIMARY KEY     NOTNULL     AUTO_INCREMENT  UNIQUE
id_appello          BIGINT          INDEX 
id_alunno           BIGINT          INDEX 
esame               VARCHAR(30)                     NOTNULL
voto_esame          TINYINT(2)                      NOTNULL
esame_superato      BOOLEAN                         NOTNULL

## table name: appello_esami
id_corso            BIGINT          INDEX   
id_professore       BIGINT          INDEX 
id_alunno           BIGINT          INDEX 
esame               VARCHAR(30)                     NOTNULL
data_esame          DATE
