To create a README.md file for your GitHub repository, you'll want to provide an overview of the project, explain the problem-solving approach, describe how to use the code, and give any necessary instructions for setting up the environment. Below is a suggestion for what you can include in your `README.md`:

---

# Netflix Data Analysis

## Project Overview

This project performs an analysis of the Netflix dataset, sourced from Kaggle, using MySQL queries. The goal is to answer various business-related questions about Netflix's content catalog, including the number of movies versus TV shows, the most common ratings, content distribution by country, and more. The data covers information about Netflix's movies and TV shows, including their types, ratings, release years, genres, directors, and more.

## Problem Statement

The following business questions were analyzed and solved using SQL queries on the Netflix dataset:

1. **Count the number of Movies vs TV Shows**  
   - Query: Count and group content by type (Movie or TV Show).

2. **Find the most common rating for Movies and TV Shows**  
   - Query: Identify the most frequent rating for movies and TV shows.

3. **List all Movies that were released in a specific year (e.g., 2020)**  
   - Query: Retrieve all movies released in a given year.

4. **Find the top 5 countries with the most content on Netflix**  
   - Query: Extract and count content per country to identify the top 5 countries with the most content.

5. **Find the Longest Movies**  
   - Query: Identify the movie with the longest duration.

6. **Find all Movies/TV Shows by Director 'Kirsten Johnson'**  
   - Query: List all movies or TV shows directed by 'Kirsten Johnson'.

7. **List all TV Shows with more than 5 seasons**  
   - Query: Retrieve all TV shows with a duration longer than 5 seasons.

8. **Count the number of content items in each genre**  
   - Query: Count and group content by its first genre.

9. **Find each year and the average number of content released by India on Netflix; return top year with the highest average content release**  
   - Query: Analyze content releases by year for India and find the year with the highest average release.

10. **List all Movies that are Documentaries**  
   - Query: Identify all movies listed under the documentary genre.

11. **Find all content without a director**  
   - Query: List all content where the director is missing.

## Requirements

- **MySQL**: The analysis was conducted using MySQL as the database management system.
- **Dataset**: Netflix dataset from Kaggle. You can download the dataset from [Kaggle's Netflix Dataset](https://www.kaggle.com/datasets).
- **SQL Skills**: Basic to intermediate SQL knowledge is required to understand the queries.

## Setup Instructions

1. **Install MySQL**:
   - Install MySQL Community Server on your machine by following the official installation guide: [MySQL Installation Guide](https://dev.mysql.com/doc/refman/8.0/en/installing.html).

2. **Import the Dataset**:
   - Download the Netflix dataset from Kaggle and load it into your MySQL database. Ensure that the dataset is in CSV format and contains tables like `netflix`.

3. **Create Database and Table**:
   - Create a database in MySQL and import the CSV file into a table. You can use the following SQL commands:
     ```sql
     CREATE DATABASE netflix_db;
     USE netflix_db;
     CREATE TABLE netflix (
         show_id INT PRIMARY KEY,
         title VARCHAR(255),
         type VARCHAR(50),
         director VARCHAR(255),
         cast VARCHAR(255),
         country VARCHAR(255),
         date_added DATE,
         release_year INT,
         rating VARCHAR(50),
         duration VARCHAR(50),
         listed_in VARCHAR(255),
         description TEXT
     );
     ```
   - After that, use `LOAD DATA INFILE` or any other method to import your CSV data into the `netflix` table.

4. **Run Queries**:
   - Copy and paste the SQL queries provided above into your MySQL environment to get results for the business questions.

## Query Breakdown

The queries provided address various business questions related to the Netflix dataset:

- **Content Type Breakdown**: By counting the number of movies versus TV shows.
- **Ratings Analysis**: Using `RANK()` and `GROUP BY` to find the most common rating for each content type.
- **Content Filtering**: Filtering based on release year, director, and genre.
- **Country Content Distribution**: Analyzing content distribution by country using string manipulation functions.
- **Documentary Movies**: Finding specific genres like documentaries.
- **Missing Directors**: Finding content with missing director data.

## Example Queries

Here are a few example queries used for analysis:

### 1. Count Movies vs TV Shows

```sql
SELECT type, COUNT(*) AS total_content
FROM netflix
GROUP BY type;
```

### 2. Find the Most Common Rating for Movies and TV Shows

```sql
SELECT type, rating
FROM (
    SELECT type, rating, COUNT(*) AS count,
           RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) AS max_rating
    FROM netflix
    GROUP BY 1, 2
) AS table1
WHERE max_rating = 1;
```

### 3. Find Movies Released in 2020

```sql
SELECT title, release_year
FROM netflix
WHERE type = 'Movie' AND release_year = 2020;
```
