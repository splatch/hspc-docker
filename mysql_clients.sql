USE oic;

SET AUTOCOMMIT = 0;

START TRANSACTION;

-- SMART on FHIR Application Launcher
INSERT INTO client_details (client_id, client_name, access_token_validity_seconds) VALUES
	('fhir_starter', 'FHIR Starter', 86400);

INSERT INTO client_redirect_uri (owner_id, redirect_uri) VALUES
	((SELECT id from client_details where client_id = 'fhir_starter'), 'http://localhost:8080/hsp-reference-apps');

INSERT INTO client_scope (owner_id, scope) VALUES
	((SELECT id from client_details where client_id = 'fhir_starter'), 'user/*.*'),
	((SELECT id from client_details where client_id = 'fhir_starter'), 'smart/orchestrate_launch');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	((SELECT id from client_details where client_id = 'fhir_starter'), 'authorization_code');

INSERT INTO whitelisted_site (creator_user_id, client_id) VALUES
    ('admin', 'fhir_starter');

INSERT INTO whitelisted_site_scope (owner_id, scope) VALUES
    ((SELECT id from client_details where client_id = 'fhir_starter'), 'user/*.*');

INSERT INTO whitelisted_site_scope (owner_id, scope) VALUES
    ((SELECT id from client_details where client_id = 'fhir_starter'), 'smart/orchestrate_launch');

-- HSP Resource Server
INSERT INTO client_details (client_id, client_secret, client_name, dynamically_registered, refresh_token_validity_seconds, access_token_validity_seconds, id_token_validity_seconds, allow_introspection) VALUES
	('hsp_resource_server', 'secret', 'HSP Resource Server', false, null, 3600, 600, true);

INSERT INTO client_scope (owner_id, scope) VALUES
	((SELECT id from client_details where client_id = 'hsp_resource_server'), 'launch'),
	((SELECT id from client_details where client_id = 'hsp_resource_server'), 'patient/*.read'),
	((SELECT id from client_details where client_id = 'hsp_resource_server'), 'user/*.*'),
	((SELECT id from client_details where client_id = 'hsp_resource_server'), 'smart/orchestrate_launch');



-- HSP Reference Apps

-- Pediatric Growth Chart
INSERT INTO client_details (client_id, client_name, logo_uri, access_token_validity_seconds, token_endpoint_auth_method) VALUES
	('growth_chart', 'Pediatric Growth Chart', 'http://smartplatforms.org/wp-content/uploads/pgc-male-healthyweight-os.png', 86400, 'NONE');

INSERT INTO client_scope (owner_id, scope) VALUES
	((SELECT id from client_details where client_id = 'growth_chart'), 'launch'),
	((SELECT id from client_details where client_id = 'growth_chart'), 'patient/*.read');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	((SELECT id from client_details where client_id = 'growth_chart'), 'authorization_code');



-- Bilirubin App
INSERT INTO client_details (client_id, client_name, logo_uri, access_token_validity_seconds, token_endpoint_auth_method) VALUES
	('bilirubin_chart', 'Bilirubin App', 'http://localhost:8080/hsp-reference-apps/static/apps/bilirubin-chart/images/thumbnail2.png', 86400, 'NONE');

INSERT INTO client_scope (owner_id, scope) VALUES
	((SELECT id from client_details where client_id = 'bilirubin_chart'), 'launch'),
	((SELECT id from client_details where client_id = 'bilirubin_chart'), 'patient/*.read');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	((SELECT id from client_details where client_id = 'bilirubin_chart'), 'authorization_code');


-- Cardiac Risk App
INSERT INTO client_details (client_id, client_name, logo_uri, access_token_validity_seconds, token_endpoint_auth_method) VALUES
	('cardiac_risk', 'Cardiac Risk', 'https://fhir.smartplatforms.org/images/apps/cardio.png', 86400, 'NONE');

INSERT INTO client_scope (owner_id, scope) VALUES
	((SELECT id from client_details where client_id = 'cardiac_risk'), 'launch'),
	((SELECT id from client_details where client_id = 'cardiac_risk'), 'patient/*.read');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	((SELECT id from client_details where client_id = 'cardiac_risk'), 'authorization_code');

-- BP Centiles App
INSERT INTO client_details (client_id, client_name, logo_uri, access_token_validity_seconds, token_endpoint_auth_method) VALUES
	('bp_centiles', 'BP Centiles', 'https://fhir.smartplatforms.org/images/apps/bpc.png', 86400, 'NONE');

INSERT INTO client_scope (owner_id, scope) VALUES
	((SELECT id from client_details where client_id = 'bp_centiles'), 'launch'),
	((SELECT id from client_details where client_id = 'bp_centiles'), 'patient/*.read');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	((SELECT id from client_details where client_id = 'bp_centiles'), 'authorization_code');

-- Diabetes Monograph App
INSERT INTO client_details (client_id, client_name, logo_uri, access_token_validity_seconds, token_endpoint_auth_method) VALUES
	('diabetes_monograph', 'Diabetes Monograph', 'https://fhir.smartplatforms.org/images/apps/monograph.png', 86400, 'NONE');

INSERT INTO client_scope (owner_id, scope) VALUES
	((SELECT id from client_details where client_id = 'diabetes_monograph'), 'launch'),
	((SELECT id from client_details where client_id = 'diabetes_monograph'), 'patient/*.read');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	((SELECT id from client_details where client_id = 'diabetes_monograph'), 'authorization_code');

-- Disease Monograph App
INSERT INTO client_details (client_id, client_name, logo_uri, access_token_validity_seconds, token_endpoint_auth_method) VALUES
	('disease_monograph', 'Disease Monograph', 'https://fhir.smartplatforms.org/images/apps/dm.png', 86400, 'NONE');

INSERT INTO client_scope (owner_id, scope) VALUES
	((SELECT id from client_details where client_id = 'disease_monograph'), 'launch'),
	((SELECT id from client_details where client_id = 'disease_monograph'), 'patient/*.read');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	((SELECT id from client_details where client_id = 'disease_monograph'), 'authorization_code');


-- FHIR Demo App
INSERT INTO client_details (client_id, client_name, logo_uri, access_token_validity_seconds, token_endpoint_auth_method) VALUES
	('fhir_demo', 'FHIR Demo App', 'https://fhir.smartplatforms.org/images/apps/demo.png', 86400, 'NONE');

INSERT INTO client_scope (owner_id, scope) VALUES
	((SELECT id from client_details where client_id = 'fhir_demo'), 'launch'),
	((SELECT id from client_details where client_id = 'fhir_demo'), 'patient/*.read');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	((SELECT id from client_details where client_id = 'fhir_demo'), 'authorization_code');

-- My Web App
INSERT INTO client_details (client_id, client_name, logo_uri, access_token_validity_seconds, token_endpoint_auth_method) VALUES
	('my_web_app', 'My Web App', 'https://fhir.smartplatforms.org/images/apps/my.png', 86400, 'NONE');

INSERT INTO client_scope (owner_id, scope) VALUES
	((SELECT id from client_details where client_id = 'my_web_app'), 'launch'),
	((SELECT id from client_details where client_id = 'my_web_app'), 'patient/*.read');

INSERT INTO client_grant_type (owner_id, grant_type) VALUES
	((SELECT id from client_details where client_id = 'my_web_app'), 'authorization_code');

COMMIT;

SET AUTOCOMMIT = 1;


