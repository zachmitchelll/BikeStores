
� 2017 sqlservertutorial.net All Rights Reserved
--------------------------------------------------------------------
Name   : BikeStores
Link   : http://www.sqlservertutorial.net/load-sample-database/

--Joining the data

SELECT
	ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name) AS 'customers',
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) AS 'total_units',
	SUM(ite.quantity * ite.list_price) AS 'revenue',
	pro.product_name,
	cat.category_name,
	bra.brand_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name) as 'sales_rep'
FROM sales.orders ord
Join sales.customers cus
On ord.customer_id = cus.customer_id
Join sales.order_items ite
On ord.order_id = ite.order_id
Join production.products pro
On ite.product_id = pro.product_id
Join production.categories cat
On pro.category_id = cat.category_id
Join production.brands bra
On pro.brand_id = bra.brand_id
Join sales.stores sto
On ord.store_id = sto.store_id
Join sales.staffs sta
On ord.staff_id = sta.staff_id
Group by 
	ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	bra.brand_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name)



