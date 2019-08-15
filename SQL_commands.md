============
SELECT
    count(*)
FROM
    (SELECT
        *
    FROM
        customers
    JOIN
        (SELECT crrt AS carrier, count(crrt) AS carrier_count FROM customers GROUP BY crrt) AS vtable
    ON
        vtable.carrier = customers.crrt) tmptbl;
============
SELECT
    *
FROM
    customers
JOIN
    (SELECT crrt AS carrier, count(crrt) AS carrier_count FROM customers GROUP BY crrt) AS vtable
ON
    vtable.carrier = customers.crrt
LIMIT
    20;
