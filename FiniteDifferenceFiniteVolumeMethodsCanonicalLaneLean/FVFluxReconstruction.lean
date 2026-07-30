import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure FluxReconstructionPackage where
  numericalFlux : Type u
  reconstructionOrder : Nat
  limiterApplied : Prop
  tvdProperty : Prop
  entropyStable : Prop

structure FluxReconstructionEvidence (F : FluxReconstructionPackage) where
  reconstructionOrderPositive : F.reconstructionOrder ≥ 1
  limiterAppliedClosed : F.limiterApplied
  tvdPropertyClosed : F.tvdProperty
  entropyStableClosed : F.entropyStable

def FluxReconstructionClosed (F : FluxReconstructionPackage) : Prop :=
  F.reconstructionOrder ≥ 1 ∧ F.limiterApplied ∧ F.tvdProperty ∧ F.entropyStable

theorem flux_reconstruction_closed_from_evidence (F : FluxReconstructionPackage) (E : FluxReconstructionEvidence F) : FluxReconstructionClosed F := by
  exact And.intro E.reconstructionOrderPositive (And.intro E.limiterAppliedClosed (And.intro E.tvdPropertyClosed E.entropyStableClosed))

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse