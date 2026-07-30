import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.MeshTopology

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure FluxReconstructionPackage {M : MeshTopologyPackage} where
  numericalFlux : M.nodes → M.nodes → ℝ → ℝ → ℝ
  reconstructionScheme : M.elements → (ℝ^3 → ℝ) → (ℝ^3 → ℝ)
  conservation : Prop
  consistency : Prop
  stability : Prop

structure FluxReconstructionEvidence {M : MeshTopologyPackage} (F : FluxReconstructionPackage M) where
  conservationClosed : F.conservation
  consistencyClosed : F.consistency
  stabilityClosed : F.stability

def FluxReconstructionClosed {M : MeshTopologyPackage} (F : FluxReconstructionPackage M) : Prop :=
  F.conservation ∧ F.consistency ∧ F.stability

theorem flux_reconstruction_closed_from_evidence {M : MeshTopologyPackage} (F : FluxReconstructionPackage M) (E : FluxReconstructionEvidence F) : FluxReconstructionClosed F :=
  And.intro E.conservationClosed (And.intro E.consistencyClosed E.stabilityClosed)

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse