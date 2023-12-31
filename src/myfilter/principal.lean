/-
Copyright (c) 2023 Jiale Miao. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Jiale Miao, Yichen Feng, Lily Frost, Archie Prime
Thanks: Kevin Buzzard
-/

import tactic
import myfilter.order
import game.world3.level5
import order.bounded_lattice

/-!
# Principal filters

We define the principal filters in this file.

# Main Definitions

`principal` : The principal filter of `s` is the collection of all supersets of `s`.

-/

open set

variables {α : Type*} {s : set α}

namespace filter

-- Firstly, let's define the principal filters:
/-- The principal filter of `s` is the collection of all supersets of `s`. -/
def principal (s : set α) : filter α :=
{ sets             := {t | s ⊆ t},
  univ_sets        := subset_univ s,
  upward_closure   := λ x y hx, subset.trans hx,
  inter_sets       := λ x y, subset_inter }

-- We denote the principal filters as '𝓟' for convenience:
notation `𝓟` := filter.principal

@[simp] lemma mem_principal {s t : set α} : s ∈ 𝓟 t ↔ t ⊆ s := iff.rfl

lemma mem_principal_self (s : set α) : s ∈ 𝓟 s :=
begin
  exact λ {a : α}, mem_preimage.mp
end

/-- A filter f is finer than the principal filter of s if and only if s ∈ f. -/
lemma le_principal_iff' {s : set α} {f : filter α} : f ≤ 𝓟 s ↔ s ∈ f :=
begin
  split,
  { intro h,
    exact h (mem_principal_self s) },
  { intros h u hu,
    rw mem_principal at hu,
    exact mem_of_superset h hu }
end

/-- The principal filter of s is finer than the principal filter of t 
if and only if s ⊆ t. -/
lemma principal_mono' {s t : set α} : 𝓟 s ≤ 𝓟 t ↔ s ⊆ t :=
  by simp only [le_principal_iff', mem_principal, imp_self]

/-- The principal filter of s is equal to the principal filter of t 
if and only if s = t. -/
@[simp] lemma principal_eq_iff_eq {s t : set α} : 𝓟 s = 𝓟 t ↔ s = t :=
  by by simp only [le_antisymm_iff, le_principal_iff', mem_principal]; sorry

section order_filter

/--
Next, our goal: Prove '𝓟 (univ : set α) = ⊤' and '𝓟 (∅ : set α) = ⊥'
Before we go to these,
we firstly want to consider how to define the top (⊤) and the bottom (⊥) of filters.
i.e. the largest filter and the smallest filter
Remark: 
When we say that a filter f ≤ filter g , 
it means that g ⊆ f. i.e. ∀ s ∈ g → s ∈ f
Idea: 
The smallest filter corresponds to the finest one, so it should contain every subset.
Similarly, the largest filter should only contain the whole set.
-/

-- Let's verify these:

instance : lattice.order_top (filter α) :=
{ top    := { sets             := {s | ∀ x, x ∈ s},
              univ_sets        := λ x, mem_univ x,
              upward_closure   := λ x y hx hxy a, hxy (hx a),
              inter_sets       := λ x y hx hy a, mem_inter (hx _) (hy _) },
  le := λ f g, ∀ ⦃s : set α⦄, s ∈ g → s ∈ f,
  le_refl := λ a, begin intros s h, exact h end,
  le_trans := λ a b c h₁ h₂, subset.trans h₂ h₁,
  le_antisymm := λ a b h₁ h₂, filter.filter_eq $ subset.antisymm h₂ h₁,
  le_top := 
  begin
    intros f u hu,
    suffices : u = univ,
    { rw this,
      exact univ_mem },
    change ∀ x, x ∈ u at hu,
    rwa ← eq_univ_iff_forall at hu,
  end }

lemma mem_top_iff_forall {s : set α} : s ∈ (⊤ : filter α) ↔ (∀ x, x ∈ s) :=
iff.rfl

@[simp] lemma mem_top {s : set α} : s ∈ (⊤ : filter α) ↔ s = univ :=
by rw [mem_top_iff_forall, eq_univ_iff_forall]

-- Hint: consider the magic of 'simp'
instance : lattice.order_bot (filter α) :=
{ bot := { sets             := univ,
           univ_sets        := by simp only [mem_univ],
           upward_closure   := by simp only [mem_univ, implies_true_iff, forall_const],
           inter_sets       := by simp only [mem_univ, forall_const]},
  le := λ f g, ∀ ⦃s : set α⦄, s ∈ g → s ∈ f,
  le_refl := λ a, begin intros s h, exact h end,
  le_trans := λ a b c h₁ h₂, subset.trans h₂ h₁,
  le_antisymm := λ a b h₁ h₂, filter.filter_eq $ subset.antisymm h₂ h₁,
  bot_le :=  
  begin
    intros f u hu,
    exact mem_univ u,
  end }

end order_filter

@[simp] lemma mem_bot {s : set α} : s ∈ (⊥ : filter α) :=
trivial

lemma empty_mem_iff_bot' {f : filter α} : ∅ ∈ f ↔ f = ⊥ :=
begin
  split,
  { intro h,
    apply lattice.bot_unique,
    rw filter.le_def,
    intros u hu,
    suffices : ∅ ⊆ u,
    { exact mem_of_superset h this },
    exact empty_subset u },
  { intro h,
    exact mem_of_eq_of_mem (congr_arg sets h) trivial }
end

-- Hint: 'top_unique' is a good start.
@[simp] lemma principal_univ' : 𝓟 (univ : set α) = ⊤ :=
begin
  apply lattice.top_unique,
  simp only [le_principal_iff', mem_top, eq_self_iff_true],
end

-- Hint: can you guess this hint using the above hint?
@[simp] lemma principal_empty' : 𝓟 (∅ : set α) = ⊥ :=
begin
  apply lattice.bot_unique,
  intros s hs,
  exact empty_subset s,
end

end filter
