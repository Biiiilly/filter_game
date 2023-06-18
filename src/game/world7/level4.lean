import game.world7.level3 -- hide

open set -- hide

variables {α : Type*} -- hide

/-

# Challenge World

## Level 4 : `lattice.semilattice_inf (filter α)`

-/

/- Lemma : no-side-bar
The reason why we prove this is that in some of the lemmas
we used before require this:
-/
lemma filter.semilattice_inf : lattice.semilattice_inf (filter α) :=
begin
  sorry
/- hint
use filter.has_inf.inf,
use filter.partial_order.le,
exact partial_order.le_refl,
exact partial_order.le_trans,
exact partial_order.le_antisymm,
{
  sorry
},
{
  sorry
},
{
  sorry
},
-/






















end
