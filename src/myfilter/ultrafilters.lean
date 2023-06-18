/-
Copyright (c) 2023 Jiale Miao. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Jiale Miao, Yichen Feng, Lily Frost, Archie Prime
Thanks: Kevin Buzzard
-/

import myfilter.principal
import myfilter.challenges
import order.basic

/-!
# ultrafilters

We define the ultrafilters in this file. Notice that some of the lemmas we used are
given in 'game.level_06_challenges'. You can directly use these lemmas for now, 
and do them in the level 6.

# Main Definitions

`ultrafilter` : An ultrafilter is a minimal (maximal in the set order) proper filter.

-/

open set function

variable {α : Type*}

-- Firstly, let's define ultrafilers:
/-- An ultrafilter is a minimal (maximal in the set order) proper filter. -/
structure ultrafilter (α : Type*) :=
(to_filter : filter α)
(ne_bot'   : to_filter ≠ ⊥)
(le_of_le  : ∀ g, g ≠ ⊥ → g ≤ to_filter → to_filter ≤ g)

namespace ultrafilter

variables {f g : ultrafilter α} {s t : set α}

-- An ultrafilter is clearly a filter.
instance : has_coe_t (ultrafilter α) (filter α) := ⟨ultrafilter.to_filter⟩

instance : has_mem (set α) (ultrafilter α) := ⟨λ s f, s ∈ (f : filter α)⟩

/- If any filter g is finer than the ultrafilter f, then g = f,
since an ultrafilter is a minimal proper filter. -/
lemma unique' (f : ultrafilter α) {g : filter α} (h : g ≤ f)
  (hne : g ≠ ⊥) : g = f :=
begin
  apply le_antisymm h,
  exact f.le_of_le g hne h,
end

/-- We provide some basic APIs below.
Notice there is no need to do here. -/

@[simp] lemma mem_coe : s ∈ (f : filter α) ↔ s ∈ f := iff.rfl

lemma coe_injective : injective (coe : ultrafilter α → filter α)
| ⟨f, h₁, h₂⟩ ⟨g, h₃, h₄⟩ rfl := by congr

lemma eq_of_le {f g : ultrafilter α} (h : (f : filter α) ≤ g) : f = g :=
coe_injective (g.unique' h f.ne_bot')

@[simp] lemma coe_le_coe {f g : ultrafilter α} : (f : filter α) ≤ g ↔ f = g :=
⟨λ h, eq_of_le h, λ h, begin rw h, exact le_refl g end⟩

@[simp] lemma coe_inj : (f : filter α) = g ↔ f = g := coe_injective.eq_iff

@[ext] lemma ext ⦃f g : ultrafilter α⦄ (h : ∀ s, s ∈ f ↔ s ∈ g) : f = g :=
coe_injective $ filter.ext h

/--
Now, it's time to do some amazing puzzles!
Our main goal: Prove `f` is an ultrafilter if and only if `sᶜ ∉ f ↔ s ∈ f for ∀ s`.
The following lemma 'le_of_inf_ne_bot'' might be helpful in the proof of forward direction.

Notice that in that lemma we use the "intersection" of two filters, which is not the usual
intersection of two filters, since the intersection of two filters is not always a filter.
Hence instead, we define "intersection" of two filters as 
the filter generated by intersections of elements of the two filters.
This is defined in 'game.level_06_challenges' and you can find some useful lemmas related
it there. Again, you can directly use these lemmas for now, and do them in the level 6.
-/

-- Hint: 'le_of_inf_eq' may be a good start here.
lemma le_of_inf_ne_bot' (f : ultrafilter α) {g : filter α} (hg : (↑f ⊓ g) ≠ ⊥) : 
  ↑f ≤ g :=
begin
  apply @lattice.le_of_inf_eq (filter α) _,
  apply unique' f _ hg,
  exact lattice.inf_le_left,
end

/-- Now coming to our main goal:
The backward direction is 'filter.compl_not_mem' given in 'game.level_05_challenges'.
(i.e. you can directly use 'filter.compl_not_mem' here for now, 
and do it in the next level)
Hints for the forward direction:
'filter.le_principal_iff'
'ultrafilter.le_of_inf_ne_bot''
'filter.empty_mem_iff_bot'
'filter.mem_inf_principal'
Notice that some of the lemmas above are in 'game.level_06_challenges',
you can directly use them for now, and do them in the next level.
-/
lemma compl_not_mem_iff' [decidable_pred s] : -s ∉ f ↔ s ∈ f :=
begin
  split,
  { intro h,
    rw ← mem_coe,
    rw ← filter.le_principal_iff',
    apply le_of_inf_ne_bot',
    intro h₁,
    rw ← filter.empty_mem_iff_bot' at h₁,
    rw filter.mem_inf_principal' at h₁,
    simp only [mem_empty_eq, mem_coe] at h₁,
    suffices : {x : α | x ∈ s → false} = -s,
    { rw this at h₁,
      contradiction },
    ext,
    simp only [mem_set_of_eq],
    refl },
  { intro h,
    exact filter.compl_not_mem' f.ne_bot' h }
end

-- This result is directly from previous one.
lemma compl_mem_iff_not_mem [decidable_pred s] : -s ∈ f ↔ s ∉ f := 
begin
  symmetry,
  rw [← compl_not_mem_iff'],
  exact classical.not_not,
end

-- Hint: 'filter.compl_not_mem' might be helpful.
/-- If `sᶜ ∉ f ↔ s ∈ f`, then `f` is an ultrafilter. The other implication is given by
`ultrafilter.compl_not_mem_iff'`.  -/
def of_compl_not_mem_iff (f : filter α) (h : ∀ s, -s ∉ f ↔ s ∈ f) : ultrafilter α :=
{ to_filter := f,
  ne_bot'   := λ hf, by simpa [hf] using h,
  le_of_le  := λ g hg hgf s hs, (h s).1 $ λ hsc, 
                by exact filter.compl_not_mem' hg hs (hgf hsc) }

end ultrafilter
