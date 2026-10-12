# Plan-A
 
## Austrian CarePlan
 
The Plan-A (R4) Implementation Guide (IG) defines a standardized, FHIR®-based approach to using the FHIR [CarePlan](https://hl7.org/fhir/R4/careplan.html) resource within the scope of the Austrian Patient Summary. This IG specifies which CarePlan information is required for integration into the Austrian Patient Summary. It also guides implementers on:
 
- which CarePlan information may be displayed through an Austrian Patient Summary visualization tool
- how that information should be structured and coded
- what to be cautious about when using CarePlan in FHIR R4, particularly given that the CarePlan resource changes in R5 and R6

## Why this IG?
 
A Patient Summary is designed to give a concise, standardized snapshot of a patient's health: problems, medications, allergies, procedures, and similar facts. A care plan is different in nature. It describes intended activities, goals, responsibilities, and progress over time. Bringing the two together raises questions that existing specifications do not fully answer:
 
- **What belongs in the summary?** Which parts of a CarePlan are relevant enough to be shown in a Patient Summary, and which should remain in the source system.
- **How can it be coded?** Diagnoses are well covered by terminologies such as SNOMED CT, ICD-10, and ICD-11. Care plan activities, goals, and outcomes are much harder to code consistently.
- **How can it be displayed?** Patient Summary visualizations are largely list-based. A CarePlan's timeline and the relationships between its elements do not map easily onto that layout.
This IG documents the working group's answers to these questions, the design choices made, and the limitations that remain open.
 

 
### How to read this IG
 
This IG should be read in the following order:
 
1. **[Introduction](background-purpose.html)**: the background and general information needed to understand this IG, including the European context
2. **[Functional](patient-summary-requirements.html)**: the design choices made, the coding and terminology considerations, and the known limitations, including those concerning visualization
3. **[Use Cases](uc1-careplan-endometriosis.html)**: the use cases for which the profiled CarePlan resource is intended: the endometriosis CarePlan example and the CarePlan visualization
4. **[Artifacts](artifacts.html)**: the profiled CarePlan, including its constraints and examples
5. **[About](project-history.html)**: how the working group reached its conclusions, the people contributing to this IG, its dependencies, and known issues

### Status
 
This IG is currently a **draft** and is subject to change. It is based on **FHIR R4** to align with the Austrian Patient Summary and the IPS. Implementers should be aware that the CarePlan resource has been revised in later FHIR versions. The [FHIR Version Considerations](visualization-considerations.html#fhir-version-considerations) section describes the differences relevant to this IG.
 
## Working Group
 
Plan-A is an HL7 Austria working group focused on how the FHIR CarePlan resource can be displayed within the Austrian Patient Summary. The working group's main goal is to identify what is needed to properly display a CarePlan resource in the context of the Patient Summary. It also examines how to handle the underlying information mapping so that the required information is displayed correctly in this scope.
 
The working group has been active since the beginning of 2025 and uses this IG to document its progress, including the discussions held and the difficulties encountered along the way. The working group's documentation and meeting notes are available in its [Confluence space](TODO-ATLASSIAN-LINK).
 
## Contact
 
The [Contributors](contributors.html) page of this IG lists the contributors to this IG and explains how to get involved.