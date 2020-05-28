drop table artists;
drop table artwork;
drop  table customer;
drop table orders;
create table if not exists artists (
artist_id INT UNSIGNED auto_increment,
artist_name VARCHAR(100) UNIQUE NOT NULL,
birthplace VARCHAR(50) ,
age SMALLINT,
PRIMARY KEY(artist_id)
);

create table if not exists artwork(
	artwork_id INT UNSIGNED auto_increment,
	title VARCHAR(100) UNIQUE NOT NULL ,
   artist_id INT UNSIGNED,
    price  DECIMAL(14,2) NOT NULL ,
    year SMALLINT NOT NULL,
    type VARCHAR(50) NOT NULL,
    available boolean NOT NULL default true,
    PRIMARY KEY(artwork_id),
    FOREIGN KEY(artist_id)
		REFERENCES artists(artist_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
      
); 

create table if not exists visitor(
	visitor_id INT UNSIGNED auto_increment,
	phone_number VARCHAR(20) UNIQUE NOT NULL,
    visitor_name CHAR(50) NOT NULL ,
    PRIMARY KEY(visitor_id)
);

create table if not exists orders(
	order_id INT UNSIGNED AUTO_INCREMENT ,
    visitor_id INT UNSIGNED NOT NULL,
	artwork_id INT UNSIGNED ,
    date DATE NOT NULL,
    amount DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(order_id),
    FOREIGN KEY(visitor_id) 
		REFERENCES visitor(visitor_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
	FOREIGN KEY(artwork_id)
		REFERENCES artwork(artwork_id)
         ON DELETE RESTRICT
        ON UPDATE CASCADE 
    
)



