import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure FluxReconstructionPackage (M : DiscreteMeshPackage) where
  numericalFlux : M.faceSet → ℝ → ℝ → ℝ
  reconstruction : M.cellSet → ℝ → ℝ
  consistency : ∀ (f : ℝ), numericalFlux f f = f
  monotonicity : Prop
  consistencyTerm : consistency
  monotonicityTerm : monotonicity

structure FluxReconstructionEvidence {M : DiscreteMeshPackage}
    (F : FluxReconstructionPackage M) where
  consistencyClosed : F.consistency
  monotonicityClosed : F.monotonicity

def FluxReconstructionClosed {M : DiscreteMeshPackage}
    (F : FluxReconstructionPackage M) : Prop :=
  F.consistency ∧ F.monotonicity

theorem flux_reconstruction_closed_from_evidence
    {M : DiscreteMeshPackage} (F : FluxReconstructionPackage M)
    (E : FluxReconstructionEvidence F) : FluxReconstructionClosed F :=
  And.intro E.consistencyClosed E.monotonicityClosed

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse