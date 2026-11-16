### Guiding principles
 
- **Patient-centered and simple.** For patients, what matters most is a clear overview of *which measures are due when*. Whether this information comes from one or several CarePlans matters less, so the meta level can be kept minimal.
- **Reduce to what is necessary.** Elements that are not intended to be displayed should not be profiled. The IPS IG serves as orientation for mandatory content.
- **Avoid contradictions.** Codes (and their display values) must not contradict free-text fields such as title or description.
- **Keep FHIR resources easy to combine.** The design must not block later versions or other use cases.

### CarePlan structure
 
- **Activities via references, not details.** `CarePlan.activity.detail` is not used. Each activity is described as its own resource (for example `Task`, `ServiceRequest` or `DeviceRequest`) and linked via `activity.reference`. The working group submitted a ballot comment to the APS proposing that `activity.detail` be constrained to **0..0**.
- **Hierarchical CarePlans.** A **main CarePlan** can be complemented by **sub-CarePlans**, for example per specialty, care setting or topic. This separates contexts and responsibilities, makes plans reusable, and keeps task assignment transparent. Sub-CarePlans can share activities, and related plans should be exchanged together. Whether the APS should show only one CarePlan per patient needs further discussion, as this is not in the scope of the working group. Still, it is relevant to mention that this was discussed in the working group.
- **Underlying condition.** A CarePlan is not always based on a Condition. In outpatient care it may relate, for example, to a disability or to lifestyle.

### CarePlan elements (APS)
 
| Element | Discussion |
|---|---|
| `status` | Current CarePlans are shown in the APS: one section for **active** and one for **on-hold**. Past CarePlans are not primarily relevant for the APS, since information like past procedures or past medication intake is already part of the APS. If past CarePlans also need to be shown, they must be grouped by status and the APS must be updated regularly. |
| `intent` | All values are allowed. It is a modifier element and should not be constrained. |
| `title` | Mandatory |
| `description` | Mandatory |
| `period` | Optional. A start date is usually known, but an end date is often not available for chronic conditions. If no period is provided, a default text is displayed (for example "No period stated"). |
| `activity.detail` | Not used (0..0) |
 
### Goal
 
- A Goal is **not mandatory** for every CarePlan.
- Only current goals are displayed. No history is shown.
- `achievementStatus` can be important when it comes to grouping goals in an overview, grouped on a simplified level (*in progress*, *achieved*, *not achieved*). However, this means that the APS and the goal's `achievementStatus` must be kept up to date at all times.
- `target` and `outcome` details are kept minimal, because multiple free-text fields tend to be misused.
- Open issue: goals of individual activities were previously expressed in `activity.detail.goal`. Without details, the relationship between activities and goals has to be expressed via other elements within the resources. For example, the `addresses` element of the Goal resource could be used to reference the specific activity that is meant to achieve this goal.

### Task
 
- When `Task.status` is set to *rejected*, a `statusReason` should be provided. A value set for this is still to be defined.
- `Task.code` describes **what the task does** (for example *fulfill*), not the clinical content. The actual activity is referenced via `Task.focus`, for example a `ServiceRequest`.
- `businessStatus` depends on the use case. A single cross-institutional value set is not considered feasible, so the display value is shown as received.
- **Open issues:** who closes a Task, how Tasks behave across institutions, and whether Tasks are needed in the APS at all. Not every system can process Tasks, and open Tasks may never be closed. Whether `ServiceRequest` could take over the role of Tasks was also discussed, but this is currently limited by missing cross-institutional FHIR workflows.

### Obligations
 
If consumers are required to display an element, producers must be required to provide it. Where data is missing, absent-reason mechanisms (such as the data-absent-reason extension) can be used, except for elements with a required binding.