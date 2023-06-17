import game.world2.level2 -- import our filter basis

open set -- make everything about sets works

variable {α : Type*} -- Say α is a collection of things.

/-
Next, we can try to prove this lemma:
-/

/- Lemma
The filter generated by a filter is actually itself.
-/
lemma filter_basis.generated_by_filter_eq (f : filter α) :
  filter_basis.filter (filter.as_basis f) = f :=
begin
  sorry





end