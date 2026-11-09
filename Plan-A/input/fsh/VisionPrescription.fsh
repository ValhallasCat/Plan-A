Profile: PlanAVisionPrescription
Parent: VisionPrescription
Id: plan-a-vision-prescription
Title: "Plan-A VisionPrescription"
Description: "A profile of the VisionPrescription resource for use as a target of CarePlan.activity.reference within the Austrian Patient Summary."
// Add constraints here, e.g.:
// * status MS

* extension contains http://hl7.org/fhir/StructureDefinition/note named note 0..1
* extension[note] ^short = "Free text about the vision prescription"
* extension[note] ^definition = "Here a text describing the vision prescription can be added. This text will be displayed in the patient summary."
