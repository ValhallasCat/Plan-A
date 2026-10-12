# European Context (EU / EHDS)

The Patient Summary is one of the priority data categories of the **European Health Data Space (EHDS)**. The EU-level specifications are still evolving, and the working group follows them closely:
 

- **HL7 Europe Patient Summary (EPS)**: profiles the CarePlan (R4) within the EPS Composition and provides a mapping between the EPS CarePlan and the EHDS care plan model. These [mapping](https://build.fhir.org/ig/hl7-eu/eps/map-ehdscareplan.html) attempts show that `CarePlan.activity.detail` causes problems when moving towards R6.
- **International Patient Summary (IPS)**: the [international](https://hl7.org/fhir/uv/ips/2.0.1/en/StructureDefinition-Composition-uv-ips.html) base. It includes CarePlan (R4) in the "Plan of Care" section.
- **Xt-EHR Care Plan EHDS Logical Model**: contains a dedicated *Care plan model*, which defines the information expected at the European level (classification and functional profiles of EHR systems, draft): contains an interoperability use case for [care plans](https://www.xt-ehr.eu/fhir/models/en/StructureDefinition-EHDSCarePlan.html). It is not a 1:1 match with FHIR, but it shows clear synergies with this IG.
- **xShare Care Plan**: an HL7 Europe initiative ([xShare Care Plan IG](https://build.fhir.org/ig/hl7-eu/xshare-careplan/index.html), [X-Bundles](https://x-bundles.ehr-exchange-format.eu/xb-4/main.html)) dealing with care plan exchange. It is currently paused.
The EU discussion addresses the transition from R4 to higher versions. Implementations are expected to receive a **warning when `CarePlan.activity.detail` is populated**, as it is not forward compatible.
 
At EU level, the Patient Summary is currently exchanged as CDA, with a move to FHIR planned. Exchanging CarePlans across borders (for example, receiving a CarePlan from another member state) was one of the reasons for the decisions made in this IG.
 
Because there are **no binding EU requirements yet** on which CarePlan content must be included, the decisions in this IG are preliminary. They will be revisited once the regulations are clearer (see [About – Further Work](project-history.html#further-work)).