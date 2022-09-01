DELIMITER $$
CREATE PROCEDURE `fetchamt`()
BEGIN
	select CUST_NAME, GRADE from customer where (OPENING_AMT + RECEIVE_AMT > 10000);
END$$

DELIMITER ;
CALL fetchamt();

select * from customer;
