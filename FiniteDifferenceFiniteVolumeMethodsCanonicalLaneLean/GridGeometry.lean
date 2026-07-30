import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure GridGeometryPackage where
  gridType : String
  cellCount : Nat
  aspectRatio : Prop
  boundaryFit : Prop
  nonOrthogonalCorrection : Prop

def GridGeometryClosed (G : GridGeometryPackage) : Prop :=
  G.gridType ≠ "" ∧ G.cellCount > 0 ∧ G.aspectRatio ∧ G.boundaryFit ∧ G.nonOrthogonalCorrection

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse