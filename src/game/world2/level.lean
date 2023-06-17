import game.world1.level1

open set

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

A filter B is a collection of subsets, 
so clearly we want to do something like U ∈ B.
```
instance : has_mem (set α) (filter_basis α) := ⟨λ U B, U ∈ B.sets⟩
```
-/