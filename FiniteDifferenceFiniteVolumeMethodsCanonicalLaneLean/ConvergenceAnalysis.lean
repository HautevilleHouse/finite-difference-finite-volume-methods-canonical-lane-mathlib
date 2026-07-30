import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.DiscreteDerivative
import HautevilleHouse.FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.FluxReconstruction

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure ConvergenceAnalysisPackage {M : MeshTopologyPackage}
    (D : DiscreteDerivativePackage M) (F : FluxReconstructionPackage M) where
  l2ErrorBound : ℝ → Prop
  hConvergenceRate : ℕ → Prop
  stabilityCondition : Prop
  consistencyCondition : Prop
  laxEquivalence : stabilityCondition → consistencyCondition → Prop

structure ConvergenceAnalysisEvidence {M : MeshTopologyPackage}
    {D : DiscreteDerivativePackage M} {F : FluxReconstructionPackage M}
    (C : ConvergenceAnalysisPackage D F) where
  l2ErrorBoundClosed : C.l2ErrorBound (0.5)
  hConvergenceRateClosed : C.hConvergenceRate 2
  stabilityConditionClosed : C.stabilityCondition
  consistencyConditionClosed : C.consistencyCondition
  laxEquivalenceClosed : C.laxEquivalence C.stabilityConditionClosed C.consistencyConditionClosed

def ConvergenceAnalysisClosed {M : MeshTopologyPackage}
    {D : DiscreteDerivativePackage M} {F : FluxReconstructionPackage M}
    (C : ConvergenceAnalysisPackage D F) : Prop :=
  C.l2ErrorBound (0.5) ∧ C.hConvergenceRate 2 ∧ C.stabilityCondition ∧ C.consistencyCondition ∧
  (C.stabilityCondition → C.consistencyCondition → True)

theorem convergence_analysis_closed_from_evidence {M : MeshTopologyPackage}
    {D : DiscreteDerivativePackage M} {F : FluxReconstructionPackage M}
    (C : ConvergenceAnalysisPackage D F) (E : ConvergenceAnalysisEvidence C) : ConvergenceAnalysisClosed C :=
  And.intro E.l2ErrorBoundClosed
    (And.intro E.hConvergenceRateClosed
      (And.intro E.stabilityConditionClosed
        (And.intro E.consistencyConditionClosed (fun _ _ => trivial))))

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse