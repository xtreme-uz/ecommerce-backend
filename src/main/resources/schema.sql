CREATE TABLE IF NOT EXISTS EC_PERMISSION(
    ID SERIAL PRIMARY KEY,
    CREATED_BY VARCHAR(255),
    CREATED_DATE TIMESTAMP,
    LAST_MODIFIED_BY VARCHAR(255),
    LAST_MODIFIED_DATE TIMESTAMP,
    NAME VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS EC_ROLE(
    ID SERIAL PRIMARY KEY,
    CREATED_BY VARCHAR(255),
    CREATED_DATE TIMESTAMP,
    LAST_MODIFIED_BY VARCHAR(255),
    LAST_MODIFIED_DATE TIMESTAMP,
    NAME VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS ROLE_PERMISSION(
    ROLE_ID BIGINT NOT NULL,
    PERMISSION_ID BIGINT NOT NULL,

    FOREIGN KEY (ROLE_ID) REFERENCES EC_ROLE(ID),
    FOREIGN KEY (PERMISSION_ID) REFERENCES EC_PERMISSION(ID)
);

CREATE TABLE IF NOT EXISTS EC_USER(
    ID SERIAL PRIMARY KEY,
    CREATED_BY VARCHAR(255),
    CREATED_DATE TIMESTAMP,
    LAST_MODIFIED_BY VARCHAR(255),
    LAST_MODIFIED_DATE TIMESTAMP,
    FIRST_NAME VARCHAR(255),
    LAST_NAME VARCHAR(255),
    PASSWORD VARCHAR(255) NOT NULL,
    USERNAME VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS USER_ROLE(
    USER_ID BIGINT NOT NULL,
    ROLE_ID BIGINT NOT NULL,

    FOREIGN KEY (USER_ID) REFERENCES EC_USER(ID),
    FOREIGN KEY (ROLE_ID) REFERENCES EC_ROLE(ID)
);

CREATE TABLE IF NOT EXISTS EC_ORDER(
    ID SERIAL PRIMARY KEY,
    CREATED_BY VARCHAR(255),
    CREATED_DATE TIMESTAMP,
    LAST_MODIFIED_BY VARCHAR(255),
    LAST_MODIFIED_DATE TIMESTAMP,
    STATE VARCHAR(255),
    CUSTOMER_ID BIGINT NOT NULL,

    FOREIGN KEY (CUSTOMER_ID) REFERENCES EC_USER(ID)
);

CREATE TABLE IF NOT EXISTS EC_PRODUCT(
    ID SERIAL PRIMARY KEY,
    CREATED_BY VARCHAR(255),
    CREATED_DATE TIMESTAMP,
    LAST_MODIFIED_BY VARCHAR(255),
    LAST_MODIFIED_DATE TIMESTAMP,
    CURRENCY VARCHAR(255),
    DESCRIPTION VARCHAR(255),
    NAME VARCHAR(255),
    PRICE DECIMAL(19, 2),
    QUANTITY DECIMAL(19, 2)
);

CREATE TABLE IF NOT EXISTS EC_ORDER_ITEM(
    ID SERIAL PRIMARY KEY,
    CREATED_BY VARCHAR(255),
    CREATED_DATE TIMESTAMP,
    LAST_MODIFIED_BY VARCHAR(255),
    LAST_MODIFIED_DATE TIMESTAMP,
    QUANTITY DECIMAL(19, 2),
    ORDER_ID BIGINT NOT NULL,
    PRODUCT_ID BIGINT NOT NULL,

    FOREIGN KEY (ORDER_ID) REFERENCES EC_ORDER(ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES EC_PRODUCT(ID)
);