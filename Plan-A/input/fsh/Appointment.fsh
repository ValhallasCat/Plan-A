Profile: PlanAAppointment
Parent: Appointment
Id: plan-a-appointment
Title: "Plan-A Appointment"
Description: "A profile of the Appointment resource for use as a target of CarePlan.activity.reference within the Austrian Patient Summary."

* description 1..1 
* description ^definition = "A description of the type of the appointment must be given."

* patientInstruction 1..1
* patientInstruction ^definition = "Here the instructions for the patient regarding the appointment must be stated, as this is displayed as the activity in the APS."

