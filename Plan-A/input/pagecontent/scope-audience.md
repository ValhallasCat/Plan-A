# Scope & Audience

## In scope
 
- How CarePlans are **represented and displayed** in the Austrian Patient Summary. During the project, the working group explicitly narrowed its scope to the display of CarePlans in the APS.
- Which CarePlan and Goal elements are relevant for the APS, and how they should be populated.
- How activities are represented via **references to other resources** instead of `activity.detail`.
- Coding and terminology considerations for CarePlan activities.
- Visualization of CarePlans in **Vidi**, a visualization tool for the (Austrian) Patient Summary.

## Out of scope
 
- Steering technical or cross-institutional **workflows** via CarePlans and Tasks.
- `MedicationRequest` as CarePlan activity, as those are partly covered by other working groups (e-Medikationsplan)
- Managing the full history of care plans. Only current care plans are relevant for a summary.

## Audience
 
- Implementers of systems that **produce** CarePlans for the APS
- Implementers of systems that **consume or display** the APS
- Terminologists working on codes for care plan activities
- Healthcare professionals and project teams working on care plans in Austria