import game.world4.level3 -- hide

open set -- hide

variable {α : Type*} -- hide

/-

# Principal Filter World

## Level 4 : `filter.order_top`

Next, our goal: Prove '𝓟 (univ : set α) = ⊤' and '𝓟 (∅ : set α) = ⊥'
Before we go to these,
we firstly want to consider how to define the top (⊤) and the bottom (⊥) of filters.
i.e. the largest filter and the smallest filter
Remark: 
When we say that a filter f ≤ filter g , 
it means that g ⊆ f. i.e. ∀ s ∈ g → s ∈ f
Idea: 
The smallest filter corresponds to the finest one, so it should contain every subset.
Similarly, the largest filter should only contain the whole set.

-/

/- Lemma : no-side-bar
Let's verify these:
-/
lemma filter.order_top : lattice.order_top (filter α) :=
begin
  sorry
/- hint
let f : filter α := ⟨{s | ∀ x, x ∈ s}, _, _, _⟩,
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
},
-/




end

/-
These two lemmas are provided on the left:
```
lemma filter.mem_top_iff_forall {s : set α} : 
  s ∈ (⊤ : filter α) ↔ (∀ x, x ∈ s)
```

```
@[simp] lemma filter.mem_top {s : set α} : 
  s ∈ (⊤ : filter α) ↔ s = univ
```
-/

/- Axiom : filter.mem_top_iff_forall {s : set α}
s ∈ (⊤ : filter α) ↔ (∀ x, x ∈ s)
-/

/- Axiom : filter.mem_top {s : set α}
s ∈ (⊤ : filter α) ↔ s = univ
-/