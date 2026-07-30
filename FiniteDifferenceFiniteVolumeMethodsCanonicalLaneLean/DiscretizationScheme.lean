import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure DiscretizationScheme where
  methodType : String
  stencil : List (Int × Int)
  order : Nat
  consistency : Prop
  stability : Prop
  convergence : Prop
  consistencyClosed : consistency
  stabilityClosed : stability
  convergenceClosed : convergence

def DiscretizationSchemeClosed (D : DiscretizationScheme) : Prop :=
  D.consistency ∧ D.stability ∧ D.convergence

theorem discretization_scheme_closed_from_evidence (D : DiscretizationScheme) (c : D.consistency) (s : D.stability) (v : D.convergence) : DiscretizationSchemeClosed D := by
  exact And.intro c (And.intro s v)

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse
