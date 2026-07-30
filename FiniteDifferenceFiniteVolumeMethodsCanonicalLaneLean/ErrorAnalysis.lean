import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure ErrorAnalysis where
  truncationError : Float
  convergenceOrder : Nat
  errorDecreases : Prop
  errorDecreasesTerm : errorDecreases

def ErrorAnalysisClosed (E : ErrorAnalysis) : Prop :=
  E.errorDecreases

theorem error_analysis_closed (E : ErrorAnalysis) (h : E.errorDecreases) : ErrorAnalysisClosed E := by
  exact h

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse