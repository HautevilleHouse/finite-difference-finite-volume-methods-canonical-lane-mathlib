import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure StabilityCondition where
  cflNumber : Float
  schemeStable : Prop
  cflBound : Float
  schemeStableTerm : schemeStable

def StabilityConditionClosed (S : StabilityCondition) : Prop :=
  S.schemeStable

theorem stability_condition_closed (S : StabilityCondition) (h : S.schemeStable) : StabilityConditionClosed S := by
  exact h

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse