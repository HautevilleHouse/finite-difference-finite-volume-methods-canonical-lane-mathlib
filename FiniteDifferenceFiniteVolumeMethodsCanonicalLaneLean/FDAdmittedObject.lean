import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure FDGrid where
  nodes : Nat
  cells : Nat
  dimension : Nat
  h : Float
  gridQuality : Float

structure FDDiscretization where
  grid : FDGrid
  stencilSize : Nat
  consistencyOrder : Nat
  stabilityCondition : Float

structure FVDiscretization where
  grid : FDGrid
  fluxScheme : String
  reconstruction : String
  limiter : String

structure FDAdmittedObject where
  discretization : FDDiscretization
  fvDiscretization : FVDiscretization
  convergenceEstablished : Prop
  errorEstimate : Float
  conclusion : convergenceEstablished

def FDWitnessClosed (O : FDAdmittedObject) : Prop :=
  O.convergenceEstablished

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse