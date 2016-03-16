-- reference-auth
USE oic;

source mysql_database_tables.sql;
source mysql_users.sql;
source mysql_system_scopes.sql;
source mysql_clients.sql;

-- reference-api
source resource-server-client.sql

-- reference-messaging
source messaging-client.sql

-- reference-apps
source bp-centiles-client.sql
source cartiac-risk-client.sql
source diabetes-monograph-client.sql
source disease-monograph-client.sql
source fhir-demo-client.sql
source pediatric-growth-chart-client.sql
source duke-pillbox-client.sql
source clindat-client.sql
source meducation-client.sql

-- bilirubin-chart
source bilirubin-chart-client.sql

-- appointments
source appointments-client.sql

-- examples
source test-clients.sql

-- patient-data-manager
source patient-data-manager-client.sql

-- sandbox-manager
source sandbox-manager-client.sql



