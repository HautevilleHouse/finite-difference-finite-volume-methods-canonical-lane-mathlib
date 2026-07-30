import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure StabilityConvergencePackage where
  vonNeumannStability : Prop
  laxEquivalence : Prop
  discreteMaximumPrinciple : Prop
  cflCondition : Prop
  convergenceRate : Prop
  vonNeumannStabilityEvidence : vonNeumannStability
  laxEquivalenceEvidence : laxEquivalence
  discreteMaximumPrincipleEvidence : discreteMaximumPrinciple
  cflConditionEvidence : cflCondition
  convergenceRateEvidence : convergenceRate

structure StabilityConvergenceEvidence (P : StabilityConvergencePackage) where
  vonNeumannStabilityClosed : P.vonNeumannStability
  laxEquivalenceClosed : P.laxEquivalence
  discreteMaximumPrincipleClosed : P.discreteMaximumPrinciple
  cflConditionClosed : P.cflCondition
  convergenceRateClosed : P.convergenceRate

def StabilityConvergenceClosed (P : StabilityConvergencePackage) : Prop :=
  P.vonNeumannStability ∧ P.laxEquivalence ∧ P.discreteMaximumPrinciple ∧ P.cflCondition ∧ P.convergenceRate

theorem stability_convergence_closed_from_evidence (P : StabilityConvergencePackage) (E : StabilityConvergenceEvidence P) :
    StabilityConvergenceClosed P := by
  exact And.intro E.vonNeumannStabilityClosed (And.intro E.laxEquivalenceClosed (And.intro E.discreteMaximumPrincipleClosed (And.intro E.cflConditionClosed E.convergenceRateClosed)))

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse