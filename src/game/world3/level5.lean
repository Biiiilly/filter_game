import game.world3.level4 -- hide

open set -- hide

variable {α : Type*} --hide

/-

# Order World

## Level 5 : `filter_basis.le_and_le_iff_filter_eq`

Here is another puzzle:

-/

/- Lemma
B ≤ᵇ C and C ≤ᵇ B if and only if the filter 
generated by B equals the filter generated by C.
-/
lemma filter_basis.le_and_le_iff_filter_eq (B C : filter_basis α) :
  (B ≤ᵇ C) ∧ (C ≤ᵇ B) ↔ filter_basis.filter B = filter_basis.filter C :=
begin
  sorry













end