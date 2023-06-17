import game.world4.level2 -- hide

open set -- hide

variable {α : Type*} -- hide

/-

# Principal Filter World

## Level 3 : `filter.principal_mono`

-/

/- Lemma
The principal filter of s is finer than the principal filter of t 
if and only if s ⊆ t.
-/
lemma filter.principal_mono {s t : set α} : 𝓟 s ≤ 𝓟 t ↔ s ⊆ t :=
begin
  sorry










end

/-
Hence, the following lemma is true clearly and I add it on the left:
```
/-- The principal filter of s is equal to the principal filter of t 
if and only if s = t. -/
@[simp] lemma principal_eq_iff_eq {s t : set α} : 𝓟 s = 𝓟 t ↔ s = t :=
```
-/

/- Axiom : principal_eq_iff_eq {s t : set α}
𝓟 s = 𝓟 t ↔ s = t
-/