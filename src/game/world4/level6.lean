import game.world4.level5 -- hide

open set -- hide

variable {α : Type*} -- hide

/-

# Principal Filter World

## Level 6 : `filter.empty_mem_iff_bot`

Consider a filter f, if ∅ ∈ f, then by the upward closed property
of f, every subset would be in f.
Hence, we say the filter f is proper if ∅ ∉ f.
Now, we want to prove this: The filter f is non-proper if and only if f = ⊥.
Hint: `lattice.bot_unique` would be helpful, you can check it out
on the left.
-/

/- Lemma
The filter f is non-proper if and only if f = ⊥.
-/
lemma filter.empty_mem_iff_bot {f : filter α} : ∅ ∈ f ↔ f = ⊥ :=
begin
  sorry














end

/- Axiom : lattice.bot_unique (h : a ≤ ⊥)
a = ⊥
-/