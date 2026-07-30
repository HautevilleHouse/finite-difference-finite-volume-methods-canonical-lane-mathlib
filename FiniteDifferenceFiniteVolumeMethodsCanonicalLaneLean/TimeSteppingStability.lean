import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure TimeSteppingStabilityPackage where
  rungeKuttaStages : Nat
  cflCondition : Prop
  strongStabilityPreserving : Prop
  absoluteStabilityRegion : Prop

timeSteppingStabilityPackage_structure TimeSteppingStabilityPackage

structure TimeSteppingStabilityEvidence (T : TimeSteppingStabilityPackage) where
  cflConditionClosed : T.cflCondition
  strongStabilityPreservingClosed : T.strongStabilityPreserving
  absoluteStabilityRegionClosed : T.absoluteStabilityRegion

def TimeSteppingStabilityClosed (T : TimeSteppingStabilityPackage) : Prop :=
  T.cflCondition ∧ T.strongStabilityPreserving ∧ T.absoluteStabilityRegion

theorem time_stepping_stability_closed_from_evidence (T : TimeSteppingStabilityPackage) (E : TimeSteppingStabilityEvidence T) : TimeSteppingStabilityClosed T := by
  exact And.intro E.cflConditionClosed (And.intro E.strongStabilityPreservingClosed E.absoluteStabilityRegionClosed)

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse