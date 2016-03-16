SET AUTOCOMMIT = 0;

START TRANSACTION;

INSERT INTO users (username, password, enabled) VALUES
  ('admin','password',true),
  ('demo','demo',true);

-- By default, the username column here has to match the username column in the users table, above
INSERT INTO user_info (sub, preferred_username, name, email, email_verified) VALUES
  ('90342.ASDFJWFA','admin','Demo Admin','admin@example.com', true),
  ('01921.FLANRJQW','demo','Demo User','user@example.com', true);


INSERT INTO authorities (username, authority) VALUES
  ('admin','ROLE_ADMIN'),
  ('admin','ROLE_USER'),
  ('demo','ROLE_USER');


COMMIT;

SET AUTOCOMMIT = 1;

