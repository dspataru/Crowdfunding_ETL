# Crowdfunding_ETL

## Table of Contents
* [Background](https://github.com/dspataru/Crowdfunding_ETL/blob/main/README.md#background)
* [Create the Category and Subcategory DataFrames](https://github.com/dspataru/Crowdfunding_ETL/blob/main/README.md#create-the-category-and-subcategory-dataframes)
* [Create the Campaign DataFrame](https://github.com/dspataru/Crowdfunding_ETL/blob/main/README.md#create-the-campaign-dataframe)
* [Create the Contacts DataFrame](https://github.com/dspataru/Crowdfunding_ETL/blob/main/README.md#create-the-contacts-dataframe)
* [Create the Crowdfunding Database](https://github.com/dspataru/Crowdfunding_ETL/blob/main/README.md#create-the-crowdfunding-database)

## Background

#### Key Words
SQL, pgAdmin 4, Entity Relationship Diagram (ERD), database, data modelling, data engineering, QuickDBD, Python, regex, Pandas, JSON, DataFrame, 

## Create the Category and Subcategory DataFrames
In this part, we successfully extracted and transformed the data from the "crowdfunding.xlsx" Excel file to create two separate DataFrames: one for categories and one for subcategories.

For the category DataFrame, we created a "category_id" column that sequentially numbered from "cat1" to "catn," where 'n' represents the total number of unique categories. The "category" column in this DataFrame contains only the category titles.

![Catergory DataFrame](https://github.com/dspataru/Crowdfunding_ETL/assets/135666038/49681790-80cc-4749-a7ba-dd58c3e77cfc)

For the subcategory DataFrame, we followed a similar approach, generating a "subcategory_id" column with entries ranging from "subcat1" to "subcatn," where 'n' is the count of unique subcategories. The "subcategory" column in this DataFrame contains only the subcategory titles.

![Subcategory DataFrame](https://github.com/dspataru/Crowdfunding_ETL/assets/135666038/b3b472fb-78a3-4652-8ff1-dfdbc0fc0819)

We have also exported both DataFrames into separate CSV files: "category.csv" and "subcategory.csv." These files have been saved to GitHub repository.

Overall, we successfully extracted, transformed, and exported the required data as specified.


## Create the Campaign DataFrame


## Create the Contacts DataFrame


## Create the Crowdfunding Database

