import game.world4.level4 -- hide

open set -- hide

variable {α : Type*} -- hide

/-

# Principal Filter World

## Level 5 : `filter.order_bot`

Similarly for the `order_bot`.

-/

/- Lemma : no-side-bar
Let's verify these:
-/
lemma filter.order_bot : lattice.order_bot (filter α) :=
begin
  sorry
/- hint
let f : filter α := ⟨univ, _, _, _⟩,
{ use f,
  use (λ f g, ∀ ⦃s : set α⦄, s ∈ g → s ∈ f),
  exact filter.partial_order.le_refl,
  exact filter.partial_order.le_trans,
  exact filter.partial_order.le_antisymm,
  sorry
},
{
  sorry
},
{
  sorry
},
{
  sorry
}
-/






end

/- This lemma is provided on the left:
@[simp] lemma filter.mem_bot {s : set α} : s ∈ (⊥ : filter α)
-/

/- Axiom : filter.mem_bot {s : set α}
s ∈ (⊥ : filter α)
-/