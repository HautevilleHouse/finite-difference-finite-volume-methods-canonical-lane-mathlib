import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure DiscretizationConsistencyPackage where
  truncationErrorOrder : Prop
  consistencyCondition : Prop
  discreteConservation : Prop
  localTruncationErrorBound : Prop
  truncationErrorOrderEvidence : truncationErrorOrder
  consistencyConditionEvidence : consistencyCondition
  discreteConservationEvidence : discreteConservation
  localTruncationErrorBoundEvidence : localTruncationErrorBound

structure DiscretizationConsistencyEvidence (P : DiscretizationConsistencyPackage) where
  truncationErrorOrderClosed : P.truncationErrorOrder
  consistencyConditionClosed : P.consistencyCondition
  discreteConservationClosed : P.discreteConservation
  localTruncationErrorBoundClosed : P.localTruncationErrorBound

def DiscretizationConsistencyClosed (P : DiscretizationConsistencyPackage) : Prop :=
  P.truncationErrorOrder ∧ P.consistencyCondition ∧ P.discreteConservation ∧ P.localTruncationErrorBound

theorem discretization_consistency_closed_from_evidence (P : DiscretizationConsistencyPackage) (E : DiscretizationConsistencyEvidence P) :
    DiscretizationConsistencyClosed P := by
  exact And.intro E.truncationErrorOrderClosed (And.intro E.consistencyConditionClosed (And.intro E.discreteConservationClosed E.localTruncationErrorBoundClosed))

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse