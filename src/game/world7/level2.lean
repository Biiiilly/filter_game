import game.world7.level1 -- hide

open set -- hide

variables {α : Type*} -- hide

/-

# Challenge World

## Level 2 : `filter.mem_inf_principal`

Now we are coming to another challenging puzzle.
Hint for the forward direction: 'filter.mem_inf_iff'
Hint for the backward direction: 'filter.inter_mem_inf' and consider 's ∩ t'
-/

/- Lemma
Notice this is the lemma we used in the Principal Filter World.
-/
theorem filter.mem_inf_principal {f : filter α} {s t : set α} :
  s ∈ f ⊓ 𝓟 t ↔ {x | x ∈ t → x ∈ s} ∈ f :=
begin
  sorry













































end