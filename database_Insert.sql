INSERT INTO Team(Team_name)
VALUES
	('Kolkata Knight Riders'),
	('Royal Challengers Bangalore'),
	('Chennai Super Kings Squad'),
	('Rajasthan Royals'),
	('Punjab Kings'),
	('Mumbai Indians'),
	('Delhi Capitals'),
	('Sunrisers Hyderabad');


INSERT INTO Rolls(Roll_id, Roll)
VALUES
	(1,'Batsman'),
	(2,'Bowler'),
	(3, 'All Rounder'),
	(4,'Wicket Keeper'),
	(5,'Batting coach'),
	(6,'Bowling coach'),
	(7,'Captain');

INSERT INTO Support_staff(Name, Team_id, Roll_id)
VALUES
	('Ghambir', 1, 5),
	('Laxmi Narayan', 1, 6),
	('Shree Dharam', 2, 5),
	('Adam Grif', 2, 6),
	('Stifan', 3, 5),
	('Danial', 3, 6),
	('Amol', 4, 5),
	('Sangakara', 4, 6),
	('Rahul Dravid', 5, 5),
	('Anil Kumble', 5, 6),
	('Sachin', 6, 5),
	('Shain Bond', 6, 6),
	('Ricky Ponting', 7, 5),
	('Praveen Tambe', 7, 6),
	('Tom Moddy', 8, 5),
	('Criss Aven', 8, 6);
	


INSERT INTO Owner(Team_id, Owner_name, Address )
VALUES
	(1, 'Shahrukh Khan', 'A 50 Lajpat Nagar'),
	(2, 'Maliya', 'B 40 Laxmi Nagar'),
	(3, 'Ram Charan',' C 60 jpt'),
	(4, 'Waris souran',' D 55 AlokNagar'),
	(5, 'Preeti', 'C 3 LK Delhi'),
	(6, 'Ambani', 'E 50 Dk Pull'),
	(7, 'Danish', 'F 50 AL Nagar'),
	(8, 'Atul', 'G 50 Vishvas Nagar');
	

/* get Player data from CSV file but please system path according your system */
COPY Player FROM 'C:\Users\souran\Desktop\saqib_project\player.csv' WITH CSV HEADER;



/* get Player roll data from CSV file but please system path according your system */
COPY Player_roll FROM 'C:\Users\souran\Desktop\saqib_project\player_roll.csv' WITH CSV HEADER;



INSERT INTO Venue(Home_Team_Name, Venue_name, City )
VALUES
	('Kolkata Knight Rider','Eden Gardens', 'Kolkata'),
	('Mumbai Indian','Wankhede Stadium', 'Mumbai'),
	('Delhi Capitals','Arun Jaitley Stadium', 'Delhi'),
	('Punjab Kings','Mohali', 'Punjab'),
	('Rajasthan Royals', 'Jawaharlal Nehru Stadium', 'Rajasthans');



/* get matches data from CSV file but please system path according your system */
COPY matches FROM 'C:\Users\souran\Desktop\saqib_project\match.csv' WITH CSV HEADER;



/* get Indivisual_Score data from CSV file but please system path according your system */
COPY Indivisual_Score FROM 'C:\Users\souran\Desktop\saqib_project\Indivisual_Score.csv' WITH CSV HEADER;
