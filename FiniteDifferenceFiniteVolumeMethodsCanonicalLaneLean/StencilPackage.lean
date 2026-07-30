import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure StencilPackage (G : GridGeometryPackage) where
  order : Nat
  upwindFraction : Prop
  fluxLimiter : Prop
  tvdProperty : Prop

def StencilClosed {G : GridGeometryPackage} (S : StencilPackage G) : Prop :=
  S.order ≥ 1 ∧ S.upwindFraction ∧ S.fluxLimiter ∧ S.tvdProperty

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse