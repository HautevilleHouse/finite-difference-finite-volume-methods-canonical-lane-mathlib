import FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.FDAdmittedObject

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure FVFluxPackage (O : FDAdmittedObject) where
  fluxFunction : String
  consistency : Prop
  conservation : Prop
  upwindBias : Float

structure FluxEvidence {O : FDAdmittedObject} (F : FVFluxPackage O) where
  consistencyClosed : F.consistency
  conservationClosed : F.conservation

def FVFluxClosed (O : FDAdmittedObject) : Prop :=
  ∃ (F : FVFluxPackage O), F.consistency ∧ F.conservation

theorem fv_flux_closed_from_evidence (O : FDAdmittedObject)
    (F : FVFluxPackage O) (E : FluxEvidence F) : FVFluxClosed O := by
  refine ⟨F, E.consistencyClosed, E.conservationClosed⟩

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse