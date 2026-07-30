import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.MeshTopology

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure DiscreteDerivativePackage {M : MeshTopologyPackage} where
  gradientMatrix : M.nodes → List (M.nodes × ℝ)
  divergenceMatrix : M.elements → List (M.elements × ℝ)
  laplacianMatrix : M.nodes → M.nodes → ℝ
  consistencyOrder : ℕ
  stability : Prop
  adjointRelation : Prop

structure DiscreteDerivativeEvidence {M : MeshTopologyPackage} (D : DiscreteDerivativePackage M) where
  consistencyOrderClosed : D.consistencyOrder ≥ 1
  stabilityClosed : D.stability
  adjointRelationClosed : D.adjointRelation

def DiscreteDerivativeClosed {M : MeshTopologyPackage} (D : DiscreteDerivativePackage M) : Prop :=
  D.consistencyOrder ≥ 1 ∧ D.stability ∧ D.adjointRelation

theorem discrete_derivative_closed_from_evidence {M : MeshTopologyPackage} (D : DiscreteDerivativePackage M) (E : DiscreteDerivativeEvidence D) : DiscreteDerivativeClosed D :=
  And.intro E.consistencyOrderClosed (And.intro E.stabilityClosed E.adjointRelationClosed)

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse