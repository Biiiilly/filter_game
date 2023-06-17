import myfilter.basis -- import our filter basis

open set -- make everything about sets works

variable {α : Type*} -- Say α is a collection of things.

/-
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
-/

/- Lemma
View a filter as a filter basis.
-/
def filter.as_basis (f : filter α) : filter_basis α :=
⟨f.sets,
begin
  sorry
end,
begin
  sorry
end⟩

/-
Below are some useful lemmas can be used later:
-/
lemma filter.mem_as_basis_iff (f : filter α) (t : set α) : 
  t ∈ filter.as_basis f ↔ t ∈ f := by refl
