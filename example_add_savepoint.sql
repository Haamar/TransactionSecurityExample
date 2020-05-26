START TRANSACTION;

SELECT @dateToday:=CURDATE();
SELECT @shipDate:= DATE_ADD(@dateToday, INTERVAL 30 Day);

SELECT 
    @orderNumber:=IFNULL ( MAX(orderNumber)+1 , 1 )
FROM
    orders;
       
INSERT INTO orders(orderNumber,
                   orderDate,
                   requiredDate,
                   shippedDate,
                   customerNumber)
	VALUES(@orderNumber,
	       @dateToday,
	       @shipDate,
	       null,
	        145);
        
SAVEPOINT orders;

INSERT INTO orderdetails(orderNumber,
                         productCode,
                         quantity,
                         price)
	VALUES(@orderNumber,'0000', 10, '136');
	
SAVEPOINT first_detail;

INSERT INTO orderdetails(orderNumber,
                         productCode,
                         quantity,
                         price)
	VALUES (@orderNumber,'0011', 20, '55'); 
	
SAVEPOINT second_detail;
