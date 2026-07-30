import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure MeshConvergencePackage where
  meshFamily : Type u
  refinementIndex : ℕ → ℕ
  consistency : Prop
  stability : Prop
  convergenceOrder : ℝ
  laxEquivalenceTheorem : Prop

structure MeshConvergenceEvidence (M : MeshConvergencePackage) where
  consistencyClosed : M.consistency
  stabilityClosed : M.stability
  convergenceOrderPositive : M.convergenceOrder > 0
  laxEquivalenceTheoremClosed : M.laxEquivalenceTheorem

def MeshConvergenceClosed (M : MeshConvergencePackage) : Prop :=
  M.consistency ∧ M.stability ∧ M.convergenceOrder > 0 ∧ M.laxEquivalenceTheorem

theorem mesh_convergence_closed_from_evidence (M : MeshConvergencePackage) (E : MeshConvergenceEvidence M) : MeshConvergenceClosed M := by
  exact And.intro E.consistencyClosed (And.intro E.stabilityClosed (And.intro E.convergenceOrderPositive E.laxEquivalenceTheoremClosed))

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse