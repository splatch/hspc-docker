SET AUTOCOMMIT = 0;

START TRANSACTION;

-- Sandbox Manager

INSERT INTO client_details (client_id, client_name, access_token_validity_seconds) VALUES
  ('sand_man', 'Sandbox Manager', 86400);

INSERT INTO client_redirect_uri (owner_id, redirect_uri) VALUES
  ((SELECT id from client_details where client_id = 'sand_man'), 'http://localhost:8080/hspc-sandbox-manager'),
  ((SELECT id from client_details where client_id = 'sand_man'), 'http://54.213.219.198:9080/uat/hspc-sandbox-manager'),
  ((SELECT id from client_details where client_id = 'sand_man'), 'https://sandbox.hspconsortium.org/hspc-sandbox-manager');

INSERT INTO client_scope (owner_id, scope) VALUES
  ((SELECT id from client_details where client_id = 'sand_man'), 'user/*.*'),
  ((SELECT id from client_details where client_id = 'sand_man'), 'smart/orchestrate_launch'),
  ((SELECT id from client_details where client_id = 'sand_man'), 'openid'),
  ((SELECT id from client_details where client_id = 'sand_man'), 'profile');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
  ((SELECT id from client_details where client_id = 'sand_man'), 'authorization_code');

INSERT INTO whitelisted_site (creator_user_id, client_id) VALUES
  ('admin', 'sand_man');

INSERT INTO whitelisted_site_scope (owner_id, scope) VALUES
  ((SELECT id from whitelisted_site where client_id = 'sand_man'), 'user/*.*');

INSERT INTO whitelisted_site_scope (owner_id, scope) VALUES
  ((SELECT id from whitelisted_site where client_id = 'sand_man'), 'smart/orchestrate_launch');

INSERT INTO whitelisted_site_scope (owner_id, scope) VALUES
  ((SELECT id from whitelisted_site where client_id = 'sand_man'), 'openid');

INSERT INTO whitelisted_site_scope (owner_id, scope) VALUES
  ((SELECT id from whitelisted_site where client_id = 'sand_man'), 'profile');

COMMIT;

SET AUTOCOMMIT = 1;
