import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure FiniteDifferenceDiscretizationPackage where
  gridPoints : Type u
  stencil : Nat
  discretizationOperator : (gridPoints -> Float) -> (gridPoints -> Float)
  consistencyOrder : Nat
  stabilityMargin : Float
  truncationError : Prop
  zeroStability : Prop

structure FiniteDifferenceDiscretizationEvidence (P : FiniteDifferenceDiscretizationPackage) where
  truncationErrorClosed : P.truncationError
  zeroStabilityClosed : P.zeroStability

def FiniteDifferenceDiscretizationClosed (P : FiniteDifferenceDiscretizationPackage) : Prop :=
  P.truncationError ∧ P.zeroStability

theorem finite_difference_discretization_closed_from_evidence
    (P : FiniteDifferenceDiscretizationPackage) (E : FiniteDifferenceDiscretizationEvidence P) :
    FiniteDifferenceDiscretizationClosed P := by
  exact And.intro E.truncationErrorClosed E.zeroStabilityClosed

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse
