import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure StabilityPackage (A : AdmissibleClass) where
  cflCondition : Prop
  vonNeumannAnalysis : Prop
  monotoneScheme : Prop
  stabilityCriterionClosed : Prop

structure StabilityEvidence {A : AdmissibleClass} (S : StabilityPackage A) where
  cflConditionClosed : S.cflCondition
  vonNeumannAnalysisClosed : S.vonNeumannAnalysis
  monotoneSchemeClosed : S.monotoneScheme
  stabilityCriterionClosed : S.stabilityCriterionClosed

def StabilityClosed {A : AdmissibleClass} (S : StabilityPackage A) : Prop :=
  S.cflCondition ∧ S.vonNeumannAnalysis ∧ S.monotoneScheme ∧ S.stabilityCriterionClosed

theorem stability_closed_from_evidence
    {A : AdmissibleClass} (S : StabilityPackage A) (E : StabilityEvidence S) :
    StabilityClosed S := by
  exact And.intro E.cflConditionClosed
    (And.intro E.vonNeumannAnalysisClosed
      (And.intro E.monotoneSchemeClosed E.stabilityCriterionClosed))

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse