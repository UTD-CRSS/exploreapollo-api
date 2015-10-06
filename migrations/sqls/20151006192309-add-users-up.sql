/* Replace with your SQL commands */
CREATE DOMAIN reasonable_string TEXT CHECK (
  LENGTH(VALUE) > 0 AND
  LENGTH(VALUE) <= 254
);

CREATE TABLE users (
  name reasonable_string,
  email reasonable_string,
  password TEXT
);
