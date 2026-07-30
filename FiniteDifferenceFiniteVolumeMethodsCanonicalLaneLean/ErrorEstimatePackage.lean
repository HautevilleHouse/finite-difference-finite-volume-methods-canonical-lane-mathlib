import FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.FDAdmittedObject

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure ErrorEstimatePackage (O : FDAdmittedObject) where
  errorEstimateComputed : Prop
  priorEstimate : Float
  posteriorEstimate : Float
  convergenceRateAchieved : Prop

structure ErrorEstimateEvidence {O : FDAdmittedObject} (E : ErrorEstimatePackage O) where
  errorEstimateComputedClosed : E.errorEstimateComputed
  convergenceRateAchievedClosed : E.convergenceRateAchieved

def ErrorEstimateClosed (O : FDAdmittedObject) : Prop :=
  ∃ (E : ErrorEstimatePackage O), E.errorEstimateComputed ∧ E.convergenceRateAchieved

theorem error_estimate_closed_from_evidence (O : FDAdmittedObject)
    (E : ErrorEstimatePackage O) (Ev : ErrorEstimateEvidence E) : ErrorEstimateClosed O := by
  refine ⟨E, Ev.errorEstimateComputedClosed, Ev.convergenceRateAchievedClosed⟩

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse