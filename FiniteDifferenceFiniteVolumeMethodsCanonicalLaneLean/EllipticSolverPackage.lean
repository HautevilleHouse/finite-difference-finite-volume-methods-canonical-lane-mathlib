import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure EllipticSolverPackage (M : DiscreteMeshPackage) where
  stiffnessMatrix : M.nodeSet → M.nodeSet → ℝ
  loadVector : M.nodeSet → ℝ
  solution : M.nodeSet → ℝ
  poissonEquation : ∀ (i : M.nodeSet),
    ∑ (j : M.nodeSet), stiffnessMatrix i j * solution j = loadVector i
  symmetricPositiveDefinite : Prop
  linearSystemSolvable : Prop
  symmetricPositiveDefiniteTerm : symmetricPositiveDefinite
  linearSystemSolvableTerm : linearSystemSolvable

structure EllipticSolverEvidence {M : DiscreteMeshPackage}
    (E : EllipticSolverPackage M) where
  poissonEquationClosed : ∀ (i : M.nodeSet),
    ∑ (j : M.nodeSet), E.stiffnessMatrix i j * E.solution j = E.loadVector i

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse