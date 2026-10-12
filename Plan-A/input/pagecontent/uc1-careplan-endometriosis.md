# UC1: CarePlan Example – Endometriosis
 
## Goal
 
This use case tests in practice how a condition-specific CarePlan can be modelled in FHIR R4 without `activity.detail`, using references to other resources. Endometriosis was chosen because it is a chronic condition involving several healthcare professionals, which makes a clear separation of tasks and responsibilities particularly important.
 
## How the example was created
 
A focus group of the working group met six times over summer 2025 and developed the example. The group then reviewed it with the whole working group. The focus was on:
 
- showing the **relationships between resources**
- showing how activities and their information can be represented in **different resources** (`Task`, `ServiceRequest`, `DeviceRequest`, `Goal`, and others)
- listing which elements **can** be populated, and which ones should **usually** be populated to allow a clear display in the APS
- marking elements that are **no longer supported in higher FHIR versions**
- suggesting **adjusted or reduced value sets** for certain elements

## Example structure
 
- **Main CarePlan:**
  - initiated by the diagnosing gynecologist
  - the general practitioner is also part of the CareTeam and can edit the plan
  - category: SNOMED CT `773506001` *Gynecology care plan*
- **Sub-CarePlans:** for additional contexts. For example, if the patient also develops a heart condition, a dietitian could manage a sub-CarePlan.
- **Activities:** represented as linked resources. For example, a `Task` whose `focus` references a `ServiceRequest`.
![Endometriosis CarePlan example](endometriosis-careplan.svg)

The example is available as FHIR instances:

- [Main CarePlan](CarePlan-endometriosis-main-careplan.html), with the activities [Task Selbsthilfegruppe](Task-endometriosis-task-support-group.html) (focus: [ServiceRequest Selbsthilfegruppe](ServiceRequest-endometriosis-servicerequest-support-group.html)), [ServiceRequest Diätologe](ServiceRequest-endometriosis-servicerequest-dietitian.html) and [DeviceRequest TENS](DeviceRequest-endometriosis-devicerequest-tens.html)
- [Sub CarePlan Diätologe](CarePlan-endometriosis-sub-careplan-dietitian.html), with the activity [NutritionOrder](NutritionOrder-endometriosis-nutritionorder.html)
- [Sub CarePlan EndoApp](CarePlan-endometriosis-sub-careplan-endoapp.html), with the activity [CommunicationRequest](CommunicationRequest-endometriosis-communicationrequest-endoapp.html)
- shared by all CarePlans: [Condition](Condition-endometriosis-condition.html), [Goal](Goal-endometriosis-goal-pain-relief.html) and [CareTeam](CareTeam-endometriosis-careteam.html)
 
## Points raised in the discussion
 
- How should a Task or activity that is **not performed** be represented, given that a PlanDefinition prescribes the structure? The suggested approach is to use the status, with a mandatory `statusReason` when a Task is rejected.
- Where should the link to the **clinical guideline** be represented?
- How should sub-CarePlans be split: by specialty, by location, or by care direction?
- **Responsibility:** contributors and care team members carry legal responsibility for prescribed activities.

## Conclusion
 
The example shows that a CarePlan for endometriosis **can be modelled and partly coded** in a structured way. Coding the individual activities, however, is demanding. As no suitable code system exists yet, activities are currently described as text (see [Coding & Terminology](coding-terminology.html)). Integrating such a CarePlan into a visualization of the Patient Summary is also difficult (see [UC2](uc2-careplan-visualization.html)).