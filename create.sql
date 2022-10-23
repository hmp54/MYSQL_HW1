CREATE DATABASE HW1_DATABASE;
USE HW1_DATABASE;

CREATE TABLE Band (band_name VARCHAR(40) NOT NULL, PRIMARY KEY(band_name));

CREATE TABLE Singer (
   id INT NOT NULL,
   singer_F_nm VARCHAR(15) NOT NULL,
   singer_l_nm VARCHAR(15) NOT NULL,
   PRIMARY KEY (id)
   );

CREATE TABLE MusicType ( type VARCHAR(16) NOT NULL, PRIMARY KEY(type));

CREATE TABLE BandSingers(
    band_name VARCHAR(40) NOT NULL,
    singer_id INT NOT NULL,
    FOREIGN KEY (band_name) REFERENCES Band (band_name),
    FOREIGN KEY (singer_id) REFERENCES Singer (id));


CREATE TABLE CD ( 
   num INT NOT NULL, 
   producer VARCHAR(40) NOT NULL, 
   cd_number VARCHAR(4) NOT NULL, 
   title VARCHAR(40) NOT NULL,  
   Type VARCHAR(20) NOT NULL,  
   Band_name VARCHAR(30) NOT NULL, 
   Production_date DATE NOT NULL,  
   price decimal(4,2) UNSIGNED NULL, 
   PRIMARY KEY(num), 
   FOREIGN KEY(type) references MusicType(type), 
   FOREIGN KEY(band_name) references Band (band_name) 
   );

CREATE TABLE CDTracks ( num INT NOT NULL, track_num INT NOT NULL, song_name VARCHAR(40) NOT NULL, minute INT NOT NULL, PRIMARY KEY (num, track_num), FOREIGN KEY(num) references CD (num) );


CREATE TABLE CDSingers( num INT NOT NULL, track_num INT NOT NULL, singer_id INT NOT NULL, FOREIGN KEY (num,
track_num) references CDTracks (num,track_num), FOREIGN KEY (singer_id) references Singer (id), PRIMARY KEY (num, track_num, singer_id) );