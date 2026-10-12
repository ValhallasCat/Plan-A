# Coding & Terminology

Coding the **condition** behind a CarePlan is well supported (for example, endometriosis in SNOMED CT, ICD-10 or ICD-11). Coding the **activities** of a CarePlan proved to be one of the most difficult topics. In the examples, most activities were available only as free text.
 
## Options discussed
 
1. **A shared value set for activities and services.** The need is large and has also come up in other working groups, but no such value set exists in Austria yet.
2. **Expandable value set plus text (transitional solution).** Use a value set of general activity terms that is extended on request, and add the precise description in `CodeableConcept.text`. This was recommended by the HL7 Austria terminology experts. The same issue was raised in the **HL7 Germany terminology call**, which reached the same view: a code system that is updated with new activities on request, combined with codes and text in the CodeableConcept, is a viable solution, but it needs considerable time to implement.
3. **Austrian insurance fee catalogues (Kassenkataloge).** This follows the idea that *activity = service*, and could be used for example as an example binding at activity level. Limitations:
   - the catalogues are distributed across several insurance carriers and are filled very differently
   - categories are often missing
   - the identifiers are row-based rather than semantic
   - additional information is lost
   Existing coding in other national projects (for example eKOS) should also be checked.
4. **Two levels via RequestOrchestration.** The first level would be the *service*; the second level would be the *activity*. Goals would require a different code system, for example "lower blood pressure".

## Decision
 
For now, **activities are described as strings (free text)** in the referenced resources. A narrative description of each activity should always be present, even when a code is available. Coding activities is left for future work (see [About – Further Work](project-history.html#further-work)).