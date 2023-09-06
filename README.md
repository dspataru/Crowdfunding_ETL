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
In this part of the project, data from a [contacts.xlsx]() file was extracted and transformed into a clean DataFrame with the following columns:
* A column named "contact_id"  that contains the unique number of the contact person.
* A column named "first_name" that contains the first name of the contact person.
* A column named "last_name" that contains the first name of the contact person.
* A column named "email" that contains the email address of the contact person.

Two options were explored for transforming the data in the [contacts.xlsx]() file: (1) Using Python dictionary methods, and (2) using regular expressions. In both methods, the starting point for importing the data was the same:
```python
contact_info_df = pd.read_excel('Resources/contacts.xlsx', header=3)
contact_info_df.head()
```

![original form of contacts.xlsx](https://github.com/dspataru/Crowdfunding_ETL/blob/main/images/contact_info_OG.png)

Since the data in the excel file appeared to be in JSON format, the json module was used to convert each row of strings into a Python dictionary using `json.loads`. We were then able to create the DataFrame using the dictionary values which resulted in the following output:

![post json conversion of contacts](https://github.com/dspataru/Crowdfunding_ETL/blob/main/images/contact_info_updated.png)

The datatypes of each column were verified using the `.info()` method:
```python
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 1000 entries, 0 to 999
Data columns (total 3 columns):
 #   Column      Non-Null Count  Dtype 
---  ------      --------------  ----- 
 0   contact_id  1000 non-null   int64 
 1   name        1000 non-null   object
 2   email       1000 non-null   object
dtypes: int64(1), object(2)
memory usage: 23.6+ KB
```

The 'name' column was split into a 'first_name' and 'last_name' columns, the columns were reordered, and the DataFrame was exported as a csv file: [json_contacts.csv](https://github.com/dspataru/Crowdfunding_ETL/blob/main/Resources/json_contacts.csv)

![contact_info_cleaned_before_export](https://github.com/dspataru/Crowdfunding_ETL/blob/main/images/contact_info_cleaned_before_export.png)

For the second option of using regular expressions to transform the data, the following expressions were used:
1. Extracting the four-digit contact ID number: the regular expression pattern used was `r'"contact_id":\s*(\d+)'` to match the "contact_id" field followed by a colon and any optional whitespace, and then capture one or more digits. The new column 'contact_id' was then converted from object Dtype to int64 Dtype.
2. Extracting the name of the contact: the regular expression pattern used was `r'"name":\s*"([^"]+)"'` to match the "name" field, which is followed by a colon, optional whitespace, and the name enclosed in double quotes. The `([^"]+)` part captures one or more characters that are not double quotes. This data was also added to a new column.
3. Extracting the email from the contacts: the regular expression pattern used was `r'"email":\s*"([^"]+)"'` to match the "email" field, followed by a colon, optional whitespace, and the email address enclosed in double quotes. The `([^"]+)` part captures one or more characters that are not double quotes. This data was also added to a new column.

Same as before, the 'name' column was split into a 'first_name' and 'last_name' columns, the columns were reordered, and the DataFrame was exported as a csv file: [regex_contacts.csv](https://github.com/dspataru/Crowdfunding_ETL/blob/main/Resources/regex_contacts.csv)

## Create the Crowdfunding Database

This part of the project uses the four csv files that were exported from the first three parts of this project:
1. [Category](https://github.com/dspataru/Crowdfunding_ETL/blob/main/Resources/category.csv) and [Subcategory](https://github.com/dspataru/Crowdfunding_ETL/blob/main/Resources/subcategory.csv) DataFrames,
2. [Campaign](https://github.com/dspataru/Crowdfunding_ETL/blob/main/Resources/campaign.csv) DataFrame, and
3. [Contacts](https://github.com/dspataru/Crowdfunding_ETL/blob/main/Resources/json_contacts.csv) DataFrame.

Each of the csv files were inspected to understand the relationship between the tables, and determine the primary and forgein keys. Using [QuickDBD](https://www.quickdatabasediagrams.com/), an entity-relationship diagram (ERD) was created using code that can be found in [ERD.txt](https://github.com/dspataru/Crowdfunding_ETL/blob/main/Crowdfunding_Database/ERD.txt). Various constraints were specified for each of the columns in each table.

![ERD](https://github.com/dspataru/Crowdfunding_ETL/blob/main/Crowdfunding_Database/images/Project2_ERD_DBDexport.png)

The information in the ERD was used to create a table schema for each csv file. The database schema from [QuickDBD](https://www.quickdatabasediagrams.com/) was saved as a Postgres file named [crowdfunding_db_schema.sql](https://github.com/dspataru/Crowdfunding_ETL/blob/main/Crowdfunding_Database/crowdfunding_db_schema.sql). In order to create the Database, pgAdmin 4 v7 was used. We created a new Postgres database named 'crowdfunding_db' and created the tables in the correct order to handle the forgein keys using the database schema. First we verified that each table was created properly by running a `SELECT` statement for each table ([tables_creation.sql](https://github.com/dspataru/Crowdfunding_ETL/blob/main/Crowdfunding_Database/tables_creation.sql)). Then each csv file was imported into its corresponding SQL table in the same order in which it was created, and verified again by running a `SELECT` statement for each table.







