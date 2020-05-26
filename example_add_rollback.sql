START TRANSACTION;

SELECT @dateToday:=CURDATE();
SELECT @shipDate:= DATE_ADD(@dateToday, INTERVAL 30 Day);

SELECT 
    @orderNumber:=IFNULL ( MAX(orderNUmber)+1 , 1 )
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
        
INSERT INTO orderdetails(orderNumber,
                         productCode,
                         quantity,
                         price)
VALUES(@orderNumber,'9999', 10, '0'),
      (@orderNumber,'9998', 20, '0'); 
      
ROLLBACK WORK;