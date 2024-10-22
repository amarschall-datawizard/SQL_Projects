-- List of names, emails, and id number.
use mavenmovies;
SELECT 
	first_name,
    last_name,
    email,
    store_id
FROM staff;

-- Seperate counts of inventory items at both stores.
SELECT 
	COUNT(inventory_id) AS 'inventory amount',
    store_id
FROM inventory
GROUP BY 
	store_id;

-- Count of active customers and both stores. Seperately.
 SELECT 
	COUNT(customer_id),
    store_id
 FROM customer
 WHERE active = 1
 GROUP BY 
	store_id;

-- Count of all customer emails.
SELECT 
	COUNT(email)
FROM customer;

-- Count of unique film titles at each store and count of unique categories of films.
SELECT 
	store_id,
	COUNT(DISTINCT film_id) AS unique_films
FROM inventory
GROUP BY
	store_id;

-- Replacement cost of the least expensive, most expensive, and average of all films.
-- Average payment and maximum payment processed.
SELECT
	AVG(amount) AS average_payment,
    MAX(amount) AS max_payment 
FROM payment;

-- All customer ids and count of rental, with highest volume customers at the top.
SELECT 
	customer_id,
    COUNT(rental_id) AS number_of_rentals
FROM rental
GROUP BY
	customer_id
ORDER BY
	COUNT(rental_id) DESC;

SELECT 
	inventory_id,
    film_id,
    COUNT(CASE WHEN store_id = 1 THEN inventory_id ELSE NULL END) AS count_of_store_1_inventory,
    COUNT(CASE WHEN store_id = 2 THEN inventory_id ELSE NULL END) AS count_of_store_2_inventory
FROM inventory
GROUP BY
	inventory_id,
    film_id;

SELECT 
    store_id,
    COUNT(CASE WHEN active = 1 THEN customer_id ELSE NULL END) AS active, 
    COUNT(CASE WHEN active = 0 THEN customer_id ELSE NULL END) AS inactive
FROM customer
GROUP BY 
	store_id;
-- ORDER BY store_id

-- final exam
-- 1.Send managers names at each store w/ address, district, city, country.

SELECT 
	staff.first_name AS manager_first_name,
    staff.last_name AS manager_last_name,
    address.address,
    address.district,
    city.city,
    country.country
FROM store
	LEFT JOIN staff ON store.manager_staff_id = staff.staff_id
    LEFT JOIN address ON store.address_id = address.address_id
    LEFT JOIN city ON address.city_id = city.city_id
    LEFT JOIN country ON city.country_id = country.country_id;

/* 2. Pull a list of inventory w/ store_id, inventory id, film name, film rating, rental rate, replacement cost.
*/
SELECT
	inventory.store_id, 
    inventory.inventory_id,
    film.title,
    film.rating,
    film.rental_rate,
    film.replacement_cost
FROM inventory
	LEFT JOIN film
		ON inventory.inventory_id = film.film_id
		
	
	


