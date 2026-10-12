# Visualization Considerations

## Visualization 

The CarePlan was implemented as a proposal in **Vidi**, a visualization tool for the Patient Summary (see [Use Cases – UC2](uc2-careplan-visualization.html)). Lessons learned:
 
- **Keep the display simple.** A Patient Summary visualization is largely list-based. CarePlans, with their timelines, goals, activities and hierarchies, do not fit easily into this layout.
- **Mapping is the hard part.** Mapping activity information (previously from `activity.detail`, now from referenced resources) into a readable display proved difficult, and depends strongly on how the resources are profiled.
- **Separate topics clearly.** Showing several plain lists blurs thematic areas. Goals should be shown before activities, and contrast should support readability.
- **Two views.** A simplified view shows only active CarePlans. An informative view also shows on-hold and planned CarePlans.
- **Missing information.** Vidi has to handle data that is missing or cannot be displayed (for example, data converted from CDA). Buttons for additional information should be deactivated when none is available. Whether `meta.source` should indicate that more information exists is still open.
- **Limited capacity.** Vidi cannot display unlimited data. Only elements marked as *shall display* need to be shown.
- **Incremental development.** Vidi should evolve step by step without falling into "analysis paralysis". A separate sub-IG for Vidi may be needed to define clearly what it can and cannot display.

## FHIR Version Considerations
 
| Topic | R4 | R5 / R6 | Approach in this IG |
|---|---|---|---|
| `instantiatesCanonical` / `instantiatesUri` | Available | Not supported in R6 | May be used in R4. In R6, this information has to move into a `RequestOrchestration`, linked via `basedOn` or `activity.plannedActivityReference`. |
| `activity.detail` | Available | Removed; activities are described only via references | Not used. Activities are described by referenced resources. The official cross-version mapping does not cover the working group's needs. |
| PlanDefinition `$apply` | Returns a CarePlan | Returns a `RequestOrchestration` | The working group follows the `$apply` logic, so that the creation of a CarePlan from a PlanDefinition stays traceable across versions. |
| Goals per activity | `activity.detail.goal` | No direct equivalent | Use goals on (sub-)CarePlans. |
 
![PlanDefinition $apply in R4B, R5 and R6](plandefinition-apply-versions.png)