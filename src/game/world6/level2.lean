import game.world6.level1 -- hide

open set -- hide

variables {α : Type*} [topological_space α] -- hide

/-

# Topology World

## Level 2 : `nhds_le_of_le`

Try these exercises:

-/

/- Lemma
To show a filter is above the neighborhood filter at `a`, it suffices to show that 
it is above the principal filter of some open set `s` containing `a`.
-/
lemma nhds_le_of_le {f a} {s : set α} (h : a ∈ s) (ho : is_open s) (hsf : 𝓟 s ≤ f) : 
  (𝓝 a) ≤ f :=
begin
  sorry












end