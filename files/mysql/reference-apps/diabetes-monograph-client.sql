SET AUTOCOMMIT = 0;

START TRANSACTION;

-- Diabetes Monograph App
INSERT INTO client_details (client_id, client_name, logo_uri, access_token_validity_seconds, token_endpoint_auth_method) VALUES
	('diabetes_monograph', 'Diabetes Monograph', 'https://fhir.smartplatforms.org/images/apps/monograph.png', 86400, 'NONE');

INSERT INTO client_scope (owner_id, scope) VALUES
	((SELECT id from client_details where client_id = 'diabetes_monograph'), 'launch'),
	((SELECT id from client_details where client_id = 'diabetes_monograph'), 'patient/*.read');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	((SELECT id from client_details where client_id = 'diabetes_monograph'), 'authorization_code');

COMMIT;

SET AUTOCOMMIT = 1;
