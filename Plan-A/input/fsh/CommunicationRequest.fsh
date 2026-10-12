Profile: PlanACommunicationRequest
Parent: CommunicationRequest
Id: plan-a-communication-request
Title: "Plan-A CommunicationRequest"
Description: "A profile of the CommunicationRequest resource for use as a target of CarePlan.activity.reference within the Austrian Patient Summary."
// Add constraints here, e.g.:
// * status MS
* text 1..1
* text ^definition = "The text describes the communication activity and will be displayed in the patient summary."