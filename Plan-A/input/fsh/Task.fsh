Profile: PlanATask
Parent: Task
Id: plan-a-task
Title: "Plan-A Task"
Description: "A profile of the Task resource for use as a target of CarePlan.activity.reference within the Austrian Patient Summary."
// Add constraints here, e.g.:
// * status MS

* description 1..1
* description ^definition = "This filed should give a meaningful description of the task. This information will be displayed in the patient summary."