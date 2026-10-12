Profile: PlanAServiceRequest
Parent: ServiceRequest
Id: plan-a-service-request
Title: "Plan-A ServiceRequest"
Description: "A profile of the ServiceRequest resource for use as a target of CarePlan.activity.reference within the Austrian Patient Summary."
// Add constraints here, e.g.:
// * status MS

* patientInstruction 1..1
* patientInstruction ^definition = "This instruction will be displayed in the patient summary, so a meaningful description of the Service Request should be added."