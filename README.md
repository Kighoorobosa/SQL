# Global Land Analysis - An SQL Report

## Introduction
This SQL project focuses on analyzing global land data from a fictional dataset named **Lands**.
The objective is to gain insights into the historical evolution of land and forest coverage worldwide.

**_Disclaimer_**:_The datasets and reports provided in this repository are purely fictitious and do not correspond to any real countries, regions, or land areas. They have been created solely for the purpose of demonstrating the capabilities of SQL in data analysis_.

## Dataset Description
#### Forest_Area Dataset:
Structure: The Forest_Area dataset contains information about forest area in square kilometers for various countries and years.

**Columns**

country_code: The country code uniquely identifying each country.

country_name: The name of the country.

year: The year for which the forest area data is recorded.

forest_area_sqkm: The forest area in square kilometers for the corresponding year and country.

Relevant Information: This dataset provides insights into the extent of forest coverage across different countries over time.
#### Land_Area Dataset:
Structure: The Land_Area dataset contains information about total land area in square miles for different countries.

**Columns**

country_code: The country code uniquely identifying each country.

country_name: The name of the country.

total_area_sq_mi: The total land area in square miles for the corresponding country.

Relevant Information: This dataset provides data on the total land area of each country, which is essential for analyzing land use patterns and trends.
#### Region Dataset:
Structure: The Region dataset contains additional information about countries, such as their income group and region.

**Columns**

country_code: The country code uniquely identifying each country.

country_name: The name of the country.

region: The region to which the country belongs.

income_group: The income group classification of the country.

Relevant Information: This dataset provides contextual information about countries, including their regional affiliations and income group classifications, which can help analyze socioeconomic factors related to land use.

## Analysis Questions
1.What are the total number of countries involved in deforestation?

2.Show the income groups of countries having total area ranging from 75,000 to 150,000 square meter?

3.Calculate average area in square miles for countries in the 'upper middle income region'. Compare the result with the rest of the income categories.

4.Determine the total forest area in square km for countries in the 'high income' group. Compare result with the rest of the income categories.

5.Show countries from each region(continent) having the highest total forest areas.

## Skills
The following SQL skills were incorporated:

-Data Retrieval

-Data Aggregation

-Data Transformation

-Data Filtering

-Windows Function

-Subqueries

-Data Visualization

## Visualization
You can interact with the report [HERE](https://github.com/Kighoorobosa/SQL/blob/main/SQLQuery1.sql)


## SQL Queries for Analysis

### Query 1: Total Number of Countries Involved in Deforestation

This query calculates the total number of countries involved in deforestation by counting countries with positive forest area values.

```sql
SELECT COUNT(DISTINCT country_code) AS total_countries_involved
FROM Forest_Area
WHERE forest_area_sqkm > 0;



## Conclusion
In conclusion, the insights gained from the SQL analysis underscore the importance of data-driven approaches in understanding and addressing global land management issues.
By leveraging the power of data analytics, policymakers and stakeholders can make informed decisions and take proactive measures to promote sustainable land use and conservation practices worldwide.
