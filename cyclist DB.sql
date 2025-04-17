
SELECT * FROM Divvy_Q1_2019

SELECT COUNT(DISTINCT(trip_id)) number_trips FROM Divvy_Q1_2019
select distinct(usertype) from Divvy_Q1_2019
select distinct(from_station_name) from Divvy_Q1_2019

--- CHECKING FOR NULL VALUES IN COLUMNS
SELECT * FROM Divvy_Q1_2019
WHERE trip_id IS NULL OR
start_time IS NULL OR 
gender IS NULL OR 
usertype IS NULL OR 
birthyear IS NULL OR 
tripduration IS NULL 


---REPLACING NULL VALUES WITH UNKNOWN IN GENDER COLUMN
UPDATE Divvy_Q1_2019
SET gender = 'Unknown'
WHERE gender IS NULL

---CALCULATING THE AVERAGE BIRTHYEAR 
SELECT AVG(Birthyear) Avg_birthyear FROM Divvy_Q1_2019

---CALCULATING THE MEDIAN OF THE BIRTHYEAR
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Birthyear)
OVER() AS Median_year FROM Divvy_Q1_2019
WHERE birthyear IS NOT NULL


----REPLACING THE NULL VALUES IN THE BIRTHYEAR COLUMN WITH THE MEDIAN VALUE OF THE BIRTHYEAR
UPDATE Divvy_Q1_2019
SET birthyear = 1985 
WHERE birthyear IS NULL


----CREATING 2NF FROM THE MAINTABLE : new table, Stations
CREATE TABLE Stations (
     station_id INT PRIMARY KEY, 
	 station_name VARCHAR(255)
	 )

INSERT INTO Stations(station_id, station_name)
SELECT DISTINCT from_station_id, from_station_name FROM Divvy_Q1_2019
UNION
SELECT DISTINCT to_station_id, to_station_name FROM Divvy_Q1_2019

SELECT * FROM Stations

----2nd table from 2NF: Bikes 
CREATE TABLE Bikes(
Bike_id INT PRIMARY KEY)

INSERT INTO Bikes(Bike_id)
SELECT DISTINCT bikeid FROM Divvy_Q1_2019

SELECT * FROM Bikes

----creating the 3rd table: Users
CREATE TABLE Users(
userid INT IDENTITY(1,1) PRIMARY KEY, 
usertype VARCHAR(255), 
GENDER VARCHAR(255), 
Birthyear INT)

---deleted a Users table created
DROP TABLE Users

INSERT INTO Users(usertype, GENDER, Birthyear)
SELECT DISTINCT usertype, gender, birthyear FROM Divvy_Q1_2019

select * from Users 
where Birthyear = 1985

--- create the 4th table from 2NF: Trips table
CREATE TABLE Trips (
    trip_id INT PRIMARY KEY,
    start_time DATETIME,
    end_time DATETIME,
    trip_duration INT,
    bike_id INT FOREIGN KEY REFERENCES Bikes(bike_id),
    from_station_id INT FOREIGN KEY REFERENCES Stations(station_id),
    to_station_id INT FOREIGN KEY REFERENCES Stations(station_id),
    userid INT FOREIGN KEY REFERENCES Users(userid)
);

INSERT INTO Trips (trip_id, start_time, end_time, trip_duration, bike_id, from_station_id, to_station_id, userid)
SELECT 
    bto.trip_id,
    bto.start_time,
    bto.end_time,
    bto.tripduration,
    bto.bikeid,
    bto.from_station_id,
    bto.to_station_id,
    u.userid
FROM 
    Divvy_Q1_2019 bto
JOIN 
    Users u
    ON bto.usertype = u.usertype 
    AND bto.gender = u.GENDER 
    AND bto.birthyear = u.birthyear;

SELECT * FROM Trips

