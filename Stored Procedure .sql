--#stored procedure:
/*A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.
So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.
You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed.*/


CREATE PROCEDURE uspProductList
AS
BEGIN
    SELECT 
        product_name, 
        list_price
    FROM 
        production.products
    ORDER BY 
        product_name;
END;

--Executing a stored procedure
--To execute a stored procedure, you use the EXECUTE or EXEC statement followed by the name of the stored procedure:
EXECUTE sp_name ;
or
EXEC sp_name;


--Modifying a stored procedure:
 ALTER PROCEDURE uspProductList
    AS
    BEGIN
        SELECT 
            product_name, 
            list_price
        FROM 
            production.products
        ORDER BY 
            list_price 
    END; 
    

--Deleting a stored procedure:
DROP PROCEDURE sp_name;
--or
DROP PROC sp_name;    



--Creating a stored procedure with one parameter :
ALTER PROCEDURE uspFindProducts(
    @min_list_price AS DECIMAL
    ,@max_list_price AS DECIMAL
)
AS
BEGIN
    SELECT
        product_name,
        list_price
    FROM 
        production.products
    WHERE
        list_price >= @min_list_price AND
        list_price <= @max_list_price
    ORDER BY
        list_price;
END;
-- Excute Procedure:
EXECUTE uspFindProducts 900, 1000;


-- Create Var in Stored Procedure :
CREATE  PROC uspGetProductList(
    @model_year SMALLINT
) AS 
BEGIN
    DECLARE @product_list VARCHAR(MAX);

    SET @product_list = '';

    SELECT
        @product_list = @product_list + product_name 
                        + CHAR(10)
    FROM 
        production.products
    WHERE
        model_year = @model_year
    ORDER BY 
        product_name;

    PRINT @product_list;
END;

-- Excure Proc:
EXEC uspGetProductList 2018 





--



    
