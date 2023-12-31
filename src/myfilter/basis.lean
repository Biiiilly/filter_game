/-
Copyright (c) 2023 Jiale Miao. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Jiale Miao, Yichen Feng, Lily Frost, Archie Prime
Thanks: Kevin Buzzard
-/

import myfilter.basic -- imports the filters
import game.world1.level1

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
(nonempty               : nonempty sets)
(inter_sets {x y}       : x ∈ sets → y ∈ sets → ∃ z ∈ sets, z ⊆ x ∩ y)

variables {α : Type*} {B C : filter_basis α}

-- A filter B is a collection of subsets, 
-- so clearly we want to do something like U ∈ B. 
instance : has_mem (set α) (filter_basis α) := ⟨λ U B, U ∈ B.sets⟩

-- We can prove that every filter is actually a filter basis.
/-- View a filter as a filter basis. -/
def filter.as_basis (f : filter α) : filter_basis α :=
⟨f.sets, begin use univ, exact filter.univ_mem end, 
  λ x y hx hy, ⟨x ∩ y, filter.inter_mem hx hy, subset.refl (x ∩ y)⟩⟩

-- Here are some APIs of filter basis:
lemma filter.mem_as_basis_iff (f : filter α) (t : set α) : 
  t ∈ filter.as_basis f ↔ t ∈ f := by refl

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

/- Actually, we can construct filter using filter basis:
The filter f generated by filter base B is te collection of all sets fⱼ such
that Bᵢ ⊆ fⱼ for some Bᵢ ∈ B. -/

-- Try to solve these `sorry`s.
/-- The filter associated to a filter basis. -/
protected def filter (B : filter_basis α) : filter α :=
{ sets := {s | ∃ t ∈ B, t ⊆ s},
  univ_sets := 
  begin
    simp only [exists_prop, mem_set_of_eq, subset_univ, and_true],
    have h := nonempty B,
    exact nonempty_subtype.mp h,
  end,
  upward_closure := 
  begin
    simp only [and_imp, exists_prop, mem_set_of_eq, exists_imp_distrib],
    intros F₁ F₂ x hx₁ hx₂ hF,
    refine ⟨x, hx₁, subset.trans hx₂ hF⟩,
  end,
  inter_sets := 
  begin
    simp only [and_imp, exists_prop, mem_set_of_eq, subset_inter_iff, exists_imp_distrib],
    intros F₁ F₂ x hx₁ hx₂ y hy₁ hy₂,
    obtain ⟨t, ht₁, ht₂⟩ := B.inter_sets hx₁ hy₁,
    rw subset_inter_iff at ht₂,
    cases ht₂ with ht₃ ht₄,
    refine ⟨t, ht₁, subset.trans ht₃ hx₂, subset.trans ht₄ hy₂⟩,
  end }

-- The following two lemmas are directly from the definition.
lemma mem_filter_iff (B : filter_basis α) {s : set α} : 
  s ∈ B.filter ↔ ∃ t ∈ B, t ⊆ s := iff.rfl

lemma mem_filter_of_mem (B : filter_basis α) {s : set α} : s ∈ B → s ∈ B.filter :=
λ s_in, ⟨s, s_in, subset.refl _⟩

end filter_basis
