import game.world5.level3 -- hide

open set -- hide

variable {α : Type*} -- hide

/-

# Ultrafilter World

## Level 4 : `ultrafilter.of_compl_not_mem_iff`

Hint: 'filter.compl_not_mem' might be helpful.
-/

/- Lemma : no-side-bar
If `sᶜ ∉ f ↔ s ∈ f`, then `f` is an ultrafilter. The other implication is given by
`ultrafilter.compl_not_mem_iff` in the previous level.
-/
lemma ultrafilter.of_compl_not_mem_iff' (f : filter α) (h : ∀ s, -s ∉ f ↔ s ∈ f) : 
  ultrafilter α :=
begin
  sorry
/- hint
use f,
{
  sorry
},
{
  sorry
}
-/






end

/- Axiom : ultrafilter.of_compl_not_mem_iff (f : filter α) (h : ∀ s, -s ∉ f ↔ s ∈ f)
ultrafilter α
-/