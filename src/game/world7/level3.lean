import game.world7.level2 -- hide

open set -- hide

variables {α : Type*} -- hide

/-

# Challenge World

## Level 3 : `compl_not_mem`

Hint: 'filter.inter_mem' might be helpful.
-/

/- Lemma
Notice this is the lemma we used in the Principal Filter World.
-/
lemma filter.compl_not_mem {f : filter α} {s : set α} (hf : f ≠ ⊥) (h : s ∈ f) : 
  -s ∉ f :=
begin
  sorry

















end