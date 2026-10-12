// Endometriosis CarePlan example, based on Endometriose_CarePlan.drawio (10th meeting, 2025-10-22).
// A gynecologist diagnoses endometriosis and creates the Main CarePlan. A dietitian and the EndoApp
// each add a Sub CarePlan that is partOf the Main CarePlan.

// ── Participants ────────────────────────────────────────────────────────────────

Instance: endometriosis-patient
InstanceOf: AtApsPatient
Usage: #example
Title: "Patientin mit Endometriose"
Description: "Patient of the endometriosis CarePlan example."
* identifier[socialSecurityNumber].type = http://terminology.hl7.org/CodeSystem/v2-0203#SS "Social Security number"
* identifier[socialSecurityNumber].system = "urn:oid:1.2.40.0.10.1.4.3.1"
* identifier[socialSecurityNumber].value = "1234010190"
* identifier[localPatientId].type = http://terminology.hl7.org/CodeSystem/v2-0203#PI "Patient internal identifier"
* identifier[localPatientId].system = "urn:oid:1.2.3.4.5"
* identifier[localPatientId].value = "endo-0001"
* name.family = "Musterfrau"
* name.given = "Eva"
* gender = #female
* birthDate = "1990-01-01"

Instance: endometriosis-gynecologist
InstanceOf: Practitioner
Usage: #example
Title: "Fachärztin für Gynäkologie"
Description: "Gynecologist who diagnoses endometriosis and initiates the Main CarePlan."
* name.family = "Gyn"
* name.given = "Gabriele"
* name.prefix = "Dr.in"

Instance: endometriosis-gp
InstanceOf: Practitioner
Usage: #example
Title: "Hausarzt"
Description: "General practitioner who co-manages the Main CarePlan."
* name.family = "Haus"
* name.given = "Hans"
* name.prefix = "Dr."

Instance: endometriosis-dietitian
InstanceOf: Practitioner
Usage: #example
Title: "Diätologe"
Description: "Dietitian who creates the dietitian Sub CarePlan."
* name.family = "Diät"
* name.given = "Daniel"

Instance: endometriosis-careteam
InstanceOf: CareTeam
Usage: #example
Title: "CareTeam Endometriose"
Description: "Gynecologist and general practitioner who own and edit the Main CarePlan."
* status = #active
* name = "CareTeam Endometriose"
* subject = Reference(endometriosis-patient)
* participant[0].member = Reference(endometriosis-gynecologist)
* participant[1].member = Reference(endometriosis-gp)

Instance: endometriosis-endoapp
InstanceOf: Device
Usage: #example
Title: "EndoApp"
Description: "Pain diary app used by the patient; author of the EndoApp Sub CarePlan."
* deviceName.name = "EndoApp"
* deviceName.type = #user-friendly-name
* patient = Reference(endometriosis-patient)

// ── Condition and Goal ──────────────────────────────────────────────────────────

Instance: endometriosis-condition
InstanceOf: Condition
Usage: #example
Title: "Endometriose"
Description: "The diagnosis the Main CarePlan addresses."
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* code = http://snomed.info/sct#129103003 "Endometriosis (disorder)"
* subject = Reference(endometriosis-patient)
* recorder = Reference(endometriosis-gynecologist)

Instance: endometriosis-goal-pain-relief
InstanceOf: Goal
Usage: #example
Title: "Schmerzlinderung"
Description: "Goal of the CarePlans: reduce pain to 0 on the 0-10 pain scale."
* lifecycleStatus = #active
* achievementStatus = http://terminology.hl7.org/CodeSystem/goal-achievement#in-progress
* category = http://snomed.info/sct#278414003 "Pain management (procedure)"
* priority = http://terminology.hl7.org/CodeSystem/goal-priority#medium-priority
* description = http://snomed.info/sct#18297005 "Pain relief"
* subject = Reference(endometriosis-patient)
* target.measure = http://loinc.org#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* target.detailInteger = 0
* expressedBy = Reference(endometriosis-gynecologist)
* addresses = Reference(endometriosis-condition)

// ── CarePlans ───────────────────────────────────────────────────────────────────

Instance: endometriosis-main-careplan
InstanceOf: PlanACarePlan
Usage: #example
Title: "Main CarePlan Endometriose"
Description: "Main CarePlan initiated by the gynecologist after diagnosing endometriosis."
* status = #active
* intent = #plan
* category = http://snomed.info/sct#773506001 "Gynecology care plan"
* title = "CarePlan für Endometriose"
* description = "CarePlan beinhaltet initiale Schritte für die Behandlung von Endometriose und die Linderung der Symptome."
* subject = Reference(endometriosis-patient)
* period.start = "2025-08-01"
* created = "2025-08-01"
* author = Reference(endometriosis-gynecologist)
* contributor = Reference(endometriosis-careteam)
* addresses = Reference(endometriosis-condition)
* goal = Reference(endometriosis-goal-pain-relief)
* activity[0].reference = Reference(endometriosis-task-support-group)
* activity[1].reference = Reference(endometriosis-servicerequest-dietitian)
* activity[2].reference = Reference(endometriosis-devicerequest-tens)

Instance: endometriosis-sub-careplan-dietitian
InstanceOf: PlanACarePlan
Usage: #example
Title: "Sub CarePlan Diätologe"
Description: "Sub CarePlan created by the dietitian, part of the Main CarePlan."
* partOf = Reference(endometriosis-main-careplan)
* status = #active
* intent = #plan
* title = "Sub CarePlan für Endometriose (Diätologe)"
* description = "Ernährungsempfehlung des Diätologen im Rahmen der Endometriose-Behandlung."
* subject = Reference(endometriosis-patient)
* author = Reference(endometriosis-dietitian)
* contributor = Reference(endometriosis-careteam)
* addresses = Reference(endometriosis-condition)
* goal = Reference(endometriosis-goal-pain-relief)
* activity[0].reference = Reference(endometriosis-nutritionorder)

Instance: endometriosis-sub-careplan-endoapp
InstanceOf: PlanACarePlan
Usage: #example
Title: "Sub CarePlan EndoApp"
Description: "Sub CarePlan authored by the EndoApp pain diary, part of the Main CarePlan."
* partOf = Reference(endometriosis-main-careplan)
* status = #active
* intent = #plan
* title = "Sub CarePlan für Endometriose (EndoApp)"
* description = "Schmerztagebuch in der EndoApp. Bei länger anhaltenden starken Schmerzen soll ein Termin bei der Gynäkologin vereinbart werden."
* subject = Reference(endometriosis-patient)
* author = Reference(endometriosis-endoapp)
* contributor = Reference(endometriosis-careteam)
* addresses = Reference(endometriosis-condition)
* goal = Reference(endometriosis-goal-pain-relief)
* activity[0].reference = Reference(endometriosis-communicationrequest-endoapp)

// ── Activities ──────────────────────────────────────────────────────────────────

Instance: endometriosis-task-support-group
InstanceOf: PlanATask
Usage: #example
Title: "Task Selbsthilfegruppe"
Description: "The gynecologist recommends 10 sessions of an endometriosis and pain management support group within one year."
* basedOn = Reference(endometriosis-main-careplan)
* status = #in-progress
* intent = #option
* priority = #routine
* code = http://hl7.org/fhir/CodeSystem/task-code#fulfill
* description = "Die Patientin soll 10 Sitzungen einer Selbsthilfegruppe zum Thema Endometriose und Schmerzmanagement besuchen."
* focus = Reference(endometriosis-servicerequest-support-group)
* for = Reference(endometriosis-patient)
* authoredOn = "2025-08-01"
* lastModified = "2025-08-05"
* requester = Reference(endometriosis-gynecologist)
* reasonCode = http://snomed.info/sct#370848006 "Pain management education"
* restriction.repetitions = 10
* restriction.period.start = "2025-08-01"
* restriction.period.end = "2026-08-01"
* input[0].type = http://loinc.org#72514-3 "Pain severity - 0-10 verbal numeric rating [Score] - Reported"
* input[0].valueInteger = 8
* input[1].type = http://snomed.info/sct#445283009 "Provision of educational material"
* input[1].valueUrl = "https://www.eva-info.at/"

Instance: endometriosis-servicerequest-support-group
InstanceOf: PlanAServiceRequest
Usage: #example
Title: "ServiceRequest Selbsthilfegruppe"
Description: "Referral to an endometriosis support group; focus of the support group Task."
* basedOn = Reference(endometriosis-main-careplan)
* status = #active
* intent = #plan
* category = http://snomed.info/sct#462451000124105 "Education about chronic pain"
* priority = #routine
* code = http://snomed.info/sct#711281004 "Referral to support group"
* subject = Reference(endometriosis-patient)
* occurrencePeriod.start = "2025-08-01"
* occurrencePeriod.end = "2026-08-01"
* asNeededCodeableConcept = http://snomed.info/sct#82423001 "Chronic pain"
* authoredOn = "2025-08-01"
* requester = Reference(endometriosis-gynecologist)
* performerType = http://snomed.info/sct#309337009 "Pain management specialist"
* patientInstruction = "Auf der Webseite werden die Termine für die Selbsthilfegruppe aufgelistet (https://www.eva-info.at/)."

Instance: endometriosis-servicerequest-dietitian
InstanceOf: PlanAServiceRequest
Usage: #example
Title: "ServiceRequest Diätologe"
Description: "The patient should make an appointment with a dietitian."
* basedOn = Reference(endometriosis-main-careplan)
* status = #active
* intent = #plan
* category = http://snomed.info/sct#386373004 "Nutrition therapy"
* priority = #routine
* code = http://snomed.info/sct#103699006 "Referral to dietitian"
* subject = Reference(endometriosis-patient)
* occurrencePeriod.start = "2025-08-01"
* occurrencePeriod.end = "2026-08-01"
* asNeededCodeableConcept = http://snomed.info/sct#271681002 "Stomach ache"
* authoredOn = "2025-08-01"
* requester = Reference(endometriosis-gynecologist)
* performerType = http://snomed.info/sct#168827000 "Nutritionist"
* patientInstruction = "Machen Sie bitte einen Termin bei Herrn Diätologen aus. Telefonnummer +43 123 45678"

Instance: endometriosis-devicerequest-tens
InstanceOf: PlanADeviceRequest
Usage: #example
Title: "DeviceRequest TENS-Gerät"
Description: "The gynecologist prescribes a TENS device to be used on demand."
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">TENS-Gerät (transkutane elektrische Nervenstimulation) zur Schmerzlinderung. Das Gerät bei Bedarf, also bei starken Schmerzen, anwenden.</div>"
* basedOn = Reference(endometriosis-main-careplan)
* status = #active
* intent = #option
* priority = #routine
* codeCodeableConcept = http://snomed.info/sct#36977008 "Peripheral neurostimulator"
* subject = Reference(endometriosis-patient)
* authoredOn = "2025-08-01"
* requester = Reference(endometriosis-gynecologist)
* reasonReference = Reference(endometriosis-condition)
* note.text = "Verwendung des Geräts on demand"

Instance: endometriosis-nutritionorder
InstanceOf: PlanANutritionOrder
Usage: #example
Title: "NutritionOrder antiinflammatorische Ernährung"
Description: "The dietitian prescribes a Mediterranean (anti-inflammatory) diet for at least 6 months and 500 mg omega-3 every 3 days."
* status = #active
* intent = #order
* patient = Reference(endometriosis-patient)
* dateTime = "2025-08-30"
* orderer = Reference(endometriosis-dietitian)
* foodPreferenceModifier = http://snomed.info/sct#227326009 "Canned chick peas"
* excludeFoodModifier = http://snomed.info/sct#102263004 "Eggs"
* oralDiet.type = http://snomed.info/sct#1255163004 "Mediterranean diet"
* oralDiet.schedule.repeat.duration = 6
* oralDiet.schedule.repeat.durationUnit = #mo
* oralDiet.instruction = "Antiinflammatorische (mediterrane) Ernährung für mindestens 6 Monate beibehalten."
* supplement.type = http://snomed.info/sct#226365003 "Omega 3 fatty acid"
* supplement.schedule.repeat.frequency = 1
* supplement.schedule.repeat.period = 3
* supplement.schedule.repeat.periodUnit = #d
* supplement.quantity = 500 'mg' "mg"
* supplement.instruction = "Alle 3 Tage 500 mg Omega-3 zu einer Mahlzeit einnehmen."
* note.text = "Omega-3 in Verbindung mit einer Mahlzeit einnehmen"

Instance: endometriosis-communicationrequest-endoapp
InstanceOf: PlanACommunicationRequest
Usage: #example
Title: "CommunicationRequest EndoApp"
Description: "The EndoApp recorded high pain for 14 days and recommends that the patient makes an appointment with the gynecologist."
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Seit 14 Tagen liegt der Wert auf der Schmerzskala über 8. Bitte vereinbaren Sie einen Termin bei Ihrer Gynäkologin.</div>"
* basedOn = Reference(endometriosis-sub-careplan-endoapp)
* status = #active
* category = http://terminology.hl7.org/CodeSystem/communication-category#alert
* priority = #asap
* medium = http://terminology.hl7.org/CodeSystem/v3-ParticipationMode#APPWRIT
* subject = Reference(endometriosis-patient)
* about = Reference(endometriosis-main-careplan)
* payload.contentString = "Seit 14 Tagen liegt der Wert auf der Schmerzskala über 8."
* occurrencePeriod.start = "2025-08-10"
* occurrencePeriod.end = "2025-08-24"
* authoredOn = "2025-08-24"
* requester = Reference(endometriosis-patient)
* recipient = Reference(endometriosis-gynecologist)
* reasonCode = http://terminology.hl7.org/CodeSystem/v3-ActReason#COC "coordination of care"
* note.text = "Seit 14 Tagen starke Schmerzen in der unteren Bauchregion, werden täglich schlimmer."
