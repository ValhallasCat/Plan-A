The Plan-A working group (HL7 Austria) was set up to answer one central question: **how can the FHIR CarePlan resource be used in the Austrian Patient Summary (APS), and which information needs to be added for it to be useful?**
 
This IG documents the insights the working group has gained so far. It is intended as an **overview of the discussed aspects, decisions, and open issues**, not as a complete, normative specification.
 
### Starting point: previous Austrian work
 
The working group started by reviewing the existing implementation guide [ELGA IV Herzinsuffizienz (Integrated Care Heart Failure)](https://fhir.hl7.at/r4-ELGA-IV-Herzinsuffizienz-main/index.html). In that project, the Austrian framework concept for disease management of chronic heart failure was mapped to a data model based on the [International Patient Summary (IPS)](https://build.fhir.org/ig/HL7/fhir-ips/).
 
This work showed how a care plan within a Patient Summary could look in Austria. It also showed two limitations that motivated Plan-A:
 
- It describes **specific use cases** rather than giving an overview applicable to **all kinds of CarePlans** in a Patient Summary.
- It uses elements that **only exist in R4** (for example `CarePlan.activity.scheduled[x]`) and are no longer supported in later FHIR versions. Plan-A requires that later versions are kept in mind.

### FHIR version strategy
 
This IG uses **FHIR R4 as its base**, in line with the APS and IPS. It is designed while keeping in mind how the CarePlan resource looks in **R5 and R6**, so that a later mapping to a higher version remains possible. The most important version differences and the approach this IG takes are summarized below.
 
<img src="careplan_diff_r4_r5_r6.svg" alt="Differences of the CarePlan resource between R4, R5 and R6" style="width:100%; height:auto;"/>

| Topic | R4 | R5 / R6 | Approach in this IG |
|---|---|---|---|
| `instantiatesCanonical` / `instantiatesUri` | Available | Not supported in R6 | May be used in R4. In R6, this information has to move into a `RequestOrchestration`, linked via `basedOn` or `activity.plannedActivityReference`. |
| `activity.detail` | Available | Removed; activities are described only via references | Not used. Activities are described by referenced resources. The official cross-version mapping does not cover the working group's needs. |
| PlanDefinition `$apply` | Returns a CarePlan | Returns a `RequestOrchestration` | The working group follows the `$apply` logic, so that the creation of a CarePlan from a PlanDefinition stays traceable across versions. |
| Goals per activity | `activity.detail.goal` | No direct equivalent | Use goals on (sub-)CarePlans. |
