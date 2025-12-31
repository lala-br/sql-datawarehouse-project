/*
=============================================================
Create Database and Schemas
=============================================================
Purpose:
    Creates a database named 'DataWarehouse' if it does not already exist.
    If the database exists, it is dropped and recreated to ensure a clean setup.
    The script also creates three schemas within the database:
    'bronze', 'silver', and 'gold'.
	
WARNING:
    Executing this script will permanently delete the existing
    'DataWarehouse' database and all its contents.
    Run with caution and ensure appropriate backups are in place.
*/

-- Switch context to the system 'master' database
-- Required to safely create or drop other databases
USE master;
GO

-- Check if the 'DataWarehouse' database exists
-- If it exists, switch to SINGLE_USER mode and drop it
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

  -- Switch context to the newly created database
USE DataWarehouse;
GO

-- Create Schemas: Medallion Architecture Layers
-- bronze: raw ingested data
-- silver: cleaned and standardized data
-- gold: analytics and reporting layer
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
