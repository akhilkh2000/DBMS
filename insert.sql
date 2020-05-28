insert into artists (artist_name,birthplace,age)
values 
	 ('Leonardo Da Vinci','Italy',67),
   ('Pablo Picasso','Spain',91),
     ('Vincent van Gogh','Netherlands',37),
     ('Michelangelo','Italy',88);
     
    
select * from artists; 


-- insert some art of ceramic and photography
insert into artwork (title,artist_id,price,year,type,available)
values
	('The Starry Night',3,80000000,1889,'painting',true),
    ('The Weeping Woman',2,1060000,1937,'painting',true),
    ('David',4,200000000,1504,'sculpture',true);
    
select* from artwork;
delete from artwork;
alter table artwork auto_increment =1;
insert into customer(phone_number,cust_name)
values 
	('+91 9876534523', 'Mr. Bob'),
    ('+91 9684374632', 'Mr. John'),
    ('+91 8947463210', 'Mrs. Scarlett');
	 
-- alter table artwork
-- add in_stock boolean NOT NULL DEFAULT FALSE;
select * from customer;
insert into orders(cust_id,artwork_id,date,amount)
values
	(1,3,'2020-05-09',80000000);
select * from orders;

insert into orders(cust_id,artwork_id,date,amount)
values
	(2,2,'2020-05-08',1060000);
--     insert into orders(cust_id,artwork_id,date,amount)
-- values
-- 	(3,3,'2020-05-08',1060000),
--     (3,2,'2020-05-08',1060000),
--     (3,2,'2020-05-08',1060000),
--     (3,2,'2020-05-08',1060000);
-- select * from orders;







-- insertion using variables
select * from artwork;
select cust_id into @cid from customer where phone_number = '+91 9684374632';
select price into @price from artwork where artwork_id = 1 and available = true;
-- select @price;
 select * from artwork;
 insert into orders(cust_id,artwork_id,date, amount)
	values(@cid,1,curdate(),@price);
    
    select * from orders;
    
    
    
    
    
    
    
    
    -- trigger on adding order
    
    DELIMITER $$
    create 
		trigger my_trigger after insert
        on orders for each row
        begin
			update artwork 
            set available = false 
            where artwork_id = NEW.artwork_id;
		end $$
	DELIMITER ;
    
    DELIMITER $$
    create 
		trigger delete_trigger after delete
        on orders for each row
        begin
			update artwork
            set available = true
            where artwork_id = OLD.artwork_id;
		end $$
	DELIMITER ;
        


