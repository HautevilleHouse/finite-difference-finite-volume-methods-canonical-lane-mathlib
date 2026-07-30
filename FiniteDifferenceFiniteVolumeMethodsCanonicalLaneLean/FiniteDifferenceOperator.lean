import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure FiniteDifferenceOperatorPackage where
  stencil : Type u
  differenceOrder : Nat
  operatorType : Type v
  consistency : Prop
  stability : Prop
  convergence : Prop
  consistencyTerm : consistency
  stabilityTerm : stability
  convergenceTerm : convergence

structure FiniteDifferenceOperatorEvidence (D : FiniteDifferenceOperatorPackage) where
  consistencyClosed : D.consistency
  stabilityClosed : D.stability
  convergenceClosed : D.convergence

def FiniteDifferenceOperatorClosed (D : FiniteDifferenceOperatorPackage) : Prop :=
  D.consistency ∧ D.stability ∧ D.convergence

theorem finite_difference_operator_closed_from_evidence
    (D : FiniteDifferenceOperatorPackage) (E : FiniteDifferenceOperatorEvidence D) :
    FiniteDifferenceOperatorClosed D := by
  exact And.intro E.consistencyClosed (And.intro E.stabilityClosed E.convergenceClosed)

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse
