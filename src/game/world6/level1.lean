import myfilter.topology -- hide

open set -- hide

variables {α : Type*} [topological_space α] -- Let α be a topological space.

/-

# Topology World

## Level 1 : `nhds`

Welcome to the Topology World! In this section,
we are going to mainly talk about the neighbourhood filters.

Before that, we need to review some basic knowledge of topological
space. This is how do we see topological space in Lean:

```
/-- A topology on `α`. -/
@[protect_proj] class topological_space (α : Type u) :=
(is_open        : set α → Prop)
(is_open_univ   : is_open univ) -- the whole space is open
(is_open_inter  : ∀s t, is_open s → is_open t → is_open (s ∩ t)) -- closed under finite instersection
(is_open_sUnion : ∀s, (∀t∈s, is_open t) → is_open (⋃₀ s)) -- closed under countable union
```

And we can define `is_open`:

```
/-- `is_open s` means that `s` is open in the ambient topological space on `α` -/
def is_open [topological_space α] (s : set α) : Prop := @topological_space.is_open _ ‹_› s
```

One of the lemma we are going to use is this:

```
lemma is_open.inter (h₁ : is_open s₁) (h₂ : is_open s₂) : is_open (s₁ ∩ s₂)
```

You can find this lemma on the left.
Now, let's define the neighbourhood filter of a denoted as 𝓝 a:
A set is called a neighborhood of `a` if it contains an open set around `a`. 
The set of all neighborhoods of `a` forms a filter,
the neighborhood filter at `a`, denoted as 𝓝 a.
-/

/- Lemma : no-side-bar
Let's verify it forms a filter:
-/
lemma nhds' (a : α) : filter α :=
begin
  sorry
/- hint
use {s : set α | ∃ t ⊆ s, is_open t ∧ a ∈ t},
{
  sorry
},
{
  sorry
},
{
  sorry
}
-/

















end

/- The following lemma is clearly true from definition and
I add it to the left:
```
lemma mem_nhds {s : set α} : s ∈ (𝓝 a) ↔ (∃ t ⊆ s, is_open t ∧ a ∈ t)
```
-/

/- Axiom : nhds (a : α)
filter α
-/

/- Axiom : mem_nhds {s : set α}
s ∈ (𝓝 a) ↔ (∃ t ⊆ s, is_open t ∧ a ∈ t)
-/