SET AUTOCOMMIT = 0;

START TRANSACTION;

INSERT INTO system_scope (scope, description, structured, default_scope, restricted) VALUES
  ('smart/orchestrate_launch', 'Launch orchestration', false, false, true),
  ('launch', 'Launch context info', true, true, false),
  ('launch/patient', 'When launching outside an EHR, provide patient context at time of launch', false, true, false),
  ('launch/encounter', 'When launching outside an EHR, provide encounter context at time of launch', false, false, false),
  ('launch/location', 'When launching outside an EHR, provide location context at time of launch', false, false, false),
  ('openid', 'OpenID Connect id_token request', false, false, false),
  ('profile', 'User Profile Claim', false, false, false),
  ('user/*.*', 'Read-write all data accessible by the user', false, false, false),
  ('user/*.read', 'Read all data accessible by the user', false, false, false),
  ('user/*.write', 'Write all data accessible by the user', false, false, false),
  ('user/AdverseReaction.read', 'Read all AdverseReactions accessible by the user', false, false, false),
  ('user/AdverseReaction.write', 'Write all AdverseReactions accessible by the user', false, false, false),
  ('user/Alert.read', 'Read all Alerts accessible by the user', false, false, false),
  ('user/Alert.write', 'Write all Alerts accessible by the user', false, false, false),
  ('user/Condition.read', 'Read all Conditions accessible by the user', false, false, false),
  ('user/Condition.write', 'Write all Conditions accessible by the user', false, false, false),
  ('user/Encounter.read', 'Read all Encounters accessible by the user', false, false, false),
  ('user/Encounter.write', 'Write all Encounters accessible by the user', false, false, false),
  ('user/FamilyHistory.read', 'Read all FamilyHistory accessible by the user', false, false, false),
  ('user/FamilyHistory.write', 'Write all FamilyHistory accessible by the user', false, false, false),
  ('user/Medication.read', 'Read all Medications accessible by the user', false, false, false),
  ('user/Medication.write', 'Write all Medications accessible by the user', false, false, false),
  ('user/MedicationPrescription.read', 'Read all MedicationPrescriptions accessible by the user', false, false, false),
  ('user/MedicationPrescription.write', 'Write all MedicationPrescriptions accessible by the user', false, false, false),
  ('user/MedicationStatement.read', 'Read all MedicationStatements accessible by the user', false, false, false),
  ('user/MedicationStatement.write', 'Write all MedicationStatements accessible by the user', false, false, false),
  ('user/Observation.read', 'Read all Observations accessible by the user', false, false, false),
  ('user/Observation.write', 'Write all Observations accessible by the user', false, false, false),
  ('user/Patient.read', 'Read all Patients accessible by the user', false, false, false),
  ('user/Patient.write', 'Write all Patients accessible by the user', false, false, false),
  ('user/Substance.read', 'Read all Substances accessible by the user', false, false, false),
  ('user/Substance.write', 'Write all Substances accessible by the user', false, false, false),
  ('patient/*.*', 'Read-write all data for a given patient', false, false, false),
  ('patient/*.read', 'Read all data for a given patient', false, false, false),
  ('patient/*.write', 'Write all data for a given patient', false, false, false),
  ('patient/AdverseReaction.read', 'Read all AdverseReactions for a given patient', false, false, false),
  ('patient/AdverseReaction.write', 'Write all AdverseReactions for a given patient', false, false, false),
  ('patient/Alert.read', 'Read all Alerts for a given patient', false, false, false),
  ('patient/Alert.write', 'Write all Alerts for a given patient', false, false, false),
  ('patient/Condition.read', 'Read all Conditions for a given patient', false, false, false),
  ('patient/Condition.write', 'Write all Conditions for a given patient', false, false, false),
  ('patient/Encounter.read', 'Read all Encounters for a given patient', false, false, false),
  ('patient/Encounter.write', 'Write all Encounters for a given patient', false, false, false),
  ('patient/FamilyHistory.read', 'Read all FamilyHistory for a given patient', false, false, false),
  ('patient/FamilyHistory.write', 'Write all FamilyHistory for a given patient', false, false, false),
  ('patient/MedicationPrescription.read', 'Read all MedicationPrescriptions for a given patient', false, false, false),
  ('patient/MedicationPrescription.write', 'Write all MedicationPrescriptions for a given patient', false, false, false),
  ('patient/MedicationStatement.read', 'Read all MedicationStatements for a given patient', false, false, false),
  ('patient/MedicationStatement.write', 'Write all MedicationStatements for a given patient', false, false, false),
  ('patient/Observation.read', 'Read all Observations for a given patient', false, false, false),
  ('patient/Observation.write', 'Write all Observations for a given patient', false, false, false),
  ('patient/Patient.read', 'Read all Patients for a given patient', false, false, false),
  ('patient/Patient.write', 'Write all Patients for a given patient', false, false, false);



COMMIT;

SET AUTOCOMMIT = 1;
