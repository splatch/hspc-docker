USE oic;

SET AUTOCOMMIT = 0;

START TRANSACTION;

INSERT INTO system_scope (scope, description, structured, default_scope, allow_dyn_reg) VALUES
  ('smart/orchestrate_launch', 'Launch orchestration', false, false, false),
  ('launch', 'Launch context info', true, true, true),
  ('openid', 'OpenID Connect id_token request', false, false, true),
  ('profile', 'User Profile Claim', false, false, true),
  ('user/*.*', 'Read-write all data accessible by the user', false, false, true),
  ('user/*.read', 'Read all data accessible by the user', false, false, true),
  ('user/*.write', 'Write all data accessible by the user', false, false, true),
  ('user/AdverseReaction.read', 'Read all AdverseReactions accessible by the user', false, false, true),
  ('user/AdverseReaction.write', 'Write all AdverseReactions accessible by the user', false, false, true),
  ('user/Alert.read', 'Read all Alerts accessible by the user', false, false, true),
  ('user/Alert.write', 'Write all Alerts accessible by the user', false, false, true),
  ('user/Condition.read', 'Read all Conditions accessible by the user', false, false, true),
  ('user/Condition.write', 'Write all Conditions accessible by the user', false, false, true),
  ('user/Encounter.read', 'Read all Encounters accessible by the user', false, false, true),
  ('user/Encounter.write', 'Write all Encounters accessible by the user', false, false, true),
  ('user/FamilyHistory.read', 'Read all FamilyHistory accessible by the user', false, false, true),
  ('user/FamilyHistory.write', 'Write all FamilyHistory accessible by the user', false, false, true),
  ('user/Medication.read', 'Read all Medications accessible by the user', false, false, true),
  ('user/Medication.write', 'Write all Medications accessible by the user', false, false, true),
  ('user/MedicationPrescription.read', 'Read all MedicationPrescriptions accessible by the user', false, false, true),
  ('user/MedicationPrescription.write', 'Write all MedicationPrescriptions accessible by the user', false, false, true),
  ('user/MedicationStatement.read', 'Read all MedicationStatements accessible by the user', false, false, true),
  ('user/MedicationStatement.write', 'Write all MedicationStatements accessible by the user', false, false, true),
  ('user/Observation.read', 'Read all Observations accessible by the user', false, false, true),
  ('user/Observation.write', 'Write all Observations accessible by the user', false, false, true),
  ('user/Patient.read', 'Read all Patients accessible by the user', false, false, true),
  ('user/Patient.write', 'Write all Patients accessible by the user', false, false, true),
  ('user/Substance.read', 'Read all Substances accessible by the user', false, false, true),
  ('user/Substance.write', 'Write all Substances accessible by the user', false, false, true),

  ('patient/*.*', 'Read-write all data for a given patient', false, false, true),
  ('patient/*.read', 'Read all data for a given patient', false, false, true),
  ('patient/*.write', 'Read all data for a given patient', false, false, true),
  ('patient/AdverseReaction.read', 'Read all AdverseReactions for a given patient', false, false, true),
  ('patient/AdverseReaction.write', 'Write all AdverseReactions for a given patient', false, false, true),
  ('patient/Alert.read', 'Read all Alerts for a given patient', false, false, true),
  ('patient/Alert.write', 'Write all Alerts for a given patient', false, false, true),
  ('patient/Condition.read', 'Read all Conditions for a given patient', false, false, true),
  ('patient/Condition.write', 'Write all Conditions for a given patient', false, false, true),
  ('patient/Encounter.read', 'Read all Encounters for a given patient', false, false, true),
  ('patient/Encounter.write', 'Write all Encounters for a given patient', false, false, true),
  ('patient/FamilyHistory.read', 'Read all FamilyHistory for a given patient', false, false, true),
  ('patient/FamilyHistory.write', 'Write all FamilyHistory for a given patient', false, false, true),
  ('patient/MedicationPrescription.read', 'Read all MedicationPrescriptions for a given patient', false, false, true),
  ('patient/MedicationPrescription.write', 'Write all MedicationPrescriptions for a given patient', false, false, true),
  ('patient/MedicationStatement.read', 'Read all MedicationStatements for a given patient', false, false, true),
  ('patient/MedicationStatement.write', 'Write all MedicationStatements for a given patient', false, false, true),
  ('patient/Observation.read', 'Read all Observations for a given patient', false, false, true),
  ('patient/Observation.write', 'Write all Observations for a given patient', false, false, true),
  ('patient/Patient.read', 'Read all Patients for a given patient', false, false, true),
  ('patient/Patient.write', 'Write all Patients for a given patient', false, false, true);



COMMIT;

SET AUTOCOMMIT = 1;
