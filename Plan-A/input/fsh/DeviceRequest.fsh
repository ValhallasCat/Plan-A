Profile: PlanADeviceRequest
Parent: DeviceRequest
Id: plan-a-device-request
Title: "Plan-A DeviceRequest"
Description: "A profile of the DeviceRequest resource for use as a target of CarePlan.activity.reference within the Austrian Patient Summary."
// Add constraints here, e.g.:
// * status MS
* text 1..1
* text ^definition = "The text describes the planned device the patient should use and will be displayed in the patient summary. Here also the instructions on how the patient should use it should be entered."
