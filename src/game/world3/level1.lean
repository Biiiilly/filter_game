import myfilter.order -- hide

open set -- hide

variable {α : Type*} --hide

/-

# Order World

## Level 1 : `partial_order (filter α)`

Welcome to the Order World! Now, we want to consider ≤ in filters.
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

/- Lemma : no-side-bar
Let's verify it satisfies partial order:
-/
lemma filter_partial_order : partial_order (filter α) :=
{ le            := λ f g, ∀ ⦃s : set α⦄, s ∈ g → s ∈ f,
  le_antisymm   := 
  begin







    sorry
  end,
  le_refl       :=
  begin







    sorry
  end,
  le_trans      :=
  begin







    sorry
  end }