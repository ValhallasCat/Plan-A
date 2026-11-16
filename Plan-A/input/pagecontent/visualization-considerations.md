### Visualization 

The CarePlan was implemented as a proposal in **Vidi**, a visualization tool for the Patient Summary (see [Use Cases – UC2](uc2-careplan-visualization.html)). Lessons learned:
 
- **Keep the display simple.** A Patient Summary visualization is largely list-based. CarePlans, with their timelines, goals, activities and hierarchies, do not fit easily into this layout.
- **Mapping is the hard part.** Mapping activity information (previously from `activity.detail`, now from referenced resources) into a readable display proved difficult, and depends strongly on how the resources are profiled.
- **Separate topics clearly.** Showing several plain lists blurs thematic areas. Goals should be shown before activities, and contrast should support readability.
- **Two views.** A simplified view shows only active CarePlans. An informative view also shows on-hold and planned CarePlans.
- **Missing information.** Vidi has to handle data that is missing or cannot be displayed (for example, data converted from CDA). Buttons for additional information should be deactivated when none is available. Whether `meta.source` should indicate that more information exists is still open.
- **Limited capacity.** Vidi cannot display unlimited data. Only elements marked as *shall display* need to be shown.
- **Incremental development.** Vidi should evolve step by step without falling into "analysis paralysis". A separate sub-IG for Vidi may be needed to define clearly what it can and cannot display.

### Uniform display of activities

A CarePlan can reference many different types of resources as activities, for example `Task`, `ServiceRequest`, `DeviceRequest`, `NutritionOrder` or `CommunicationRequest`. Each of these resource types stores its information in different elements, which makes it difficult to display activities uniformly in a Patient Summary.

It is therefore important that every resource describing an activity provides the same basic information in a way that can be displayed consistently: a **title** and a **description** of the activity. For Goals this is less of a concern, as the Goal resource is the same for every CarePlan and already has a `description` element.

The working group addressed this in [Use Case 2](uc2-careplan-visualization.html). The Plan-A profiles define which element provides the displayable text for each activity resource:

| Resource | Element with the displayable text |
|---|---|
| `Task` | `description` |
| `ServiceRequest` | `patientInstruction` |
| `Appointment` | `description` and `patientInstruction` |
| `DeviceRequest` | `text` (narrative) |
| `CommunicationRequest` | `text` (narrative) |
| `NutritionOrder` | `oralDiet.instruction`, `supplement.instruction` or `enteralFormula.administrationInstruction` |
| `RequestGroup` | `action.description` |
| `VisionPrescription` | `note` extension |
