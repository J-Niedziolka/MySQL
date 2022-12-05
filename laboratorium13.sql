USE classicmodels;

CREATE INDEX status_index ON orders (status);
CREATE INDEX columns_index ON products (quantityInStock, buyPrice);

SELECT customers.customerName, customers.creditLimit, payments.amount FROM customers, payments
	WHERE customers.customerNumber = payments.customerNumber AND payments.amount > 50000;
EXPLAIN SELECT customers.customerName, customers.creditLimit, payments.amount FROM customers, payments
	WHERE customers.customerNumber = payments.customerNumber AND payments.amount > 50000; -- 122 WIERSZE, 

CREATE INDEX amount_index ON payments(amount);

SELECT customers.customerName, customers.creditLimit, payments.amount FROM customers, payments
	WHERE customers.customerNumber = payments.customerNumber AND payments.amount > 50000;
EXPLAIN SELECT customers.customerName, customers.creditLimit, payments.amount FROM customers, payments
	WHERE customers.customerNumber = payments.customerNumber AND payments.amount > 50000; -- 42 WIERSZE, 
    
-- Różnica wynika z tego, że MySQL dysponując indeksem nie przeszukuje wszystkich wierwszy


 -- Sprawdź jakie indeksy są zapisany w tabeli ‘payments’, które z nich są unikalne? 
 SHOW INDEXES FROM payments;
 

 -- Wypisz nazwę klienta, numer zamówienia, datę zamówienia i status tego zamówienia dla klientów, którzy są z nowego yorku i złożyli zamówienie w 2004 roku.
SELECT customers.customerName, orders.orderNumber, orders.orderDate, orders.status FROM customers, orders WHERE
	customers.customerNumber = orders.customerNumber AND customers.city = 'NYC' AND YEAR(orders.orderDate) = '2004';
EXPLAIN SELECT customers.customerName, orders.orderNumber, orders.orderDate, orders.status FROM customers, orders WHERE
	customers.customerNumber = orders.customerNumber AND customers.city = 'NYC' AND YEAR(orders.orderDate) = '2004';


DROP INDEX status_index ON orders;