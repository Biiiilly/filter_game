import myfilter.basis -- hide

open set -- hide

variable {α : Type*} -- hide

/-

# Filter Basis World

## Level 1 : `filter.as_basis`

Welcome to the Filter Basis World! We are going to talk
about the filter basis and the relevent properties.

Let's define the filter basis:
```
/-- A filter basis is a nonempty collection of sets such that 
the intersection of two elements of this collection contains 
some element of the collection. -/
structure filter_basis (α : Type*) :=
(sets                   : set (set α))
(nonempty               : sets.nonempty)
(inter_sets {x y}       : x ∈ sets → y ∈ sets → ∃ z ∈ sets, z ⊆ x ∩ y)
```

We can prove that every filter is actually a filter basis.
i.e. verify f satisfying `nonempty` and `inter_sets`.
-/

/- Lemma : no-side-bar
View a filter as a filter basis.
-/
lemma filter.as_basis' (f : filter α) : filter_basis α :=
begin
  sorry
/- hint
refine ⟨f.sets, _, _⟩,
-/







end

/-
Congratulations! You have verified that every filter is a filter basis.
Now you can view a filter f as filter basis by `filter.as_basis f`.
I provide some basic APIs of filter basis, and you can check it on the left.
-/

/- Axiom : filter.as_basis (f : filter α)
filter_basis α
-/

/- Axiom : filter.mem_as_basis_iff (f : filter α) (t : set α)
t ∈ filter.as_basis f ↔ t ∈ f
-/