import game.world3.level3 -- hide

open set -- hide

variable {α : Type*} --hide

namespace filter_basis

/- Axiom : filter_basis.le_def (B C : filter_basis α) :
(B ≤ᵇ C) ↔ (∀ {s : set α}, s ∈ C → (∃ t ∈ B, t ⊆ s))
-/

/-

# Order World

## Level 4 : `filter_basis.filter_basis_filter_le`

Here is another puzzle:

-/

/- Lemma
If B is a filter basis which generates filter F and G is any filter, then
G is finer than B if and only if G is finer than the filter generated by B.
-/
lemma as_basis_le_iff_le_filter (B : filter_basis α) (f : filter α) : 
  (filter.as_basis f ≤ᵇ B) ↔ f ≤ filter_basis.filter B :=
begin
  sorry




end

end filter_basis