/*creating Online Delivery Restaurant database*/
 CREATE DATABASE RESTAURANT


Use RESTAURANT

/*creating customer table*/

CREATE TABLE Customer(
Customerid INT  PRIMARY KEY ,
CustomerName varchar(255) NOT NULL,
CustomerContact int NOT NULL,
CustomerAdress varchar(100) NOT NULL
)

/*inserting values into customer table*/

INSERT INTO Customer(
Customerid,CustomerName,CustomerContact,CustomerAdress )
VALUES('0011','Pio Kerich',0722171851,'1712 KERICHO'),
('2212','Jude Keter',0723780930,'2512	NANDI'),
('2213','Cornel Kipkosgei',0716212861,'1903 BOMET'),
('2214','Gedion kiptoo',0722134890,'1712 KERICHO'),
('2215','Jose Camargo',679901123,'1234 KAKAMEGA'),
('2216','Kipkorir Seth',030004567,'6541 KERINGET'),
('2217','Jacinta Chela',0784900923,'171234 KERIO'),
('2218','Dottie Mwangi',0790171816,'3421 NAIROBI'),
('2219','Merclyn Chebet',0122071851,'66790 NAKURU'),
('2220','Collo Yegon',0722684627,'709045 EMBU'),
('2221','Koech Felix',0723446651,'6789 KAPSEGER')

	/*A Customer tables VIEW*/
		CREATE VIEW CUST_LIST
            (ID, NAME, ADDRESS, PHONE) AS
		SELECT Customerid, CustomerName, CustomerAdress, CustomerContact FROM Customer; 



/*creating crew table*/

CREATE TABLE Crew(
Crewid varchar(255) PRIMARY KEY,
CrewName varchar(255) NOT NULL,
CrewContact int NOT NULL,
CrewAdress varchar(255),
CrewUsername varchar(255)
)
INSERT INTO Crew(Crewid,CrewName,CrewContact,CrewAdress,CrewUsername)
VALUES('CR01','Edith Ole','077535670','1790 Brooke','Ole'),
('CR02','Mike Rono','0725875895','456 TENA','Mykal'),
('CR03','Janeth Masip','0754012565','34 BURU','Janoo'),
('CR04','Bernadine Yegon','0754235879','3290 UMOJA','Ben'),
('CR05','Mercy Chela','0749045768','1120 LA','Macy'),
('CR06','Edice kibe','074122156','1901 NY','MsKibe')

/*A Crew VIEW*/
   CREATE VIEW CREW_LIST
            (ID, NAME, ADDRESS, PHONE) AS
   SELECT Crewid, CrewName, CrewAdress, CrewContact FROM Crew; 


SELECT*FROM Crew



/*creating menu table*/
CREATE TABLE Menu(
Menuid varchar(255) PRIMARY KEY,
FoodID varchar(255) FOREIGN KEY REFERENCES Food(FoodID) 
)
INSERT INTO Menu(
Menuid,FoodID)
VALUES('BRKFST','FBID10'),
	  ('BRKFST1','FBID11'),
	  ('BRKFST2','FBID12'),
	  ('BRKFST3','FBID13'),
	  ('BRKFST4','FBID14'),
	  ('LUNCHID','FLID15'),
	  ('LUNCHID1','FLID16'),
	  ('LUNCHID2','FLID17'),
	  ('LUNCHID3','FLID18'),
	  ('LUNCHID4','FLID19'),
	  ('DINNERID','FDID21'),
	  ('DINNERID1','FDID22'),
	  ('DINNERID2','FDID23'),
	  ('DINNERID3','FDID24'),
	  ('DINNERID4','FDID25')


	  SELECT*FROM Menu

	
/*creating Food table*/
CREATE TABLE Food(
FoodID varchar(255) PRIMARY KEY,
FoodName varchar(255) NOT NULL,
FoodStatus varchar(255) ,
FooodPrice int 
)
INSERT INTO Food(FoodID,FoodName,FoodStatus,FooodPrice)
VALUES('FBID10','Pancakes','Available',250),
	  ('FBID11','Cheese Burger ','Available',1200),
	  ('FBID12','Cofee With Milk','Available',750),
	  ('FBID13','Ham Omelette','Available',250),
	  ('FBID14','Tea With Milk','Available',650),
	  ('FLID15','Beef Salad And Rice','Available',2000),
	  ('FLID16','Biriani Special','Available',1500), 
	  ('FLID17','Chiken Wings','Available',1250),
	  ('FLID18','Bowl Of Fries','Available',950),
	  ('FLID19','Spicy Beef','Available',2500),
	  ('FDID21','Sandwitch','Available',1200),
	  ('FDID22','Jerk Pork Chops','Available',2500),
	  ('FDID23','Biriani Special','Available',1900),
	  ('FDID24','Spinach&Ugali','Available',800),
	  ('FDID25','Chapati&Stew','Available',1000)
	  SELECT*FROM Food

	  /*A Food VIEW*/
	  CREATE VIEW FOOD_LIST
	  (F_ID,FOODNAME,FOODSTATUS,fPRICE)AS
	  SELECT FoodID,FoodName,FoodStatus,FooodPrice FROM Food;


CREATE TABLE OrderDetails(
OrderID varchar(255) PRIMARY KEY,
Crewid varchar(255) FOREIGN KEY REFERENCES Crew(Crewid),
Customerid int FOREIGN KEY REFERENCES Customer(Customerid),
FoodID varchar(255) FOREIGN KEY REFERENCES Food(FoodID),
OrderDate varchar(255),
OrderStatus varchar(255)
) 

INSERT INTO OrderDetails(
OrderID,Crewid,Customerid,FoodID,OrderDate,OrderStatus)
VALUES('Oid01','CR01','0011','FBID10','23 1022','Processed'),
	  ('Oid02','CR02','2212','FBID11','24 10 22','Pending'),
	  ('Oid03','CR03','2214','FBID12','25 10 22','Pending'),
	  ('Oid04','CR04','2215','FBID13','26 10 22','Awaiting Payment'),
	  ('Oid05','CR05','2216','FBID14','27 10 22','Processed'),
	  ('Oid06','CR01','2217','FLID15','23 10 22','Processed'),
	  ('Oid07','CR02','2218','FLID16','24 10 22','Pending'),
	  ('Oid08','CR03','2219','FLID17','25 10 22','Pending'),
	  ('Oid09','CR04','2220','FLID18','26 10 22','Processed'),
	  ('Oid10','CR05','2221','FLID19','27 10 22','Pending')

	


	/*A Order details VIEW*/
	  CREATE VIEW ORDER_DTAILS 
	  (ORDERID,CUSTID,FOODID,ORDERDATE,ORDERSTATUS) AS
	  SELECT OrderID,Crewid,FoodID,OrderDate,OrderStatus FROM OrderDetails

	  
CREATE TABLE Payment(
PaymentID varchar(255) PRIMARY KEY,
Customerid int FOREIGN KEY REFERENCES Customer(Customerid),
OrderID varchar(255) FOREIGN KEY REFERENCES OrderDetails(OrderID),
)
INSERT INTO Payment(
PaymentID,Customerid,OrderID)
VALUES ('PID51','0011','Oid01'),
		('PID52','2212','Oid02'),
		('PID53','2214','Oid03'),
		('PID54','2215','Oid04'),
		('PID55','2216','Oid05'),
		('PID56','2217','Oid06'),
		('PID57','2218','Oid07'),
		('PID58','2219','Oid08'),
		('PID59','2220','Oid09'),
		('PID60','2221','Oid10')
		SELECT*FROM Payment

		CREATE VIEW PAY_DTAILS 
	  (PAYID,CUS_ID,ORDERID) AS
	  SELECT PaymentID,Customerid,OrderID FROM Payment;

/*creating delivery table*/
CREATE TABLE Delivery(
Deliveryid varchar(255) PRIMARY KEY,
OrderID varchar(255) FOREIGN KEY REFERENCES OrderDetails(OrderID),
CustomerContact int,
DeliveryDate varchar(255),
CustomerAdress varchar(255)
)
INSERT INTO Delivery(
Deliveryid,OrderID,DeliveryDate,CustomerContact,CustomerAdress)
VALUES('delID1','Oid01','23 10 22',0722171851,'1712 KERICHO'),
      ('delID2','Oid02','24 10 22',0723780930,'2512	NANDI'),
	  ('delID3','Oid03','25 10 22',0716212861,'1903 BOMET'),
	  ('delID4','Oid03','26 10 22',0722134890,'1670 KERICHO'),
	  ('delID5','Oid04','27 10 22',679901123,'1234 KAKAMEGA'),
	  ('delID6','Oid05','23 10 22',030004567,'6541 KERINGET'),
	  ('delID7','Oid06','24 10 22',0784900923,'171234 KERIO'),
	  ('delID8','Oid07','25 10 22',0790171816,'3421 NAIROBI'),
	  ('delID9','Oid08','26 10 22',0122071851,'66790 NAKURU'),
	  ('delID10','Oid09','27 10 22',0722684627,'709045 EMBU')
	  
	  SELECT*FROM Delivery

	  CREATE VIEW DEL_LIST 
	  ( DEL_ID,ORDERID,DEL_DATE,CUS_NO,CUS_ADRESS)AS
	  SELECT Deliveryid,OrderID,DeliveryDate,CustomerContact,CustomerAdress FROM Delivery;


	  
/* 1. a query of adding a column onto the customer table*/
	ALTER TABLE Customer
	ADD Age int;
/*Using the INSERT INTO Statement to add a new row of data on the customer table */
	INSERT INTO Customer VALUES('2470','Jude KIM',0729780930,'1712 nairobi',23)
	INSERT INTO Customer VALUES('56200','YY KIPCHOGE',0726780930,'1712 nakuru',29);


/* 2. a query of updating or rather changing  a customername adress*/
	UPDATE Customer set CustomerAdress='1712 KERICHO' WHERE Customerid='2214'


/* 3.A query to obtain  duplicate and unique records on the customer table   */
	SELECT COUNT( DISTINCT Customerid) FROM [dbo].[Customer] WHERE CustomerAdress='1712 KERICHO'


/* 4. a query for obtaining the CustomerName,Customerid,CustomerContact,CustomerAdress from a customer table where they share the same Location adress */
	  SELECT CustomerName,Customerid,CustomerContact,CustomerAdress
	  FROM Customer
	  WHERE  CustomerAdress='1712 KERICHO'

	  
  /* 5. A query to obtain the FoodName and MenuID of a type of food*/
	  
	  SELECT FoodName,Menuid
	  from Food,Menu
	  where FooodPrice =1200;

	  /* 6.  A query using the AND Operator to obtain customer name,customer contact,adress and age*/

	SELECT * FROM Customer
	WHERE Customerid='0011'
	AND CustomerAdress='1712 KERICHO'; 

/* 7. Using AS Clause . The query  will return a result set with the column for CrewName renamed to Crew Members Names*/

	SELECT CrewName AS 'Crew Members Names'
	FROM Crew;

/* 8. Using the OR Operator to query  Food whose Foodprice   is either 1200 or 2500 */

	SELECT FoodID,FoodName,FooodPrice ,FoodStatus
	FROM Food
	WHERE FooodPrice = 1200
	OR FooodPrice= 2500;

	

	
/* 9. The	LIKE	operator, the  query will  match any CrewName  that begins with the letter 'm' */

	select * from Crew where CrewName like 'm%'


/* 10. Using the AND Operator to obtain the foooName and FoodStatus on the food table*/
	  SELECT FoodName,FoodStatus
		FROM Food
		WHERE FoodID = 'FBID10'
		AND FooodPrice > 50;


/* 11. A query to find the type of food ordered by the customer(pio kerich)*/		
	   SELECT FoodName
	  FROM OrderDetails,Food,Customer
	  WHERE CustomerName='pio kerich'
	  
/* 12. A query to Show food with a price of less than 500 in the restaurant.*/

	SELECT FoodID, FoodName, FooodPrice FROM Food WHERE FooodPrice<=500; 

/* 13. A query to sum the amount Of Food Prices */
	 SELECT SUM(FooodPrice)
	 FROM Food;

/* 14. A query to COUNT the nunmer of type of food on the Breakfast Menu */
	  SELECT COUNT(FoodName)
	  FROM Food,Menu
	  WHERE  Menuid='BRKFST'

/* 15. Show the total sell in 25 10 22 (With the help of View).*/		

	SELECT Deliveryid,OrderStatus FROM Delivery,OrderDetails WHERE DeliveryDate ='25 10 22';

/* 16. a query to find the total  dates of  orders done  by the customers*/
	 
		 SELECT COUNT(DeliveryDate)
		FROM [dbo].[Delivery]
		WHERE DeliveryDate  BETWEEN '23 10 22' AND '27 10 22'

/* 17 .A query to obtain the customer name the delivery date and the order date */

	   SELECT CustomerName ,DeliveryDate,OrderDate
	  FROM Customer,Food,OrderDetails,Delivery
	  WHERE  Deliveryid='delID1' 

/* 18 .A query for selecting Breakfast  */

	 SELECT Menuid,FoodName,CustomerName,OrderID,OrderStatus
	 FROM Menu,Food,Customer,OrderDetails
	 WHERE Menuid='BRKFST'
	
/*19. Using the GROUP BY Clause */

	SELECT FoodID, FoodName FROM Food GROUP BY FooodPrice ;

/*UNION ALL: COMBINES A SET OF TWO OR MORE SELECTED COLUMNS BUT DOES NOT COMBINE SIMILAR VALUES*/

	SELECT Customerid,CustomerName,CrewName  
	FROM Customer
	INNER JOIN Crew
	ON Customer.Customerid =Crew.Crewid;
	SELECT FoodID FROM [dbo].[Food]
	ORDER BY FoodID;

/*Using aggregate functions*/
	SELECT MAX(FooodPrice)
	FROM  Food;

	SELECT MIN(FooodPrice)
	FROM  Food;

	SELECT AVG(FooodPrice)
	FROM  Food;

	SELECT SUM(FooodPrice)
	FROM  Food;

	SELECT COUNT(FooodPrice)
	FROM  Food
	GROUP BY FoodID
	HAVING COUNT(FoodID)>0;



	
/* Applying joins on two different tables */

			/*Inner Join*/

			SELECT OrderDetails.orderID, Customer.CustomerName, OrderDetails.OrderDate
			FROM OrderDetails
			INNER JOIN Customer ON OrderDetails.CustomerID=Customer.CustomerID;

			/*left join*/ 
SELECT OrderDetails.orderID, Customer.CustomerName, OrderDetails.OrderDate
FROM OrderDetails
LEFT JOIN Customer ON OrderDetails.CustomerID=Customer.CustomerID
ORDER BY OrderDetails.OrderDate;

			/*Right Join*/
			SELECT OrderDetails.orderID, Customer.CustomerName, OrderDetails.OrderDate
			FROM OrderDetails
			RIGHT JOIN Customer ON OrderDetails.CustomerID=Customer.CustomerID
			ORDER BY OrderDetails.OrderID;

			/*outer join*/
SELECT OrderDetails.orderID, Customer.CustomerName, OrderDetails.OrderDate
FROM OrderDetails
FULL OUTER JOIN Customer ON OrderDetails.CustomerID=Customer.CustomerID
ORDER BY OrderDetails.OrderDate,OrderID;

/*UNIONS*/

SELECT CustomerAdress FROM Customer
UNION
SELECT CustomerAdress FROM Delivery
ORDER BY CustomerAdress;




/*CARTESIAN PRODUCT*/
			SELECT * FROM Customer
			CROSS JOIN Crew
