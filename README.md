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
In this part, data was successfully extracted and transformed from the "crowdfunding.xlsx" Excel file to create two separate DataFrames: one for categories and one for subcategories.

![Snapshot of Crwodfunding excel sheet](https://github.com/dspataru/Crowdfunding_ETL/assets/135666038/147b3b04-999d-410e-9ef2-357434341d51)

Two seperate columns were created for 'category' and 'subcategory' from 'category & sub-category' column using split function. 

![Split Columns](https://github.com/dspataru/Crowdfunding_ETL/assets/135666038/74e431a4-6bf1-4f92-8088-2dc4fbefd25d)

For the category DataFrame, a "category_id" column that sequentially numbered from "cat1" to "catn," where 'n' represents the total number of unique categories has been created. The "category" column in this DataFrame contains only the category titles.

![Catergory DataFrame](https://github.com/dspataru/Crowdfunding_ETL/assets/135666038/49681790-80cc-4749-a7ba-dd58c3e77cfc)

For the subcategory DataFrame, the similar approach was followed, generating a "subcategory_id" column with entries ranging from "subcat1" to "subcatn," where 'n' is the count of unique subcategories. The "subcategory" column in this DataFrame contains only the subcategory titles.

![Subcategory DataFrame](https://github.com/dspataru/Crowdfunding_ETL/assets/135666038/b3b472fb-78a3-4652-8ff1-dfdbc0fc0819)

Both the DataFrames were exported into separate CSV files: "category.csv" and "subcategory.csv." These files have been saved to GitHub repository.

Overall, the data was successfully ETL (extracted, transformed, and exported).


## Create the Campaign DataFrame
In this process, we first duplicated the Crowdfunding DataFrame and named it campaign_df. 

![Code to create a copy](https://github.com/dspataru/Crowdfunding_ETL/assets/135666038/0e1db052-5e41-4286-9ade-fc16740cd232)

### Datacleaning steps were performed as follow: 
* Renaming the column names for clarity
  
![Renaming Columns](https://github.com/dspataru/Crowdfunding_ETL/assets/135666038/7ba2e994-2d46-410e-96ef-7abb211cfa00)

* Adjusted the data types of specific columns
   
![DataTypes](https://github.com/dspataru/Crowdfunding_ETL/assets/135666038/04f57289-831a-4b18-a440-cd7e4f037017)

Before changing the datatype:
  
![Before changing the datatype](https://github.com/dspataru/Crowdfunding_ETL/assets/135666038/347504c0-6b9b-430c-8a15-7993d5a748e5)

After changing the datatype (type:date): 

![After changing the datatype](https://github.com/dspataru/Crowdfunding_ETL/assets/135666038/43f9e026-6ce9-4996-bc9a-7f8755969f26)

* Eliminated any redundant columns that were not needed
  
![Dropping Unwanted Columns](https://github.com/dspataru/Crowdfunding_ETL/assets/135666038/8d83d185-c0f6-404c-b383-6d3e05817d6e)

Finally, we combined this refined DataFrame with the Category and Subcategory DataFrames and saved the resulting merged DataFrame as Campaign_df.

## Create the Contacts DataFrame


## Create the Crowdfunding Database

