import myfilter.basic -- imports our filters

open set -- make everyting about sets works

variable {α : Type*} -- Say α is a collection of things.

namespace filter -- lemmas below would have a prefix 'filter'

/-

# Filter World

## Level 1 : `filter.mem_of_superset`

Welcome to the Filter World! We are going to talk about some
basic properties of the filters.

Firstly, let's think about how to define the filters.
Idea: We want to define filters as a generalisation of the 
"neighbourhood" of a point α ∈ X in the topological space (X, τ), 
then obviously our filter should satisfy the following axioms:
a) The whole set X should be the "neighbourhood" of α
b) If F₁ is the "neighbourhood" of α, and F₁ ⊆ F₂,
then F₂ should also be the "neighbourhood" of α.
c) If F₁ and F₂ are the "neighbourhood" of α, then the intersection
of them should also be the "neighbourhood" of α.

Hence, we can define the filters as below:

```
/-- A filter is a collection of subsets which contains the whole set, 
upward closed and closed under intersection. -/
structure filter (α : Type*) :=
(sets                     : set (set α))
(univ_sets                : set.univ ∈ sets)
(upward_closure {F₁ F₂}   : F₁ ∈ sets → F₁ ⊆ F₂ → F₂ ∈ sets)
(inter_sets {F₁ F₂}       : F₁ ∈ sets → F₂ ∈ sets → F₁ ∩ F₂ ∈ sets)
```

So now if I say (f : filter α) is a filter, then
f.univ_sets is a propostion stating that the whole set is in f.
Similarly for f.upward_closure and f.inter_sets. Try these exercises!
-/


/- Lemma
The filter f is upward closed.
-/
lemma mem_of_superset {x y : set α} {f : filter α} (hx : x ∈ f) (hxy : x ⊆ y) : 
  y ∈ f :=
begin
  sorry
end

/-
Below are some useful lemmas can be used later:
-/

@[simp] lemma univ_mem {f : filter α}: univ ∈ f := f.univ_sets

lemma inter_mem {f : filter α} {s t : set α} (hs : s ∈ f) (ht : t ∈ f) :
  s ∩ t ∈ f := f.inter_sets hs ht

end filter