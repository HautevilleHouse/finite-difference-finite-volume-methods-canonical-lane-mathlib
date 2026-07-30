import FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.FDAdmittedObject

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure ConsistencyPackage (O : FDAdmittedObject) where
  truncationError : Prop
  consistencyOrderMatch : O.discretization.consistencyOrder = 2
  asymptoticExpansion : Prop
  leadingErrorTerm : Float

structure StabilityPackage (O : FDAdmittedObject) where
  vonNeumannCondition : Prop
  cflCondition : O.discretization.stabilityCondition ≤ 1.0
  spectralRadius : Float
  discreteMaximumPrinciple : Prop

structure ConsistencyStabilityEvidence {O : FDAdmittedObject}
    (C : ConsistencyPackage O) (S : StabilityPackage O) where
  truncationErrorClosed : C.truncationError
  consistencyOrderMatchClosed : C.consistencyOrderMatch
  asymptoticExpansionClosed : C.asymptoticExpansion
  vonNeumannConditionClosed : S.vonNeumannCondition
  cflConditionClosed : S.cflCondition
  discreteMaximumPrincipleClosed : S.discreteMaximumPrinciple

def ConsistencyStabilityClosed (O : FDAdmittedObject) : Prop :=
  ∃ (C : ConsistencyPackage O) (S : StabilityPackage O), 
    C.truncationError ∧ C.consistencyOrderMatch ∧ C.asymptoticExpansion ∧
    S.vonNeumannCondition ∧ S.cflCondition ∧ S.discreteMaximumPrinciple

theorem consistency_stability_closed_from_evidence (O : FDAdmittedObject)
    (C : ConsistencyPackage O) (S : StabilityPackage O)
    (E : ConsistencyStabilityEvidence C S) : ConsistencyStabilityClosed O := by
  refine ⟨C, S, E.truncationErrorClosed, E.consistencyOrderMatchClosed, E.asymptoticExpansionClosed,
    E.vonNeumannConditionClosed, E.cflConditionClosed, E.discreteMaximumPrincipleClosed⟩

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse