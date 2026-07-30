import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure AdvectionDiffusionEquation where
  advectionCoeff : ℝ
  diffusionCoeff : ℝ
  sourceTerm : ℝ → ℝ
  initialCondition : ℝ → ℝ
  boundaryCondition : ℝ → ℝ → ℝ
  hasUniqueSolution : Prop
  solutionRegularity : Prop
  hasUniqueSolutionClosed : hasUniqueSolution
  solutionRegularityClosed : solutionRegularity

def AdvectionDiffusionEquationClosed (E : AdvectionDiffusionEquation) : Prop :=
  E.hasUniqueSolution ∧ E.solutionRegularity

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse
