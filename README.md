# Cyclist-Database
creating second form Normalization 
# Database Design for Divvy Bike Share Analysis
1. Project Overview
Description: This project involves designing a database schema and writing SQL queries to analyze data from the Divvy bike-share program. The project focuses on creating a normalized database structure to efficiently store and retrieve information about trips, users, bikes, and stations. The SQL queries demonstrate how to extract meaningful insights from the data.

Purpose: The primary purposes of this project are to:
- Design a relational database schema in Second Normal Form (2NF).
- Create database tables using SQL Data Definition Language (DDL).
- Populate the tables with data using SQL Data Manipulation Language (DML).
- Retrieve and analyze data using SQL queries.
- Demonstrate database design principles and SQL proficiency.

Target Audience: This project is designed for anyone interested in:
- Database design
- Relational databases
- SQL programming
- Data analysis using SQL
- Bike-share data analysis

2. Skills Demonstrated
This project showcases the following data analyst/database skills:
- Database Design: Designing a relational database schema in 2NF.
- Data Modeling: Representing real-world entities and relationships in a database.
- SQL DDL: Creating database tables using SQL.
- SQL DML: Inserting data into database tables using SQL.
- SQL Querying: Retrieving and analyzing data using SQL SELECT statements.
- Data Integrity: Implementing foreign keys to enforce relationships between tables.
- Normalization: Applying database normalization principles to reduce data redundancy.

3. Project Details
Tools Used:
SQL (SQL Server): For creating and querying the database.

Data Sources:
Divvy bike-share data (Quarter 1, 2019).  
Database Schema:
The database schema consists of the following tables in 2NF:
Users:
userid (INT, PRIMARY KEY)
usertype (VARCHAR)
gender (VARCHAR)
birthyear (INT)
Bikes:
bike_id (INT, PRIMARY KEY)
Stations:
station_id (INT, PRIMARY KEY)
name (VARCHAR)
Trips:
trip_id (INT, PRIMARY KEY)
start_time (DATETIME)
end_time (DATETIME)
trip_duration (INT)
bike_id (INT, FOREIGN KEY REFERENCES Bikes)
from_station_id (INT, FOREIGN KEY REFERENCES Stations)
to_station_id (INT, FOREIGN KEY REFERENCES Stations)
userid (INT, FOREIGN KEY REFERENCES Users)

SQL Queries:
The project includes SQL queries to:
Create the database tables (DDL).
Insert data into the tables (DML).
Retrieve trip data with user information (JOIN).
Select user data based on birth year.

4. Database Design Explanation
Normalization to 2NF:
The original data likely had redundancies.  2NF was used to decompose the data into smaller, more manageable tables, reducing redundancy and improving data integrity.
For example, the Users table was created to store user-specific information (usertype, gender, birthyear) separately from trip details, eliminating the repetition of this information for each trip a user takes.
The Stations table stores station names to avoid repeating them in the Trips table.
The Bikes table stores bike IDs.

Table Relationships:
The Trips table is the central table, connecting users, bikes, and stations.
Foreign keys in the Trips table (bike_id, from_station_id, to_station_id, userid) enforce relationships with the Bikes, Stations, and Users tables, ensuring data consistency.

5. Project Highlights
- Normalized Database: The database design adheres to 2NF, demonstrating an understanding of database normalization principles.
- Clear Schema: The database schema is well-defined and easy to understand.
- Comprehensive SQL: The project includes SQL code for table creation, data insertion, and data retrieval, showcasing SQL proficiency.
- Data Analysis Focus: The SQL queries demonstrate how to extract meaningful information from the data, such as user demographics and trip details.
- Real-World Application: The project uses data from a real-world bike-share program, making it relevant and practical.

6. Challenges and Solutions
- Challenge: Identifying the appropriate primary and foreign keys for each table.
  Solution: Carefully analyzed the relationships between entities to determine the most suitable keys.
- Challenge: Writing complex SQL queries to join tables and retrieve specific data.
  Solution: Used subqueries and JOIN clauses to combine data from multiple tables and filter the results.

7. Future Enhancements

Implement more advanced SQL queries for deeper analysis (e.g., trip duration analysis, popular routes, peak usage times).
Create database views to simplify complex queries.
Develop stored procedures to automate common database tasks.
Design an Extract, Transform, Load (ETL) process for loading data into the database.
Explore database optimization techniques to improve query performance.

8. Conclusion
This project demonstrates the ability to design a relational database, implement it using SQL, and write queries to analyze data. The project showcases a strong understanding of database design principles, SQL programming, and data analysis techniques. This project is a valuable addition to a data analyst portfolio, demonstrating the ability to work with relational databases and extract insights from structured data.
