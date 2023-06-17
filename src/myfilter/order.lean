/-
Copyright (c) 2023 Jiale Miao. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Jiale Miao, Yichen Feng, Lily Frost, Archie Prime
Thanks: Kevin Buzzard
-/

import myfilter.basis
import game.world2.level3
import game.world1.level1

/-!
# '≤' in filters and filter basis

We define '≤' in filters and filter basis in this file.

-/

open set

variable {α : Type*}

namespace filter_basis

def le (B C : filter_basis α) := ∀ {s : set α}, s ∈ C → (∃ t ∈ B, t ⊆ s)

notation B `≤ᵇ` C := filter_basis.le B C

lemma le_def (B C : filter_basis α) : 
  (B ≤ᵇ C) ↔ (∀ {s : set α}, s ∈ C → (∃ t ∈ B, t ⊆ s)) := by simp only [le]

end filter_basis
