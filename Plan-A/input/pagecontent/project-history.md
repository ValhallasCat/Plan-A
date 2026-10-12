# Project History & Discussion

The Plan-A working group has been active since the beginning of 2025. The following overview summarizes the main phases and discussions.
 
## 1. Getting started (2025)
 
- The working group reviewed previous Austrian work (ELGA IV Herzinsuffizienz) as a possible model for CarePlans in an IPS-based summary.
- It decided to use **R4 as the base** while keeping R5 and R6 in mind.
- It analysed the version differences, in particular:
  - `instantiatesCanonical` / `instantiatesUri`
  - `activity.detail`
  - the role of PlanDefinition `$apply` and `RequestOrchestration`

- **Decision:** `activity.detail` is not used, and activities are described via referenced resources. A ballot comment proposing `activity.detail` 0..0 was submitted to the APS ballot.

## 2. Input from integrated care
 
- The CarePlan approach of the Austrian integrated care project was presented. That project needs to express:
  - target values (Goals)
  - screening examinations, assessments and training (as Tasks)
- The discussion led to the idea of **hierarchical CarePlans** (main and sub-CarePlans), which separate topics and responsibilities instead of combining everything in one plan.

## 3. Endometriosis example (summer and autumn 2025)
 
- A focus group developed the endometriosis example (see [Use Cases – UC1](uc1-careplan-endometriosis.html)), which the working group then reviewed and refined.
- The discussion covered the Task resource, the ServiceRequest and DeviceRequest resources, and how to handle activities that are not performed.

## 4. Profiling for the APS and visualization in Vidi
 
- The CarePlan display in Vidi was presented and accepted (see [Use Cases – UC2](uc2-careplan-visualization.html)).
- Element-by-element decisions were made for CarePlan and Goal (see [Functional](patient-summary-requirements.html)).

## 5. Activities, Tasks and coding (2026)
 
- The working group discussed using Task as the central element for activities. Task-based approaches are widely used in other projects. However, open questions about status, responsibility and cross-institutional processes remain, and **patient-centeredness** must not be lost.
- The working group compared the CarePlan models of IPS, EPS, EHDS and APS.
- Coding of activities was discussed with terminology experts. Austrian insurance fee catalogues and implementations from other systems were examined as possible sources.
- The working group aligned with the parallel **ELGA e-Behandlungsplan** project, which focuses on diabetes type 2 and heart failure.
- The scope was narrowed to the **display of CarePlans in the APS**.

## Main difficulties
 
- **Version changes:** the CarePlan resource changes fundamentally from R4 to R5/R6, and the existing cross-version mappings do not cover the needs of this IG.
- **Activities:** without `activity.detail`, activities and their goals have to be spread over several resources, which makes both modelling and display harder.
- **Tasks and workflows:** it is unclear who closes Tasks and how they work across institutions. The working group also questioned whether Tasks are needed in a summary at all.
- **Coding:** no code system or value set for care plan activities exists yet.
- **Summary boundaries:** there is no consensus yet on what exactly a "summary" should contain, and no binding EU requirements.

## Further Work
 
- **Revisit content requirements** once the **EU regulations** (EHDS, Xt-EHR, EPS) clearly define which CarePlan information must be included.
- **Code system work:** develop or adopt a code system or value set for care plan activities, for example an expandable value set that is extended on request, combined with text in the CodeableConcept. This should be done together with HL7 Austria TC Terminology and the related initiatives. The HL7 Germany terminology community came to the same conclusion, so coordination across these communities would be beneficial.
- Define a value set for `Task.statusReason`.
- Clarify the role of Task and ServiceRequest for cross-institutional processes.
- Continue alignment with the ELGA e-Behandlungsplan and the European initiatives, including xShare.
- Consider a separate sub-IG for Vidi.
- Prepare a mapping path towards R6 once the APS moves to a higher version.