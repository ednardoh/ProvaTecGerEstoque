/******************************************************************************/
/***               Generated by IBExpert 14/06/2024 16:27:37                ***/
/******************************************************************************/

/******************************************************************************/
/***      Following SET SQL DIALECT is just for the Database Comparer       ***/
/******************************************************************************/
SET SQL DIALECT 3;



/******************************************************************************/
/***                                 Tables                                 ***/
/******************************************************************************/



CREATE TABLE ENTRADAS_PRODUTOS (
    ID                     INTEGER NOT NULL,
    ID_PRODUTO             INTEGER,
    QUANTIDADE_ENTRADA     FLOAT,
    VALOR_UNITARIO_COMPRA  FLOAT,
    VALOR_TOTAL            FLOAT
);




/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/

ALTER TABLE ENTRADAS_PRODUTOS ADD CONSTRAINT PK_ENTRADAS_PRODUTOS PRIMARY KEY (ID);


/******************************************************************************/
/***                              Foreign Keys                              ***/
/******************************************************************************/

ALTER TABLE ENTRADAS_PRODUTOS ADD CONSTRAINT FK_ENTRADAS_PRODUTOS_1 FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTOS (ID);


/******************************************************************************/
/***                               Privileges                               ***/
/******************************************************************************/

