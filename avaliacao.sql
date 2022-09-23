DROP DATABASE IF EXISTS estoque;
CREATE DATABASE estoque;

use estoque;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS companies;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS clients_products;
DROP TABLE IF EXISTS users_products;

CREATE TABLE roles (
    role_id INTEGER NOT NULL PRIMARY KEY auto_increment,
    cargo VARCHAR(255)
);

DESC roles;

CREATE TABLE users (
    user_id INTEGER NOT NULL PRIMARY KEY auto_increment,
    name_id VARCHAR(255),
    user_address VARCHAR(255),
    role_id INTEGER,
    FOREIGN KEY (role_id) REFERENCES roles (role_id)
);

DESC users;

CREATE TABLE companies (
    company_id INTEGER NOT NULL PRIMARY KEY auto_increment,
    company_name VARCHAR(255)
);

DESC companies;

CREATE TABLE products (
    product_id INTEGER NOT NULL PRIMARY KEY auto_increment,
    product_name VARCHAR(255),
    buy_price FLOAT,
    sell_price FLOAT,
    ammount INTEGER,
    company_id INTEGER,
    FOREIGN KEY (company_id) REFERENCES companies (company_id)
);

DESC products;

CREATE TABLE clients (
    client_id INTEGER NOT NULL PRIMARY KEY auto_increment,
    client_name VARCHAR(255),
    client_cpf_and_cnpj VARCHAR(255),
    client_address VARCHAR(255)
);

DESC clients;

CREATE TABLE clients_products (
    client_id INTEGER,
    product_id INTEGER,
    FOREIGN KEY (client_id) REFERENCES clients (client_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

DESC clients_products;

CREATE TABLE users_products (
    user_id INTEGER,
    product_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

DESC users_products;

INSERT INTO roles (cargo) VALUES
('Seller'),
('Secretary'),
('manager'),
('Director');

SELECT * FROM roles;

INSERT INTO users (name_id, user_address, role_id) VALUES
();

SELECT * FROM users;

INSERT INTO companies (company_name) VALUES
();

SELECT * FROM companies;

INSERT INTO products (product_name, buy_price, sell_price, ammount, company_id) VALUES
();

SELECT * FROM products;

INSERT INTO clients (client_name, client_cpf_and_cnpj, client_address) VALUES
();

SELECT * FROM clients;

INSERT INTO clients_products (client_id, product_id) VALUES
    (
        (SELECT client_id FROM clients WHERE clients.client_name = ''),
        (SELECT product_id FROM products WHERE products.product_name = '')         
    ),
    (
        (SELECT client_id FROM clients WHERE clients.client_name = ''),
        (SELECT product_id FROM products WHERE products.product_name = '')         
    ),
    (
        (SELECT client_id FROM clients WHERE clients.client_name = ''),
        (SELECT product_id FROM products WHERE products.product_name = '')         
    ),
    (
        (SELECT client_id FROM clients WHERE clients.client_name = ''),
        (SELECT product_id FROM products WHERE products.product_name = '')         
    );

SELECT * FROM clients_products;

INSERT INTO users_products (user_id, product_id) VALUES
    (
        (SELECT user_id FROM users WHERE users.name_id = ''),
        (SELECT product_id FROM products WHERE products.product_name = '')         
    ),
    (
        (SELECT user_id FROM users WHERE users.name_id = ''),
        (SELECT product_id FROM products WHERE products.product_name = '')         
    ),
    (
        (SELECT user_id FROM users WHERE users.name_id = ''),
        (SELECT product_id FROM products WHERE products.product_name = '')         
    ),
    (
        (SELECT user_id FROM users WHERE users.name_id = ''),
        (SELECT product_id FROM products WHERE products.product_name = '')         
    ),
    (
        (SELECT user_id FROM users WHERE users.name_id = ''),
        (SELECT product_id FROM products WHERE products.product_name = '')         
    ),
    (
        (SELECT user_id FROM users WHERE users.name_id = ''),
        (SELECT product_id FROM products WHERE products.product_name = '')         
    ),
    (
        (SELECT user_id FROM users WHERE users.name_id = ''),
        (SELECT product_id FROM products WHERE products.product_name = '')         
    ),
    (
        (SELECT user_id FROM users WHERE users.name_id = ''),
        (SELECT product_id FROM products WHERE products.product_name = '')         
    ),
    (
        (SELECT user_id FROM users WHERE users.name_id = ''),
        (SELECT product_id FROM products WHERE products.product_name = '')         
    );

SELECT * FROM users_products;

SELECT
    "questão 1" as "resultado:";

SELECT 
    (
        SELECT 
            client_name 
        FROM 
            clients 
        WHERE 
            client_id = (
                SELECT 
                    client_id 
                FROM 
                    clients_products 
                WHERE 
                    clients_products.product_id = products.product_id
                )

    ) as client_name,
    products.product_name,
    products.buy_price
FROM 
    products 
WHERE 
    product_id IN (
        SELECT 
            product_id 
        FROM 
            clients_products
)
LIMIT
    3;

SELECT
    "questão 2" as "resultado:";

SELECT 
    (
        SELECT 
            client_name 
        FROM 
            clients 
        WHERE 
            client_id = (
                SELECT 
                    client_id 
                FROM 
                    clients_products 
                WHERE 
                    clients_products.product_id = products.product_id
                )

    ) as client_name,
    products.product_name,
    products.buy_price,
    products.ammount
FROM 
    products 
WHERE 
    product_id IN (
        SELECT 
            product_id 
        FROM 
            clients_products
)
ORDER BY
    products.ammount DESC;

SELECT
    "questão 3" as "resultado:";

SELECT 
    clients.client_name,
    clients.client_cpf_and_cnpj,
    companies.company_name,
    products.product_name,
    products.buy_price,
    products.ammount
FROM
    clients 
INNER JOIN clients_products
    ON clients.client_id = clients_products.client_id
INNER JOIN products
    ON clients_products.product_id = products.product_id
INNER JOIN companies
    ON products.company_id = companies.company_id
ORDER BY products.buy_price DESC;

SELECT
    "questão 4" as "resultado";

SELECT 
    clients.client_name,
    clients.client_cpf_and_cnpj,
    companies.company_name,
    products.product_name,
    products.buy_price,
    products.ammount
FROM
    clients 
LEFT JOIN clients_products
    ON clients.client_id = clients_products.client_id
LEFT JOIN products
    ON clients_products.product_id = products.product_id
LEFT JOIN companies
    ON products.company_id = companies.company_id
ORDER BY products.buy_price DESC;