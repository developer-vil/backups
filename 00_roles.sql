-- Create additional databases
CREATE DATABASE authentication_db;
CREATE DATABASE users_db;
CREATE DATABASE product_db;
CREATE DATABASE order_db;
CREATE DATABASE payment_db;
CREATE DATABASE inventory_db;
CREATE DATABASE admin_db;



-- Grant privileges to the default user (myjyotiadmin)
GRANT ALL PRIVILEGES ON DATABASE authentication_db TO myjyotiadmin;
GRANT ALL PRIVILEGES ON DATABASE users_db TO myjyotiadmin;
GRANT ALL PRIVILEGES ON DATABASE product_db TO myjyotiadmin;
GRANT ALL PRIVILEGES ON DATABASE order_db TO myjyotiadmin;
GRANT ALL PRIVILEGES ON DATABASE payment_db TO myjyotiadmin;
GRANT ALL PRIVILEGES ON DATABASE inventory_db TO myjyotiadmin;
GRANT ALL PRIVILEGES ON DATABASE admin_db TO myjyotiadmin;

-- Optional: Create separate users for each database (recommended for isolation)
CREATE USER auth_user WITH PASSWORD 'auth_password';
CREATE USER users_user WITH PASSWORD 'users_password';
CREATE USER product_user WITH PASSWORD 'product_password';
CREATE USER order_user WITH PASSWORD 'order_password';
CREATE USER payment_user WITH PASSWORD 'payment_password';
CREATE USER inventory_user WITH PASSWORD 'inventory_password';
CREATE USER admin_user WITH PASSWORD 'admin_password';

--Shadow database for prisma-----
GRANT CREATE ON DATABASE users_db TO users_user;
GRANT CREATE ON DATABASE authentication_db TO auth_user;
GRANT CREATE ON DATABASE product_db TO product_user;
GRANT CREATE ON DATABASE order_db TO order_user;
GRANT CREATE ON DATABASE payment_db TO payment_user;
GRANT CREATE ON DATABASE inventory_db TO inventory_user;
GRANT CREATE ON DATABASE admin_db TO admin_user;



-- Grant privileges to the separate users
GRANT ALL PRIVILEGES ON DATABASE authentication_db TO auth_user;
GRANT ALL PRIVILEGES ON DATABASE users_db TO users_user;
GRANT ALL PRIVILEGES ON DATABASE product_db TO product_user;
GRANT ALL PRIVILEGES ON DATABASE order_db TO order_user;
GRANT ALL PRIVILEGES ON DATABASE payment_db TO payment_user;
GRANT ALL PRIVILEGES ON DATABASE inventory_db TO inventory_user;
GRANT ALL PRIVILEGES ON DATABASE admin_db TO admin_user;




-- Switch to the specific databases and grant schema-level privileges

-- Authentication database
\c authentication_db;

-- Grant schema and sequence usage privileges to auth_user
GRANT CREATE ON SCHEMA public TO auth_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO auth_user;
--prisma needs to create a shadow database for migration, so we need to grant permission to create database--
ALTER USER auth_user CREATEDB;


-- Users database
\c users_db;

-- Grant schema and sequence usage privileges to users_user
GRANT CREATE ON SCHEMA public TO users_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO users_user;
ALTER USER users_user CREATEDB;


-- Product database
\c product_db;

-- Grant schema and sequence usage privileges to product_user
GRANT CREATE ON SCHEMA public TO product_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO product_user;
ALTER USER product_user CREATEDB;


-- Order database
\c order_db;

-- Grant schema and sequence usage privileges to order_user
GRANT CREATE ON SCHEMA public TO order_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO order_user;
ALTER USER order_user CREATEDB;


-- Payment database
\c payment_db;

-- Grant schema and sequence usage privileges to order_user
GRANT CREATE ON SCHEMA public TO payment_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO payment_user;
ALTER USER payment_user CREATEDB;


-- Inventory database
\c inventory_db;

-- Grant schema and sequence usage privileges to order_user
GRANT CREATE ON SCHEMA public TO inventory_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO inventory_user;
ALTER USER inventory_user CREATEDB;

-- Admin database
\c admin_db;

-- Grant schema and sequence usage privileges to order_user
GRANT CREATE ON SCHEMA public TO admin_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO admin_user;
ALTER USER admin_user CREATEDB;





