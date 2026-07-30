import FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.FDAdmittedObject

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure ReconstructionPackage (O : FDAdmittedObject) where
  reconstructionType : String
  order : Nat
  tvdProperty : Prop
  slopeLimiter : String

structure LimiterPackage (O : FDAdmittedObject) where
  limiterType : String
  slopeLimiterConsistency : Prop
  minModCoefficient : Float

def ReconstructionLimiterClosed (O : FDAdmittedObject) : Prop :=
  ∃ (R : ReconstructionPackage O) (L : LimiterPackage O),
    R.tvdProperty ∧ L.slopeLimiterConsistency

theorem reconstruction_limiter_closed (O : FDAdmittedObject)
    (R : ReconstructionPackage O) (L : LimiterPackage O)
    (hR : R.tvdProperty) (hL : L.slopeLimiterConsistency) :
    ReconstructionLimiterClosed O := by
  refine ⟨R, L, hR, hL⟩

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse