CREATE PROCEDURE delta_load
AS
BEGIN
    -- Declare variables
    DECLARE @max_date DATETIME
    DECLARE @min_date DATETIME

    -- Get the latest load date from the destination table
    SELECT @max_date = MAX(load_date) FROM destination_table

    -- If the destination table is empty, set the minimum load date to the beginning of time
    IF @max_date IS NULL
        SET @min_date = '1900-01-01'
    ELSE
        SET @min_date = @max_date

    -- Select the data to be loaded from the source table
    SELECT *
    FROM source_table
    WHERE load_date > @min_date

    -- Insert the selected data into the destination table
    INSERT INTO destination_table (col1, col2, col3, load_date)
    SELECT col1, col2, col3, GETDATE()
    FROM source_table
    WHERE load_date > @min_date

END
