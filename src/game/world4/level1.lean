import myfilter.principal -- hide

open set -- hide

variable {α : Type*} -- hide

/-

# Principal Filter World

## Level 1 : `filter.principal`

Welcome to the Principal Filter World! In this section,
we are going to see the magic of principal filters.

The principal filter of `s` is the collection of all supersets of `s`.
We denote the principal filter as `𝓟 s`.
-/

/- Lemma : no-side-bar
Let's verify it does follow the axioms of filters:
-/
lemma filter.principal' (s : set α) : filter α :=
begin
  sorry
/- hint
use {t | s ⊆ t},
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

/-
Now, you can represent a principal filter as `filter.principal`. I also
provide some basic APIs of principal filters on the left.
-/

/- Axiom : filter.principal (s : set α)
filter α
-/

/- Axiom : filter.mem_principal_self (s : set α)
s ∈ 𝓟 s
-/