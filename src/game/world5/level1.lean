import myfilter.ultrafilters -- hide

open set -- hide

variable {α : Type*} -- hide

/-

# Ultrafilter World

## Level 1 : `ultrafilter.unique`

Welcome to the Ultrafilter World! In this section,
we are going to talk about ultrafilters.

An ultrafilter is a minimal (maximal in the set order) proper filter.
Defined in this game as:
```
structure ultrafilter (α : Type*) :=
(to_filter : filter α)
(ne_bot'   : to_filter ≠ ⊥) -- proper filter
(le_of_le  : ∀ g, g ≠ ⊥ → g ≤ to_filter → to_filter ≤ g) -- minimal
```
-/

/- Lemma
If any filter g is finer than the ultrafilter f, then g = f,
since an ultrafilter is a minimal proper filter.
-/
lemma ultrafilter.unique (f : ultrafilter α) {g : filter α} (h : g ≤ f)
  (hne : g ≠ ⊥) : g = f :=
begin
  sorry




  
end