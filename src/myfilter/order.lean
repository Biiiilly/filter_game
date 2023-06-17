/-
Copyright (c) 2023 Jiale Miao. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Jiale Miao, Yichen Feng, Lily Frost, Archie Prime
Thanks: Kevin Buzzard
-/

import myfilter.basis

/-!
# '≤' in filters and filter basis

We define '≤' in filters and filter basis in this file.

-/

open set

variable {α : Type*}

/-
Now, we want to consider ≤ in filters.
When we say that a filter g ⊆ filter f, it means that f is finer than or equal to g.
Hence we can define f ≤ g if g ⊆ f(i.e. ∀ s ∈ g → s ∈ f). This is equivalent to say
any set of filter g contains some set of filter f. i.e. ∀ s ∈ g → (∃ t ∈ f, t ⊆ s)
We leave the proof of this equivalence as a puzzle below.

Remark:
In this context, being "finer" means having more sets that satisfy the conditions 
for being in the filter. The definition captures the idea that g has, in some sense, 
more detailed or refined information than f. This is analogous to the concept of refining 
a partition or a grid in topology or analysis. For example, in calculus, 
when we talk about partitions of an interval, a finer partition has more subintervals.
-/

-- Let's verify it satisfies partial order:
instance : partial_order (filter α) :=
{ le            := λ f g, ∀ ⦃s : set α⦄, s ∈ g → s ∈ f,
  le_antisymm   := λ a b h₁ h₂, filter.filter_eq $ subset.antisymm h₂ h₁,
  le_refl       := λ a, subset.rfl,
  le_trans      := λ a b c h₁ h₂, subset.trans h₂ h₁ }

theorem filter.le_def {f g : filter α}: f ≤ g ↔ ∀ s ∈ g, s ∈ f := iff.rfl

-- As mentioned above, this is equivalent to say
-- any set of filter G contains some set of filter F. i.e. ∀ u ∈ G → (∃ v ∈ F, v ⊆ u)
example (f g : filter α) : f ≤ g ↔ (∀ {s : set α}, s ∈ g → (∃ t ∈ f, t ⊆ s)) :=
begin
  split,
  { intros h u hu,
    specialize h hu,
    refine ⟨u, h, rfl.subset⟩ },
  { intros h u hu,
    specialize h hu,
    obtain ⟨v, hv₁, hv₂⟩ := h,
    exact filter.mem_of_superset hv₁ hv₂ }
end

/-
Next, we want to consider how to define '≤' on filter basis.
Notice that the equivalence above is not always satisfied for filter basis.
Why? Hint: Look at which lemma you used in the proof of above example.

So, considering two filter basis B and C, we say B is finer than C if
any set of C contains some set of B, denoted as 'B ≤ᵇ C'.
We use '≤ᵇ' instead of '≤' here since it doesn't satisfy partial order.
i.e. if B ≤ C and C ≤ B, it doesn't always imply B = C. 
-/

namespace filter_basis

def le (B C : filter_basis α) := ∀ {s : set α}, s ∈ C → (∃ t ∈ B, t ⊆ s)

notation B `≤ᵇ` C := filter_basis.le B C

lemma le_def (B C : filter_basis α) : 
  (B ≤ᵇ C) ↔ (∀ {s : set α}, s ∈ C → (∃ t ∈ B, t ⊆ s)) := by simp only [le]

-- Next, let's think about how to prove this:
/-- If filter base B is finer than filter base C then the filter generated by B is finer
than the filter generated by C. -/
lemma filter_basis_filter_le {B C : filter_basis α} (h : B ≤ᵇ C) :
  filter_basis.filter B ≤ filter_basis.filter C :=
begin
  intros u hu,
  rw mem_filter_iff at hu ⊢,
  obtain ⟨s, hs₁, hs₂⟩ := hu,
  rw filter_basis.le_def at h,
  specialize h hs₁,
  obtain ⟨x, hx₁, hx₂⟩ := h,
  refine ⟨x, hx₁, subset_trans hx₂ hs₂⟩,
end

-- Here is another puzzle:
/-- If B is a filter basis which generates filter F and G is any filter, then
G is finer than B if and only if G is finer than the filter generated by B. -/
lemma as_basis_le_iff_le_filter (B : filter_basis α) (f : filter α) : 
  (filter.as_basis f ≤ᵇ B) ↔ f ≤ filter_basis.filter B :=
begin
  split,
  { intros h u hu,
    rw mem_filter_iff at hu,
    obtain ⟨s, hs₁, hs₂⟩ := hu,
    rw filter_basis.le_def at h,
    specialize h hs₁,
    obtain ⟨x, hx₁, hx₂⟩ := h,
    rw filter.mem_as_basis_iff at hx₁,
    suffices : x ⊆ u,
    { exact filter.mem_of_superset hx₁ this },
    exact subset_trans hx₂ hs₂ },
  { intros h u hu,
    refine ⟨u, _, rfl.subset⟩,
    rw filter.mem_as_basis_iff,
    apply h,
    exact filter_basis.mem_filter_of_mem B hu }
end

/-- B ≤ᵇ C and C ≤ᵇ B if and only if the filter generated by B equals the filter
generated by C. -/
lemma le_and_le_iff_filter_eq (B C : filter_basis α) :
  (B ≤ᵇ C) ∧ (C ≤ᵇ B) ↔ filter_basis.filter B = filter_basis.filter C :=
begin
  split,
  { rintro ⟨h₁, h₂⟩,
    apply le_antisymm,
    apply @filter_basis.filter_basis_filter_le _ B C,
    assumption,
    apply @filter_basis.filter_basis_filter_le _ C B,
    assumption },
  { intro h,
    split,
    { intros u hu,
      have hu₁ : u ∈ C.filter := filter_basis.mem_filter_of_mem C hu,
      rwa [← h, filter_basis.mem_filter_iff] at hu₁ },
    { intros u hu,
      have hu₁ : u ∈ B.filter := filter_basis.mem_filter_of_mem B hu,
      rwa [h, filter_basis.mem_filter_iff] at hu₁ } }
end   

end filter_basis
