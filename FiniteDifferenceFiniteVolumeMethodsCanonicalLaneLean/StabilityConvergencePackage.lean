import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure StabilityConvergencePackage {M : DiscreteMeshPackage}
    (F : FluxReconstructionPackage M) where
  cflCondition : ℝ
  truncationErrorBound : ℝ → ℝ → Prop
  stabilityCondition : Prop
  convergenceOrder : ℕ
  stabilityConditionTerm : stabilityCondition
  convergenceOrderTerm : convergenceOrder

structure StabilityConvergenceEvidence {M : DiscreteMeshPackage}
    {F : FluxReconstructionPackage M}
    (S : StabilityConvergencePackage F) where
  stabilityConditionClosed : S.stabilityCondition
  convergenceOrderClosed : S.convergenceOrder

def StabilityConvergenceClosed {M : DiscreteMeshPackage}
    {F : FluxReconstructionPackage M}
    (S : StabilityConvergencePackage F) : Prop :=
  S.stabilityCondition ∧ S.convergenceOrder

theorem stability_convergence_closed_from_evidence
    {M : DiscreteMeshPackage} {F : FluxReconstructionPackage M}
    (S : StabilityConvergencePackage F)
    (E : StabilityConvergenceEvidence S) :
    StabilityConvergenceClosed S :=
  And.intro E.stabilityConditionClosed E.convergenceOrderClosed

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse