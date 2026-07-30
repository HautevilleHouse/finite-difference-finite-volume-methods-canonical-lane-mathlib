import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure ConsistencyPackage (A : AdmissibleClass) where
  taylorExpansion : Prop
  truncationErrorOrder : Prop
  consistencyCondition : Prop
  orderOfAccuracy : Prop

structure ConsistencyEvidence {A : AdmissibleClass} (C : ConsistencyPackage A) where
  taylorExpansionClosed : C.taylorExpansion
  truncationErrorOrderClosed : C.truncationErrorOrder
  consistencyConditionClosed : C.consistencyCondition
  orderOfAccuracyClosed : C.orderOfAccuracy

def ConsistencyClosed {A : AdmissibleClass} (C : ConsistencyPackage A) : Prop :=
  C.taylorExpansion ∧ C.truncationErrorOrder ∧ C.consistencyCondition ∧ C.orderOfAccuracy

theorem consistency_closed_from_evidence
    {A : AdmissibleClass} (C : ConsistencyPackage A) (E : ConsistencyEvidence C) :
    ConsistencyClosed C := by
  exact And.intro E.taylorExpansionClosed
    (And.intro E.truncationErrorOrderClosed
      (And.intro E.consistencyConditionClosed E.orderOfAccuracyClosed))

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse