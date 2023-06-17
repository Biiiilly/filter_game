import game.world3.level1 -- hide

open set -- hide

variable {α : Type*} --hide

/-

# Order World

## Level 2 : equivalence

As mentioned in level 1, f ≤ g is equivalent to say
any set of filter g contains some set of filter f. 
i.e. ∀ u ∈ G → (∃ v ∈ F, v ⊆ u)
-/

/- Lemma
Equivalence of the definition
-/
lemma filter.equivalent_def (f g : filter α) : 
  f ≤ g ↔ (∀ {s : set α}, s ∈ g → (∃ t ∈ f, t ⊆ s)) :=
begin
  sorry










end