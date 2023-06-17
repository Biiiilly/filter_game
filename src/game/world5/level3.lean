import game.world5.level2 -- hide

open set -- hide

variable {α : Type*} -- hide

/-

# Ultrafilter World

## Level 3 : `ultrafilter.compl_not_mem_iff`

Now coming to our main goal:
The backward direction is 'filter.compl_not_mem' given in the Challenge World.
(i.e. you can directly use 'filter.compl_not_mem' here for now, 
and do it in the Challenge World.)
Hints for the forward direction:
'filter.le_principal_iff'
'ultrafilter.le_of_inf_ne_bot'
'filter.empty_mem_iff_bot'
'filter.mem_inf_principal'
Notice that 'filter.mem_inf_principal' is in the Challenge World,
you can directly use it for now, and do them later.

Ignore [decidable_pred s] below due to the old version of Lean.
-/

/- Lemma
Notice we use `-s` to represent the complement of `s` due to the old version
of Lean.
-/
lemma ultrafilter.compl_not_mem_iff {f : ultrafilter α} {s : set α} [decidable_pred s] : 
  -s ∉ f ↔ s ∈ f :=
begin
  sorry
/- hint
split,
{
  sorry
},
{ intro h,
  exact filter.compl_not_mem f.ne_bot' h
}
-/

























end

/-
The following result is directly from previous one:
```
lemma ultrafilter.compl_mem_iff_not_mem {f : ultrafilter α} {s : set α} [decidable_pred s] : 
  sᶜ ∈ f ↔ s ∉ f
```
-/

/- Axiom : ultrafilter.mem_inf_principal {f : ultrafilter α} {s t : set α} [decidable_pred s] [decidable_pred t]
s ∈ f ⊓ 𝓟 t ↔ {x | x ∈ t → x ∈ s} ∈ f
-/

/- Axiom : filter.compl_not_mem {f : filter α} {s : set α} (hf : f ≠ ⊥) (h : s ∈ f)
-s ∉ f
-/