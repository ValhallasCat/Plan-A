Profile: PlanACarePlan
Parent: CarePlan
Id: plan-a-careplan
Title: "Plan-A CarePlan"
Description: "A profile of the CarePlan resource for use within the Austrian Patient Summary."


* subject only Reference(AtApsPatient)

//Modifications for the Plan A CarePlan

* title 1..1


* description 1..1


* activity.detail 0..0
* activity ^short = "Use activity.reference instead of activity.detail"
* activity ^definition = "The activity details element should not be populated. The reason for that is that in the future versions R5 and R6, this element is no longer supported. We therefore encourage the use of activity.reference to display the activity for the CarePlan."

* activity.reference ^short = "Reference to a resource describing the activity"
* activity.reference ^definition = "The reference should be used to enter the activity details, which are described in a specific resource."
* activity MS
* activity.reference MS
