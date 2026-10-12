# UC2: CarePlan Visualization

## Goal
 
This use case shows how CarePlans can be displayed in the Austrian Patient Summary using **Vidi**, the visualization tool for the Patient Summary.
 
## Actors
 
- **Healthcare professionals:** get an overview of current care plans, goals and activities.
- **Patients:** see which measures are due when.
- **Producing systems:** provide CarePlans and the resources they reference.
- **Vidi:** displays the CarePlan section of the APS.

## Flow
 
1. A producing system provides one or more CarePlans for the patient, with a main CarePlan and possibly sub-CarePlans, as part of the APS.
2. Vidi shows **active** CarePlans in one section and **on-hold** CarePlans in a separate section.
3. For each CarePlan, the title, description, (optional) period, goals and activities are shown.
4. Additional information is only offered when it is available.

## Result
 
The working group discussed the proposed implementation in Vidi and accepted it, with several UX improvements:
 
- stronger contrast
- goals shown before activities
- a clearer separation of thematic areas



## Interactive example

This general example is not limited to one condition. It shows several CarePlans of the sample patient Frau Mustermann, for **endometriosis** and for **heart failure (Herzinsuffizienz)**. Select one or more CarePlans in the table to show their activities and goals.

<iframe src="careplan-demo/index.html" title="Interactive CarePlan example" style="width:100%; height:800px; border:1px solid #ccc;"></iframe>

[Open the example in a new tab](careplan-demo/index.html){:target="_blank"}
 
## Difficulties
 
- Mapping activity information from the referenced resources into a readable display is complex.
- Complex structures, such as hierarchical CarePlans or patients with multiple conditions, are hard to show in a list-based summary. However, this was also seen as a chance to give such patients an overview.
- It is still unclear where the boundary of a "summary" lies: which CarePlans, and how much detail, belong in the APS.