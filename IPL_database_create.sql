DROP TABLE IF EXISTS Indivisual_Score;
DROP TABLE IF EXISTS Matches cascade;
DROP TABLE IF EXISTS Owner cascade;
DROP TABLE IF EXISTS Player cascade;
DROP TABLE IF EXISTS Rolls cascade;
DROP TABLE IF EXISTS Player_roll cascade;
DROP TABLE IF EXISTS Support_staff cascade;
DROP TABLE IF EXISTS Team cascade;
DROP TABLE IF EXISTS Venue cascade;



CREATE TABLE Team (
   Team_id  SERIAL  NOT NULL,
   Team_name  varchar(50) NOT NULL,
  PRIMARY KEY ( Team_id )
);



CREATE TABLE  Rolls  (
   Roll_id  int NOT NULL,
   Roll  varchar(50) NOT NULL,
   
   PRIMARY KEY ( Roll_id )

);



CREATE TABLE  Support_staff  (
   Support_staff_id  SERIAL  NOT NULL,
   Name varchar(50) NOT NULL,
   Team_id  int,
   Roll_id  int,
  
	PRIMARY KEY ( Support_staff_id ),
	
	CONSTRAINT fk_team
		FOREIGN KEY ( Team_id ) REFERENCES  Team( Team_id )
			,
	CONSTRAINT fk_roll
		FOREIGN KEY ( Roll_id ) REFERENCES  Rolls( Roll_id )
		
);



CREATE TABLE  Owner  (
   Owner_id  SERIAL  NOT NULL,
   Team_id  int,
   Owner_name  varchar(50) NOT NULL,
   Address  text,
  
  PRIMARY KEY ( Owner_id ),
  CONSTRAINT fk_team
	FOREIGN KEY ( Team_id ) REFERENCES  Team ( Team_id )
		
);


CREATE TABLE  Player  (
   Player_id  SERIAL NOT NULL,
   Player_name  varchar(50) NOT NULL,
   Team_id  int,
  
   
  PRIMARY KEY ( Player_id ),
  CONSTRAINT fk_team
	FOREIGN KEY ( Team_id ) REFERENCES  Team( Team_id )
	
		
);

CREATE TABLE Player_roll (
	Player_id int,
	Roll_id int,
	
	CONSTRAINT fk_roll
	FOREIGN KEY ( Roll_id ) REFERENCES  Rolls( Roll_id ),
	
	 CONSTRAINT fk_player
	FOREIGN KEY ( Player_id ) REFERENCES  Player( Player_id )
); 


CREATE TABLE  Venue  (
   Venue_id  SERIAL  NOT NULL,
   Home_Team_Name  varchar(50) NOT NULL,
   Venue_name  varchar(50) NOT NULL,
   City  varchar(50) NOT NULL,
  PRIMARY KEY ( Venue_id )
);




CREATE TABLE  Matches  (
   Match_id  int  NOT NULL,
   Match_Date date NOT NULL,
   Team_id  int,
   Opponent_Team_Id int NOT NULL,
   Venue_id  int,
   Match_Winner_Id  int NOT NULL,
   
   
  PRIMARY KEY ( Match_id ),
  CONSTRAINT fk_team
	FOREIGN KEY ( Team_id ) REFERENCES  Team ( Team_id )
		,
  CONSTRAINT fk_venue
	FOREIGN KEY ( Venue_id )REFERENCES  Venue ( Venue_id )
  
  CONSTRAINT fk_opponent_team
	FOREIGN KEY ( Opponent_Team_Id )REFERENCES Team ( Team_id )
  
  CONSTRAINT fk_match_winner
	FOREIGN KEY ( Match_Winner_Id )REFERENCES  Team ( Team_id )
		
);




CREATE TABLE  Indivisual_Score  (
   Player_id  int,
   Runs  int,
   Wickets  int,
   Catches  int,
  
  CONSTRAINT fk_player
	FOREIGN KEY ( Player_id ) REFERENCES  Player( Player_id )

		
   
);
