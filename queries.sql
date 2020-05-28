-- ------------------------------------------------------------------------------------DASHBOARD--------------------------------------------------------------------
-- All time highest bid 
select MAX(amount) from orders;

-- category wise sales  and count of artwork
select SUM(orders.amount) ,COUNT(*) as num_sold, artwork.type from artwork,orders
where artwork.title = orders.title
group by artwork.type;

-- sales in this month , this year.

select * from orders 
	where (date between  DATE_FORMAT(NOW() ,'%Y-%m-01') AND NOW() );
 
select * from orders
WHERE (date between  DATE_FORMAT(NOW() ,'%Y-01-01') AND NOW() ) ;

    -- sales in any particular year 
    select * from orders 
    where ( year(date) = 2019);

 -- ----------------------------------------------------------------------------------------------------   



-- display all available artwork ordered by year 

select  a.artwork_id, 
    a.title,
    artists.artist_name,
    a.price,
    a.year,
    a.type,
    a.available
    from artwork as a
    inner join artists using(artist_id)
    where a.available = true
    order by year;
    
-- update artwork artwork
-- set price = 
-- where artwork_id = ;

 -- artist with maximum sales in order descending artist with max sales at top
 select x.artist_id , artist_name  , sum(z.amount) as maxSale
 from artists x , artwork y , orders 
 where x.artist_id = y.artist_id  and
 y.artwork_id = z.artwork_id 
 group by x.artist_id
 order by maxSale desc;

 
 -- artists that have not sold any work (nested)
 select * from artwork;
 select artist_id , artist_name 
 from artists
 where not exists ( select * 
 from artwork 
 where artists.artist_id = artwork.artist_id and
		artwork.available = false );
-- 

-- delete from order 
-- delete from orders where order_id = 

-- show all visitors
select * from visitor;
-- show visitors who have bought more than 5 times in the past 1 year (nested -2)
select visitor_id  from visitor 
where visitor_id in ( select visitor_id  from orders 
WHERE (date between  DATE_FORMAT(NOW() ,'%Y-01-01') AND NOW() ) 
group by visitor_id
having count(*) > 3
);
-- visitors who havent bought more than 5 times in past 1 year 
select visitor_id  from visitor 
where visitor_id not in ( select visitor_id  from orders 
WHERE (date between  DATE_FORMAT(NOW() ,'%Y-01-01') AND NOW() ) 
group by visitor_id
having count(*) > 3
);

 
delete from visitor where visitor_id = 2;

-- visitors who have not bought art but visited the gallery 
select *
from visitor c
left join orders o using (visitor_id)
where o.order_id is null;





