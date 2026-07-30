import FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.ConsistencyStabilityPackage
import FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.FVFluxPackage
import FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.ReconstructionLimiterPackage
import FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.ErrorEstimatePackage

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure ConvergencePackage (O : FDAdmittedObject) where
  consistencyStability : ConsistencyStabilityClosed O
  fluxClosed : FVFluxClosed O
  reconstructionLimiterClosed : ReconstructionLimiterClosed O
  errorEstimate : ErrorEstimateClosed O
  laxEquivalenceTheorem : Prop

def ConvergencePackageClosed (C : ConvergencePackage O) : Prop :=
  C.consistencyStability ∧ C.fluxClosed ∧ C.reconstructionLimiterClosed ∧
  C.errorEstimate ∧ C.laxEquivalenceTheorem

theorem convergence_package_closed (C : ConvergencePackage O)
    (hcs : C.consistencyStability) (hf : C.fluxClosed) (hrl : C.reconstructionLimiterClosed)
    (he : C.errorEstimate) (hle : C.laxEquivalenceTheorem) :
    ConvergencePackageClosed C := by
  exact And.intro hcs (And.intro hf (And.intro hrl (And.intro he hle)))

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse