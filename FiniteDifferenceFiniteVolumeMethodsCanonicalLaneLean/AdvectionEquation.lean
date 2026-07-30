import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure AdvectionEquation where
  speed : Float
  initialCondition : Float -> Float
  exactSolution : Float -> Float -> Float
  exactSolutionKnown : exactSolution = fun x t => initialCondition (x - speed * t)

def AdvectionEquationClosed (A : AdvectionEquation) : Prop :=
  A.exactSolutionKnown

theorem advection_equation_closed (A : AdvectionEquation) (h : A.exactSolutionKnown) : AdvectionEquationClosed A := by
  exact h

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse