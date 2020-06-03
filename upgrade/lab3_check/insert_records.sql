SET SERVEROUTPUT ON



INSERT INTO product(name, weight, energy_value, shelf_life, price, fats, proteins, carbohydrates, cocoa)
	SELECT DISTINCT product_name, product_weight, food_energy, shelf_life, product_price, fats, protein, carbonohydrates, cocoa
	FROM GoogleExcelTable;
	

INSERT INTO box(weight, type, price, amount, product_id)
	SELECT DISTINCT box_weight, box_type, box_price, box_count, (
			SELECT p.product_id
			FROM product p
			WHERE p.name = product_name AND p.price = product_price AND p.weight = product_weight
		)
	FROM GoogleExcelTable;


INSERT INTO transport(name)
	SELECT DISTINCT transport
	FROM GoogleExcelTable;

	
INSERT INTO customer(name, address)
	SELECT DISTINCT customer_name, address
	FROM GoogleExcelTable;


INSERT INTO batch(status, transport_id, customer_id)
	SELECT DISTINCT gt.batch_status, (
        SELECT t.transport_id
        FROM transport t
        WHERE t.name = gt.transport
    ), 
    (
        SELECT c.customer_id
        FROM customer c
        WHERE c.name = gt.customer_name 
            AND c.address = gt.address
    )
	FROM GoogleExcelTable gt
    ORDER BY gt.batch_status DESC;
	

INSERT INTO batch_content(batch_id, box_id)
	SELECT (
			SELECT b.batch_id
			FROM batch b
			WHERE b.customer_id = ( 
					SELECT c.customer_id
					FROM customer c
					WHERE c.name = gt.customer_name 
						AND c.address = gt.address
				) 
		), 
		( 
			SELECT b.box_id
			FROM box b
			WHERE b.weight = gt.box_weight
				AND b.type = gt.box_type
				AND b.price = gt.box_price
				AND b.amount = gt.box_count
				AND b.product_id = (
						SELECT p.product_id
						FROM product p
						WHERE p.name = gt.product_name AND p.weight = gt.product_weight
					)
		)
	FROM GoogleExcelTable gt;



SET SERVEROUTPUT OFF