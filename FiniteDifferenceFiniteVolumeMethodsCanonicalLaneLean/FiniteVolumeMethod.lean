import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure FiniteVolumeMethod where
  cellCentered : Bool
  reconstruction : FluxReconstruction
  timeScheme : DiscretizationScheme
  isConservative : Prop
  isStable : Prop
  converges : Prop
  isConservativeClosed : isConservative
  isStableClosed : isStable
  convergesClosed : converges

def FiniteVolumeMethodClosed (FVM : FiniteVolumeMethod) : Prop :=
  FVM.isConservative ∧ FVM.isStable ∧ FVM.converges

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse
