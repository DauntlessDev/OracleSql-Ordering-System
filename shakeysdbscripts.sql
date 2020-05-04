
CREATE TABLE branch (
    branchid              NUMBER(11) NOT NULL,
    employee_id   	 	  VARCHAR2(20) NOT NULL
);


CREATE UNIQUE INDEX branch__idx2 ON
    branch (
        employee_id
    ASC,
        branchid
    ASC );

ALTER TABLE branch ADD CONSTRAINT branch_pk PRIMARY KEY ( branchid );

CREATE TABLE cashondelivery (
    paymentid    NUMBER(11) NOT NULL,
    amountpaid   NUMBER(11, 2) NOT NULL
);

ALTER TABLE cashondelivery ADD CONSTRAINT cashondelivery_pk PRIMARY KEY ( paymentid );

CREATE TABLE chickenandmojos (
    foodid          NUMBER(11) NOT NULL,
    chickenflavor   VARCHAR2(150) NOT NULL,
    spicedmojos     CHAR(1) NOT NULL
);

ALTER TABLE chickenandmojos ADD CONSTRAINT chickenandmojos_pk PRIMARY KEY ( foodid );

CREATE TABLE creditcard (
    paymentid          NUMBER(11) NOT NULL,
    creditcardnumber   NUMBER NOT NULL
);

ALTER TABLE creditcard ADD CONSTRAINT creditcard_pk PRIMARY KEY ( paymentid );

CREATE TABLE customer (
    customerid                  NUMBER(11) NOT NULL,
    customerfn                  VARCHAR2(150) NOT NULL,
    customermn                  VARCHAR2(150),
    customerln                  VARCHAR2(150) NOT NULL,
    customeremail		VARCHAR2(150) NOT NULL,
    CustomerContactNo           NUMBER(11) NOT NULL,
    accountid   		NUMBER(11) NOT NULL,
    customerbirthmonth          VARCHAR2(50) NOT NULL,
    customerbirthday            VARCHAR2(50) NOT NULL,
    customerbirthyear           VARCHAR2(50) NOT NULL,
    AddressSubdivision 	        VARCHAR2(50),
    CustomerHouseNo             VARCHAR2(50),
    customerbuilding            VARCHAR2(50),
    customerstreet              VARCHAR2(50) NOT NULL,
    customerbarangay            VARCHAR2(50) NOT NULL,
    customerprovince            VARCHAR2(50) NOT NULL,
    customercity                VARCHAR2(50) NOT NULL
);

CREATE UNIQUE INDEX customer__idx ON
    customer (
        accountid
    ASC );

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( customerid );

CREATE TABLE delivery (
    deliveryid                  NUMBER(11) NOT NULL,
    deliverydeparture           timestamp NOT NULL,
    deliveryarrival             timestamp NOT NULL,
    employee_id  		 	    VARCHAR2(20) NOT NULL,
    branchid       		 	    NUMBER(11) NOT NULL,
    paymentid		            NUMBER(11) NOT NULL
);


CREATE UNIQUE INDEX delivery__idx2 ON
    delivery (
        employee_id
    ASC,
        branchid
    ASC );

CREATE UNIQUE INDEX delivery__idxv3 ON
    delivery (
        paymentid
    ASC );

ALTER TABLE delivery ADD CONSTRAINT delivery_pk PRIMARY KEY ( deliveryid );

CREATE TABLE deliveryman (
    deliveryid     		   NUMBER(11) NOT NULL,
    deliverymanname        VARCHAR2(50) NOT NULL,
    employee_id            VARCHAR2(20) NOT NULL,
    branchid               NUMBER(11) NOT NULL
);

CREATE UNIQUE INDEX deliveryman__idx ON
    deliveryman (
        deliveryid
    ASC );
	
CREATE TABLE food (
    foodid                            NUMBER(11) NOT NULL,
    foodtype                          VARCHAR2(2) NOT NULL,
    foodname                          VARCHAR2(150) NOT NULL,
    fooddescription                   VARCHAR2(150) NOT NULL,
    foodprice                         NUMBER(11, 2) NOT NULL
);

ALTER TABLE food ADD CONSTRAINT food_pk PRIMARY KEY ( foodid );

ALTER TABLE deliveryman ADD CONSTRAINT deliveryman_pkv1 PRIMARY KEY ( employee_id,
                                                                      branchid );

CREATE TABLE drink (
    foodid         NUMBER(11) NOT NULL,
    drinkwithice   CHAR(1) NOT NULL,
    incan          CHAR(1) NOT NULL,
    drinksize      VARCHAR2(20) NOT NULL
);

ALTER TABLE drink ADD CONSTRAINT drink_pk PRIMARY KEY ( foodid );

CREATE TABLE employee (
    employee_id       VARCHAR2(20) NOT NULL,
    employeeln        VARCHAR2(150) NOT NULL,
    employeefn        VARCHAR2(150) NOT NULL,
    employeemn        VARCHAR2(150) ,
    employeetype      VARCHAR2(2) NOT NULL,
    branchid   		  NUMBER(11) NOT NULL
);

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( employee_id,
                                                              branchid );

CREATE TABLE facebook (
    accountid                   NUMBER(11) NOT NULL,
    facebookaccountpermission   CHAR(1) NOT NULL
);

ALTER TABLE facebook ADD CONSTRAINT facebook_pk PRIMARY KEY ( accountid );

CREATE TABLE gmail (
    accountid           NUMBER(11) NOT NULL,
    gmaillinkedstatus   CHAR(1) NOT NULL
);

ALTER TABLE gmail ADD CONSTRAINT gmail_pk PRIMARY KEY ( accountid );

CREATE TABLE manager (
    managerdepartment           VARCHAR2(150) NOT NULL,
    branchid            	    NUMBER(11) NOT NULL,
    employee_id                 VARCHAR2(20) NOT NULL

);	

CREATE UNIQUE INDEX manager__idxv2 ON
    manager (
        branchid
    ASC );

ALTER TABLE manager ADD CONSTRAINT manager_pkv1 PRIMARY KEY ( employee_id,
                                                              branchid );

ALTER TABLE manager ADD CONSTRAINT manager_pk UNIQUE ( managerdepartment );

CREATE TABLE orderdetails (
    quantity                     NUMBER NOT NULL,
    orderid                      NUMBER(11) NOT NULL,
    foodid                       NUMBER(11) NOT NULL,
    deliveryid                   NUMBER(11) NOT NULL
);

ALTER TABLE orderdetails ADD CONSTRAINT orderdetails_pk PRIMARY KEY ( orderid,
                                                                      foodid );

CREATE TABLE orders (
    orderid               NUMBER(11) NOT NULL,
    orderdate             DATE NOT NULL,
    customerid   		  NUMBER(11) NOT NULL,
    paymentid      		  NUMBER(11) NOT NULL,
    paidstatus            CHAR(1) NOT NULL

);

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( orderid );

CREATE TABLE pasta (
    foodid      NUMBER(11) NOT NULL,
    pastasize   VARCHAR2(150) NOT NULL
);

ALTER TABLE pasta ADD CONSTRAINT pasta_pk PRIMARY KEY ( foodid );

CREATE TABLE payment (
    paymentid                    NUMBER(11) NOT NULL,
    paymentnetprice              NUMBER(11, 2) NOT NULL,
    paymentcashpaid              NUMBER(11, 2) NOT NULL,
    orderid              		 NUMBER(11) NOT NULL,
    deliveryid   				 NUMBER(11) NOT NULL,
    paymenttype                  VARCHAR2(3) NOT NULL
    
);

CREATE UNIQUE INDEX payment__idx ON
    payment (
        orderid
    ASC,
        deliveryid
    ASC );

CREATE UNIQUE INDEX payment__idxv2 ON
    payment (
        deliveryid
    ASC );

ALTER TABLE payment ADD CONSTRAINT payment_pk PRIMARY KEY ( paymentid );

CREATE TABLE pizza (
    foodid         NUMBER(11) NOT NULL,
    pizzatopping   VARCHAR2(150) NOT NULL,
    pizzasize      NUMBER(2) NOT NULL,
    pizzacrust     VARCHAR2(20) NOT NULL
);

ALTER TABLE pizza ADD CONSTRAINT pizza_pk PRIMARY KEY ( foodid );

CREATE TABLE shakeys_account (
    accountid             NUMBER(11) NOT NULL,
    logintype             CHAR(2) NOT NULL,
    accountemail	      VARCHAR2(50) NOT NULL,
    accountpassword       VARCHAR2(50) NOT NULL,
    customerid   		  NUMBER(11) NOT NULL
);

CREATE UNIQUE INDEX shakeys_account__idx ON
    shakeys_account (
        customerid
    ASC );

ALTER TABLE shakeys_account ADD CONSTRAINT shakeys_account_pk PRIMARY KEY ( accountid );


--EMPLOYEE BRANCH TABLE
insert into branch (branchid,employee_id)
values 
(100,4000);

insert into branch (branchid,employee_id)
values 
(101,4005);

insert into branch (branchid,employee_id)
values 
(102,4010);

insert into branch (branchid,employee_id)
values 
(103,4015);

insert into branch (branchid,employee_id)
values 
(104,4020);

--CASH ON DELIVERY --

insert into cashondelivery
values 
(4000, 1500);

insert into cashondelivery
values 
(4001, 2000);

insert into cashondelivery
values 
(4002, 2600);

insert into cashondelivery
values 
(4003, 1000);

insert into cashondelivery
values 
(4004, 5500);


--=============================== CHICKENANDMOJOS TABLE =====================================
    

INSERT INTO CHICKENANDMOJOS(FOODID, CHICKENFLAVOR, SPICEDMOJOS)
VALUES (3510, 'Regular',0);

INSERT INTO CHICKENANDMOJOS(FOODID, CHICKENFLAVOR, SPICEDMOJOS)
VALUES (3512, 'N/A',0);

INSERT INTO CHICKENANDMOJOS(FOODID, CHICKENFLAVOR, SPICEDMOJOS)
VALUES (3514, 'Regular',0);

INSERT INTO CHICKENANDMOJOS(FOODID, CHICKENFLAVOR, SPICEDMOJOS)
VALUES (3516, 'Regular',0);

INSERT INTO CHICKENANDMOJOS(FOODID, CHICKENFLAVOR, SPICEDMOJOS)
VALUES (3518, 'N/A  ',0);

--========================================CREDIT CARD================================

insert into creditcard
values
(4000, 234589);

insert into creditcard
values
(4001, 326499);

insert into creditcard
values
(4002, 980324);

insert into creditcard
values
(4003, 456223);

insert into creditcard
values
(4004, 132778);

--===================================ORDER DETAILS======================================
INSERT INTO CUSTOMER
VALUES (4000, 'Bryan', 'Munson','Puspos', 'bryan@gmail.com', 09462534413, 
5000, 'Nov',11,1980, 'Camachile Subdivision' , 'BLk 18 Lot 9', null, 
'15th Street', 'Pasong Camachile', 'General Trias', 'Cavite');


INSERT INTO CUSTOMER
VALUES (4005, 'Jade', 'Pion','Rebola', 'jadepion@ymail.com', 09662930798, 
5002, 'July',25,1988, null , null, 'iTower II', 
'P. Paredes St.', 'Barangay 123', 'Sampaloc', 'Manila');


INSERT INTO CUSTOMER
VALUES (4010, 'Chin', 'Papor' ,'Nanas', 'chin.pr@yahoo.com', 09105412473, 
5004, 'Oct',5,2000, 'San Juan 1' , null, null,
'Pepe Heneral St.', 'Malabon', 'General Trias', 'Cavite');


INSERT INTO CUSTOMER
VALUES (4015, 'Shanaia', 'Lin','Manggalak', 'mangshan@gmail.com', 09267834291,
5006, 'March',9,1996, null ,
null,'Premium Suites', 'Thomas Morato Avenue', 'Timog', 'Quezon City', 'Manila');


INSERT INTO CUSTOMER
VALUES (4020,'Robert', 'Lin','Manggalak', 'robertlm@yahoo.com', 09967734413,
5008, 'Sept',9,1979, 'Kalayaan Subd.' , '1070', null, 
'Aguinaldo 101', 'Camellia Homes', 'Batangas City', 'Batangas');

--=================================================================================

INSERT INTO CUSTOMER
VALUES (4025, 'Jeremy', 'Padilla','Donato', 'donatojeremy@gmail.com', 09892343321, 
5010, 'Mar',22,1992, 'Reyes Subdivision' , 'BLk 1', null, 
'Berkerley Street', 'Reyes Tower', 'Pampanga', 'Buyan City');


INSERT INTO CUSTOMER
VALUES (4030, 'Kirby', 'Santos','Aguinaldo', 'kirbysan@ymail.com', 09252955798, 
5012, 'July',1,2003, null , null, 'iTower II', 
'EarnShaw St.', 'Barangay 1450', 'Palawan', 'Reina Mercedes');


INSERT INTO CUSTOMER
VALUES (4035, 'Chyn', 'Uy' ,'Cayme', 'chynuy@yahoo.com', 09278871256, 
5014, 'Oct',26,1999, 'Beverly Hills' , null, null,
'Minante II', 'Minante II', 'Isabella', 'Cauayan City');


INSERT INTO CUSTOMER
VALUES (4040, 'Kyla', 'Mae','Cabatan', 'kylacabatan@gmail.com', 09237772345,
5016, 'May',15,1998, null ,
null,'Silver Suites', 'Project 8', 'Morato', 'Novaliches', 'Quezon City');


INSERT INTO CUSTOMER
VALUES (4045,'Gaile', 'Lim','De Leon', 'gailerupok@yahoo.com', 0929887654,
5018, 'Nov',10,1987, 'Dimaunahan Subd.' , '998', null, 
'Luna 11', 'Carmina Homes', 'Batanes', 'Batangas Island');

--====================================================================

INSERT INTO CUSTOMER
VALUES (4050, 'Loda', 'Berg','Berger', 'lodaberg@gmail.com', 09294567672, 
5020, 'April',23,1990, 'Pinzon Subdivision' , 'BLk 23 Lot 9', null, 
'9th Street', 'San Fabian', 'Isabela', 'Echague');


INSERT INTO CUSTOMER
VALUES (4055, 'Jalen', 'Rivera','Saladino', 'saladinopaul31@ymail.com', 0989231231, 
5022, 'May',31,2001, null , null, 'Crown Tower U Belt', 
'Tolentino St.', 'Barangay 960', 'Sampaloc', 'Manila');


INSERT INTO CUSTOMER
VALUES (4060, 'Brave', 'Middle' ,'Paz', 'bravelovegab@yahoo.com', 092912344589, 
5024, 'Nov',10,2000, 'Village 2' , null, null,
'P. Noval St.', 'Barangay 23', 'Laguna', 'Sta. Rosa');


INSERT INTO CUSTOMER
VALUES (4065, 'Gabrielle', 'Paz','Cabrera', 'gabnotloveebrave@gmail.com', 09357889912,
5026, 'Mar',9,1996, null ,
null,'Premium Suites', 'Thomas Avenue', 'Timog', 'Quezon City', 'Manila');


INSERT INTO CUSTOMER
VALUES (4070,'Jean', 'Gatbonton','Dela Rosa', 'jean12lm@yahoo.com', 0923445776,
5028, 'Jan',2,1997, 'Greenbelt Subdivision.' , 'null', null, 
'Moret St.', 'Green Homes', 'Cagayan', 'Santiago');

--===============================DELIVERY=========================
set time_zone ='+00:00';

insert into delivery 
values 
(2000, '11-11-2019 07:32:03', '11-11-2019 08:05:12',  4000, 100, 4000);

insert into delivery 
values 
(2001, '10-11-2019 08:22:00', '10-11-2019 08:45:23',  4005, 101, 4001);

insert into delivery 
values 
(2002, '09-23-2019 09:01:02', '09-23-2019 09:31:03', 4010, 102, 4002);

insert into delivery
values
(2003, '04-01-2019 10:30:01', '04-01-2019 11:05:45', 4015, 103, 4003);

insert into delivery
values
(2004, '07-20-2019 02:55:38', '07-21-2019 03:23:43', 4020, 104, 4004);

--====DELIVERY MAN ==========

insert into deliveryman (deliveryid,deliverymanname,employee_id,branchid)
values (2000,'Dan Sayo',4000,100);

insert into deliveryman (deliveryid,deliverymanname,employee_id,branchid)
values (2001,'Marco San Juan',4005,101);

insert into deliveryman (deliveryid,deliverymanname,employee_id,branchid)
values (2002,'Brave Heart',4010,102);

insert into deliveryman (deliveryid,deliverymanname,employee_id,branchid)
values (2003,'Jof Abis',4015,103);

insert into deliveryman (deliveryid,deliverymanname,employee_id,branchid)
values (2004,'Kim Revilloza',4020,104);

------- PIZZA -------

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3500,'PZ','Prosciutto Parmigiano', 'Topped with Prosciutto Slices and Parmesan Cheese.', 353.00 );

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3502,'PZ','Manager''s Choice Pizza', 'Our No. 1 Flavor. It''s as Pizza as it can get!', 291.00 );

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3504,'PZ','Friday Special', 'A Pizza Loaded with Shrimp, Anchovies and Mushrooms.', 353.00 );

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3506,'PZ','Angus Steakhouse', 'Creamy White Sauce Topped With Natural Cheddar Cheese and Smoked Meats.', 353.00 );

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3508,'PZ','Hawaiian Delight', 'All-Time Favorite Ham And Pineapple.', 281.00);

------- CHICKEN AND MOJOS ------------

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3510,'CM','Buddy Pack', 'Contains 5 pieces Chicken with Mojos.', 564.00);

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3512,'CM','Basket of Mojos', 'Comes with 2 dips and serves 4-5 people.', 344.00);

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3514,'CM','Chicken ''N'' Mojos Blowout', '20pc Chicken With Family Sized Basket Of Mojos.', 2119.00);

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3516,'CM','Party Pack', 'Contains 12 pieces Chicken with generous amount of mojos.', 1271.00);

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3518,'CM','Mojos Supreme', 'A bucket filled with mojos with unique seasoning. Yum!', 466.00);


------------- PASTA ----------------


INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3520,'PA','Seafood Marinara', 'Premium Pasta with Robust Italian Flavor!', 276.00);

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3522,'PA','Monster Spaghetti Meatball', 'A monstrous-sized home-style meatball on a premium pasta with tangy tomato sauce.', 255);

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3524,'PA','Prima Lasagna', 'A Premium Pasta Dish Generously Smothered With Three Kinds Of Cheeses.', 240.00);

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3526,'PA','Carbonara Supreme', 'A Pasta with Rich White Sauce Topped with Cheese and Ham.', 229.00);

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3528,'PA','Black Seafood Pasta', 'Black Pasta With Scallops, With Garlic Bread on the Side.', 276.00);

---------- DRINKS ------------------

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3530,'DR','Regular Coke Zero 1.5L', '1.5 Liter Coke Zero Brand Soda.', 104.00);

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3532,'DR','Royal Orange in Can', '330mL Royal Can.', 93.00);

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3534,'DR','Novellino Rosso Classico Wine', 'A soft and subtle, lightly fermented red wine with a sweet character and elegant finish.', 435.00);

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3536,'DR','Sprite in Can', '330mL Sprite Can.', 93.00);

INSERT INTO FOOD(FOODID, FOODTYPE, FOODNAME, FOODDESCRIPTION,FOODPRICE)
VALUES (3538,'DR','Regular Coke 1.5L', '1.5 Liter Coca-Cola Brand Soda.', 104.00);

--=============================== DRINKS TABLE =====================================

INSERT INTO DRINK(FOODID, DRINKWITHICE, INCAN, DRINKSIZE)
VALUES (3530, 0, 0, '1.5 L');

INSERT INTO DRINK(FOODID, DRINKWITHICE, INCAN, DRINKSIZE)
VALUES (3532, 0, 1, '330 mL');

INSERT INTO DRINK(FOODID, DRINKWITHICE, INCAN, DRINKSIZE)
VALUES (3534, 0, 0, '750 mL');

INSERT INTO DRINK(FOODID, DRINKWITHICE, INCAN, DRINKSIZE)
VALUES (3536, 0, 1, '330 mL');

INSERT INTO DRINK(FOODID, DRINKWITHICE, INCAN, DRINKSIZE)
VALUES (3538, 0, 0, '1.5 L');


-- EMPLOYEE inputs Employee table

insert into Employee (employee_id, employeeln,employeefn,employeemn,employeetype,branchid )
values (4000,'San Juan','Marco','Eslabon','DM',100);

insert into Employee (employee_id, employeeln,employeefn,employeemn,employeetype,branchid )
values (4005,'Abis','Jake','Santos','DM',101);

insert into Employee (employee_id, employeeln,employeefn,employeemn,employeetype,branchid )
values (4010,'Santos','Denise','Dela Cruz','DM',102);

insert into Employee (employee_id, employeeln,employeefn,employeemn,employeetype,branchid )
values (4015,'Wa','John','Chua','DM',103);

insert into Employee (employee_id, employeeln,employeefn,employeemn,employeetype,branchid )
values (4020,'Leuterio','Brave','Silva','DM',104);


--MANAGER INPUTS EMPLOYEE TABLE
insert into Employee (employee_id, employeeln,employeefn,employeemn,employeetype,branchid )
values (4025,'Switft','Taylor','Sayo','M',100);

insert into Employee (employee_id, employeeln,employeefn,employeemn,employeetype,branchid )
values (4030,'Pingol','Ryan','Fernandez','M',101);

insert into Employee (employee_id, employeeln,employeefn,employeemn,employeetype,branchid )
values (4035,'Mendoza','Darwin','Ampatuan','M',102);

insert into Employee (employee_id, employeeln,employeefn,employeemn,employeetype,branchid )
values (4040,'Nanquil','Gail','Gabriel','M',103);

insert into Employee (employee_id, employeeln,employeefn,employeemn,employeetype,branchid )
values (4045,'Aquino','Robert','Duterte','M',104);

--====== FACEBOOK TABLE ======--
INSERT INTO FACEBOOK (accountid, facebookaccountpermission) VALUES (5000, 1);

INSERT INTO FACEBOOK (accountid, facebookaccountpermission) VALUES (5002, 0);

INSERT INTO FACEBOOK (accountid, facebookaccountpermission) VALUES (5004, 1);

INSERT INTO FACEBOOK (accountid, facebookaccountpermission) VALUES (5006, 1);

INSERT INTO FACEBOOK (accountid, facebookaccountpermission) VALUES (5008, 0);

--====== GMAIL TABLE ======--
INSERT INTO GMAIL (accountid, gmaillinkedstatus) VALUES (5000, 1);

INSERT INTO GMAIL (accountid, gmaillinkedstatus) VALUES (5002, 1);

INSERT INTO GMAIL (accountid, gmaillinkedstatus) VALUES (5004, 1);

INSERT INTO GMAIL (accountid, gmaillinkedstatus) VALUES (5006, 1);

INSERT INTO GMAIL (accountid, gmaillinkedstatus) VALUES (5008, 1);

-- INPUTS MANAGER TABLE
insert into Manager (managerdepartment,branchid,employee_id)
values ('Taguig',100,4000);


insert into Manager (managerdepartment,branchid,employee_id)
values ('Quezon',101,4005);


insert into Manager (managerdepartment,branchid,employee_id)
values ('Makati',102,4010);


insert into Manager (managerdepartment,branchid,employee_id)
values ('Pasig',103,4015);


insert into Manager (managerdepartment,branchid,employee_id)
values ('Manila',104,4020);

--====================================ORDER DETAILS========================================


INSERT INTO ORDERDETAILS
VALUES (1,1500,3500,2000);

INSERT INTO ORDERDETAILS
VALUES (2,1501,3502,2001);

INSERT INTO ORDERDETAILS
VALUES (2,1502,3504,2002);

INSERT INTO ORDERDETAILS
VALUES (1,1503,3506,2003);

INSERT INTO ORDERDETAILS
VALUES (3,1504,3508,2004);

--========================= ORDERS TABLE =========================--
-- deleted the ordertype column
INSERT INTO ORDERS (orderid, orderdate, customerid, paidstatus, paymentid) 
VALUES (1500,  '04-29-2019', 4000, 1, 4000);

INSERT INTO ORDERS (orderid, orderdate, customerid, paidstatus, paymentid) 
VALUES (1501, '05-23-2019', 4005, 1, 4001);

INSERT INTO ORDERS (orderid, orderdate, customerid, paidstatus, paymentid)
VALUES (1502,  '05-20-2019', 4010, 1, 4002);

INSERT INTO ORDERS (orderid, orderdate, customerid, paidstatus, paymentid) 
VALUES (1503,  '06-13-2019', 4015, 1, 4003);

INSERT INTO ORDERS (orderid, orderdate, customerid, paidstatus, paymentid) 
VALUES (1504,  '08-02-2019', 4020, 1, 4004);

--=============================== PASTA TABLE =====================================
    

INSERT INTO PASTA(FOODID, PASTASIZE)
VALUES (3520, 'Solo');

INSERT INTO PASTA(FOODID, PASTASIZE)
VALUES (3522, 'Solo');

INSERT INTO PASTA(FOODID, PASTASIZE)
VALUES (3524, 'Solo');

INSERT INTO PASTA(FOODID, PASTASIZE)
VALUES (3526, 'Solo');

INSERT INTO PASTA(FOODID, PASTASIZE)
VALUES (3528, 'Solo');

 
--================================PAYMENT ================================================


insert into payment
values
(4000, 1000.02, 1500, 1500, 2000, 'COD');

insert into payment
values
(4001, 1623.3, 2000, 1501, 2001, 'CC');

insert into payment
values
(4002, 2532, 2600, 1502, 2002, 'COD');

insert into payment
values
(4003, 970, 1000, 1503, 2003, 'COD');

insert into payment
values
(4004, 5324, 5500, 1504, 2004, 'CC');

--============================= PIZZA TABLE =========================================

INSERT INTO PIZZA( FOODID, PIZZATOPPING, PIZZASIZE, PIZZACRUST)
VALUES (3500,'Prosciutto Slices, Parmesan Cheese', 12, 'Thin Crust');


INSERT INTO PIZZA( FOODID, PIZZATOPPING, PIZZASIZE, PIZZACRUST)
VALUES (3502,'Ham, Beef, Italian Sausage, Green Bell Pepper, Onion', 12, 'Thin Crust');


INSERT INTO PIZZA( FOODID, PIZZATOPPING, PIZZASIZE, PIZZACRUST)
VALUES (3504,'Shrimp, Anchovies, Mushrooms', 12, 'Thin Crust');


INSERT INTO PIZZA( FOODID, PIZZATOPPING, PIZZASIZE, PIZZACRUST)
VALUES (3506,'Angus Beef, Roasted Onions, Sliced Mushrooms, Potato Strings', 12, 'Thin Crust');


INSERT INTO PIZZA( FOODID, PIZZATOPPING, PIZZASIZE, PIZZACRUST)
VALUES (3508,'Ham, Pineapple, Mozzarella Cheese', 12, 'Thin Crust');


--========================= SHAKEYS_ACCOUNT TABLE =========================--
-- G -> GMAIL / F -> FACEBOOK / S -> SHAKEYS
INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail, accountpassword, customerid) 
VALUES (5000, 'F', 'bryan1@gmail.com', 'brYan1052', 4000);

INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail, accountpassword, customerid)
 VALUES (5002, 'F', 'jadepion@ymail.com', 'reboLA8201', 4005);

INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail,  accountpassword, customerid) 
VALUES (5004, 'F', 'chin.pr@yahoo.com', 'Cpr12207', 4010);

INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail,  accountpassword, customerid)
 VALUES (5006, 'F', 'mangshan@gmail.com', 'msHAN2289', 4015);

INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail, accountpassword, customerid)
 VALUES (5008, 'F', 'robertlm@yahoo.com', 'manGALAK0101', 4020);
 
INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail, accountpassword, customerid) 
VALUES (5010, 'G', 'bravegwaps1@gmail.com', 'brave143', 4025);

INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail, accountpassword, customerid)
 VALUES (5012, 'G', 'kimganda@ymail.com', 'kimberley22', 4030);

INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail,  accountpassword, customerid) 
VALUES (5014, 'G', 'jofthegamer@yahoo.com', 'jofmario123', 4035);

INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail,  accountpassword, customerid)
 VALUES (5016, 'G', 'marcoweather@gmail.com', 'weathermarco567', 4040);

INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail, accountpassword, customerid)
 VALUES (5018, 'G', 'danthegreat@yahoo.com', 'pinakamalakas123', 4045);
 
 INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail, accountpassword, customerid) 
VALUES (5020, 'S', 'romulo321@gmail.com', 'romulol321', 4050);

INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail, accountpassword, customerid)
 VALUES (5022, 'S', 'jane458@ymail.com', 'feujane22', 4055);

INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail,  accountpassword, customerid) 
VALUES (5024, 'S', 'geofrreythegamer@yahoo.com', 'marioluigi123', 4060);

INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail,  accountpassword, customerid)
 VALUES (5026, 'S', 'kuyakim32@gmail.com', 'weatherlang567', 4065);

INSERT INTO SHAKEYS_ACCOUNT (accountid, logintype, accountemail, accountpassword, customerid)
 VALUES (5028, 'S', 'joshuathegreat@yahoo.com', 'asdbghs123', 4070);
 
ALTER TABLE shakeys_account
    ADD CONSTRAINT shakeys_account_customer_fk FOREIGN KEY ( customerid )
        REFERENCES customer ( customerid );

ALTER TABLE pizza
    ADD CONSTRAINT pizza_food_fk FOREIGN KEY ( foodid )
        REFERENCES food ( foodid );
        
ALTER TABLE payment
    ADD CONSTRAINT payment_delivery_fk FOREIGN KEY ( deliveryid )
        REFERENCES delivery ( deliveryid );

ALTER TABLE pasta
    ADD CONSTRAINT pasta_food_fk FOREIGN KEY ( foodid )
        REFERENCES food ( foodid );
        
ALTER TABLE orders
    ADD CONSTRAINT orders_payment_fk FOREIGN KEY (paymentid )
        REFERENCES payment ( paymentid );

ALTER TABLE orders
    ADD CONSTRAINT orders_customer_fk FOREIGN KEY ( customerid )
        REFERENCES customer ( customerid );
        
ALTER TABLE orderdetails
    ADD CONSTRAINT orderdetails_orders_fk FOREIGN KEY ( orderid )
        REFERENCES orders ( orderid );
        
ALTER TABLE orderdetails
    ADD CONSTRAINT orderdetails_food_fk FOREIGN KEY ( foodid )
        REFERENCES food ( foodid );
        
ALTER TABLE manager
    ADD CONSTRAINT manager_employee_fk FOREIGN KEY ( employee_id,
                                                     branchid )
        REFERENCES employee ( employee_id,
                              branchid );

ALTER TABLE manager
    ADD CONSTRAINT manager_branch_fk FOREIGN KEY ( branchid )
        REFERENCES branch ( branchid );
 
ALTER TABLE gmail
    ADD CONSTRAINT gmail_shakeys_account_fk FOREIGN KEY ( accountid )
        REFERENCES shakeys_account ( accountid );

ALTER TABLE facebook
    ADD CONSTRAINT facebook_shakeys_account_fk FOREIGN KEY ( accountid )
        REFERENCES shakeys_account ( accountid );
    
ALTER TABLE employee
    ADD CONSTRAINT employee_branch_fk FOREIGN KEY ( branchid )
        REFERENCES branch ( branchid );
        
ALTER TABLE drink
    ADD CONSTRAINT drink_food_fk FOREIGN KEY ( foodid )
        REFERENCES food ( foodid );

ALTER TABLE deliveryman
    ADD CONSTRAINT deliveryman_employee_fk FOREIGN KEY ( employee_id,
                                                         branchid )
        REFERENCES employee ( employee_id,
                              branchid );
                              
ALTER TABLE deliveryman
    ADD CONSTRAINT deliveryman_delivery_fk FOREIGN KEY ( deliveryid )
        REFERENCES delivery ( deliveryid );
        
ALTER TABLE delivery
    ADD CONSTRAINT delivery_payment_fk FOREIGN KEY ( paymentid )
        REFERENCES payment ( paymentid );
        
ALTER TABLE delivery
    ADD CONSTRAINT delivery_deliveryman_fkv1 FOREIGN KEY ( employee_id,
                                                           branchid )
        REFERENCES deliveryman ( employee_id,
                                 branchid );
                                 
ALTER TABLE customer
    ADD CONSTRAINT customer_shakeys_account_fk FOREIGN KEY ( accountid )
        REFERENCES shakeys_account ( accountid );
 
ALTER TABLE creditcard
    ADD CONSTRAINT creditcard_payment_fk FOREIGN KEY ( paymentid )
        REFERENCES payment ( paymentid );       
        
ALTER TABLE chickenandmojos
    ADD CONSTRAINT chickenandmojos_food_fk FOREIGN KEY ( foodid )
        REFERENCES food ( foodid );   
        
ALTER TABLE cashondelivery
    ADD CONSTRAINT cashondelivery_payment_fk FOREIGN KEY ( paymentid )
        REFERENCES payment ( paymentid );       
        
ALTER TABLE branch
    ADD CONSTRAINT branch_manager_fkv1 FOREIGN KEY ( employee_id,
                                                     branchid )
        REFERENCES manager ( employee_id,
                             branchid );


