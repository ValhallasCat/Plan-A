Profile: PlanANutritionOrder
Parent: NutritionOrder
Id: plan-a-nutrition-order
Title: "Plan-A NutritionOrder"
Description: "A profile of the NutritionOrder resource for use as a target of CarePlan.activity.reference within the Austrian Patient Summary."
// Add constraints here, e.g.:
// * status MS
* obeys plan-a-nutrition-instruction

* oralDiet.instruction ^definition = "Describe the patient oral diet instruction which will be displayed in the patient summary."

* supplement.instruction ^definition = "Describe the supplement instruction which will be displayed in the patient summary."

* enteralFormula.administrationInstruction ^definition = "Describe the patient formula instruction which will be displayed in the patient summary."

Invariant: plan-a-nutrition-instruction
Description: "At least one of oralDiet.instruction, supplement.instruction or enteralFormula.administrationInstruction SHALL be present."
Expression: "oralDiet.instruction.exists() or supplement.instruction.exists() or enteralFormula.administrationInstruction.exists()"
Severity: #error
