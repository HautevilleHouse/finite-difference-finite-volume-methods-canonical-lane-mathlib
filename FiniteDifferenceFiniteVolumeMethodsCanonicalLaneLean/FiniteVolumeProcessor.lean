import HautevilleHouse.FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.DiscretizationSchemes

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure FiniteVolumeProcessor where
  cellCentered : Prop
  fluxApproximation : Prop
  conservation : Prop
  conservationClosed : conservation

def FiniteVolumeProcessorClosed (P : FiniteVolumeProcessor) : Prop :=
  P.conservation

theorem finite_volume_processor_closed_from_evidence (P : FiniteVolumeProcessor) :
    FiniteVolumeProcessorClosed P := by
  exact P.conservationClosed

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse
