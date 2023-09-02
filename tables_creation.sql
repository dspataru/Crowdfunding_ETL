-- Creating a table for the contact information of each campaign representative
CREATE TABLE contacts (
	contact_id INT NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	PRIMARY KEY (contact_id)
);

SELECT *
FROM contacts;

-- Creating a table for the different category of each campaign
CREATE TABLE category (
	category_id INT NOT NULL,
	category VARCHAR(50) NOT NULL,
	PRIMARY KEY (category_id)
);

SELECT *
FROM category;

-- Creating a table for the different subcategory of each campaign
CREATE TABLE subcategory (
	subcategory_id INT NOT NULL,
	subcategory VARCHAR(50) NOT NULL,
	PRIMARY KEY (subcategory_id)
);

SELECT *
FROM subcategory;

-- Creating a table for the information about each registered campaign
CREATE TABLE campaign (
	cf_id INT NOT NULL,
	contact_id INT NOT NULL,
	company VARCHAR(250) NOT NULL,
	description VARCHAR,
	goal FLOAT NOT NULL,
	pledged FLOAT NOT NULL,
	outcome VARCHAR(10) NOT NULL,
	backers_count INT NOT NULL,
	country VARCHAR(2),
	currency VARCHAR(3),
	launched_date DATE,
	end_date DATE,
	category_id INT NOT NULL,
	subcategory_id INT NOT NULL,
	PRIMARY KEY (cf_id),
	FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
	FOREIGN KEY (category_id) REFERENCES category(category_id),
	FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);

SELECT *
FROM campaign;