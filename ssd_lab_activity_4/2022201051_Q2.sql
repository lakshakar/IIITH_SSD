DELIMITER $$
CREATE PROCEDURE `fetchCustNames`(IN cityname varchar(35))
BEGIN
	select CUST_NAME from customer where WORKING_AREA = cityname;
END$$

DELIMITER ;
CALL fetchCustNames("Bangalore");
