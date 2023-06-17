/-
Copyright (c) 2023 Jiale Miao. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Jiale Miao, Yichen Feng, Lily Frost, Archie Prime
Thanks: Kevin Buzzard
-/

import myfilter.basic -- imports the filters

/-!
# Filter basis

We define the filter basis in this file.

# Main Definitions

`filter_basis` : A filter basis is a nonempty collection of sets such that the 
intersection of two elements of this collection contains 
some element of the collection.

-/

open set

-- Let's define the filter basis:
/-- A filter basis is a nonempty collection of sets such that the intersection of 
two elements of this collection contains some element of the collection. -/
structure filter_basis (α : Type*) :=
(sets                   : set (set α))
(nonempty               : sets.nonempty)
(inter_sets {x y}       : x ∈ sets → y ∈ sets → ∃ z ∈ sets, z ⊆ x ∩ y)

variables {α : Type*} {B C : filter_basis α}

-- A filter B is a collection of subsets, 
-- so clearly we want to do something like U ∈ B. 
instance : has_mem (set α) (filter_basis α) := ⟨λ U B, U ∈ B.sets⟩

namespace filter_basis

@[simp] lemma mem_sets {s : set α} : s ∈ B.sets ↔ s ∈ B := iff.rfl

lemma filter_basis_eq : ∀ {B C : filter_basis α}, B.sets = C.sets → B = C
| ⟨a, _, _⟩ ⟨._, _, _⟩ rfl := rfl

/-- Two filter basis are equal if and only if they contain the same sets. -/
lemma filter_basis_eq_iff : B = C ↔ B.sets = C.sets :=
⟨congr_arg _, filter_basis_eq⟩

lemma ext_iff : B = C ↔ ∀ s, s ∈ B ↔ s ∈ C :=
by simp only [filter_basis_eq_iff, ext_iff, filter_basis.mem_sets]

@[ext]
lemma ext : (∀ s, s ∈ B ↔ s ∈ C) → B = C :=
filter_basis.ext_iff.2

end filter_basis

