Profile: PlanARequestGroup
Parent: RequestGroup
Id: plan-a-request-group
Title: "Plan-A RequestGroup"
Description: "A profile of the RequestGroup resource for use as a target of CarePlan.activity.reference within the Austrian Patient Summary."
// Add constraints here, e.g.:
// * status MS
* action.description 1..1
* action.description ^definition = "The description of the action must be added which will be included in the patient summary."