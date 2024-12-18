CREATE TABLE CUSTOMER (
  ID INTEGER  NOT NULL  ,
  Name VARCHAR    ,
  Surname VARCHAR  NOT NULL  ,
  Father_Name VARCHAR    ,
  City VARCHAR    ,
  Street VARCHAR    ,
  Number VARCHAR    ,
  Zip VARCHAR    ,
  Email VARCHAR      ,
PRIMARY KEY(ID));



CREATE TABLE WAREHOUSE (
  ID INTEGER  NOT NULL  ,
  Phone VARCHAR(10)    ,
  City VARCHAR    ,
  Street VARCHAR    ,
  Number VARCHAR    ,
  Zip VARCHAR      ,
PRIMARY KEY(ID));



CREATE TABLE PUBLISHING_HOUSE (
  ID INTEGER  NOT NULL  ,
  Name VARCHAR  NOT NULL  ,
  URL VARCHAR      ,
PRIMARY KEY(ID));



CREATE TABLE WRITER (
  ID INTEGER  NOT NULL  ,
  Email VARCHAR    ,
  Full Name VARCHAR  NOT NULL    ,
PRIMARY KEY(ID));



CREATE TABLE CART (
  ID INTEGER  NOT NULL  ,
  CUSTOMER_ID INTEGER  NOT NULL  ,
  Date DATETIME  NOT NULL    ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(CUSTOMER_ID)
    REFERENCES CUSTOMER(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CART_FKIndex1 ON CART (CUSTOMER_ID);



CREATE TABLE BOOK (
  ID INTEGER  NOT NULL  ,
  ID_Publishing_House INTEGER  NOT NULL  ,
  ID_WAREHOUSE INTEGER  NOT NULL  ,
  Title VARCHAR  NOT NULL  ,
  PublishYear INTEGER    ,
  ISBN INTEGER  NOT NULL  ,
  Price INTEGER  NOT NULL  ,
  Availability INTEGER  NOT NULL    ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(ID_WAREHOUSE)
    REFERENCES WAREHOUSE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ID_Publishing_House)
    REFERENCES PUBLISHING_HOUSE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX BOOK_FKIndex1 ON BOOK (ID_WAREHOUSE);
CREATE INDEX BOOK_FKIndex2 ON BOOK (ID_Publishing_House);



CREATE TABLE CART_HAS_BOOK (
  CART_ID INTEGER  NOT NULL  ,
  BOOK_ID INTEGER  NOT NULL  ,
  Discount INTEGER      ,
PRIMARY KEY(CART_ID, BOOK_ID)    ,
  FOREIGN KEY(CART_ID)
    REFERENCES CART(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(BOOK_ID)
    REFERENCES BOOK(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CART_has_BOOK_FKIndex1 ON CART_HAS_BOOK (CART_ID);
CREATE INDEX CART_has_BOOK_FKIndex2 ON CART_HAS_BOOK (BOOK_ID);



CREATE TABLE PHONES (
  Phone INTEGER  NOT NULL  ,
  PUBLISHING_HOUSE_ID INTEGER    ,
  CUSTOMER_ID INTEGER        ,
  FOREIGN KEY(CUSTOMER_ID)
    REFERENCES CUSTOMER(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(PUBLISHING_HOUSE_ID)
    REFERENCES PUBLISHING_HOUSE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX PHONES_FKIndex1 ON PHONES (CUSTOMER_ID);
CREATE INDEX PHONES_FKIndex2 ON PHONES (PUBLISHING_HOUSE_ID);



CREATE TABLE WRITER_HAS_BOOK (
  WRITER_ID INTEGER  NOT NULL  ,
  BOOK_ID INTEGER  NOT NULL    ,
PRIMARY KEY(WRITER_ID, BOOK_ID)    ,
  FOREIGN KEY(WRITER_ID)
    REFERENCES WRITER(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(BOOK_ID)
    REFERENCES BOOK(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX WRITER_has_BOOK_FKIndex1 ON WRITER_HAS_BOOK (WRITER_ID);
CREATE INDEX WRITER_has_BOOK_FKIndex2 ON WRITER_HAS_BOOK (BOOK_ID);



