--who is the senior most employee in jon title
SELECT * FROM employee
ORDER BY levels desc
limit 1

--which countries hvae the most invoices
select COUNT(*) as c,billing_country
from invoice
group by billing_country
order by c desc

--What are the top3 values of total invoice
SELECT total FROM invoice
order by total desc
limit 3

--which city has the best customers? to throw a party for particular region's best customers,city name, total invoice
select SUM(TOTAL) As invoice_total,billing_city
from invoice
group by billing_city
order by invoice_total desc

--best customer? who has spend more money gets awrd
select customer.customer_id,customer.first_name,customer.last_name,SUM (invoice.total) as total
from customer
JOIN invoice ON customer.customer_id =  invoice.customer_id
group by customer.customer_id
order by total desc
limit 1

--write query to return the email,first name,last name and genre of all rock music
-- listeners. return your list ordered alphabetically by email starting with A

SELECT customer.email
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN (
    SELECT track.track_id
    FROM track
    JOIN genre ON track.genre_id = genre.genre_id
    WHERE genre.name = 'Rock'
)
ORDER BY email;

