import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure TimeSteppingPackage (M : DiscreteMeshPackage) where
  timeStep : ℝ
  timeLevels : ℕ
  solutionAtTime : ℕ → M.nodeSet → ℝ
  explicitEulerStep : (M.nodeSet → ℝ) → (M.nodeSet → ℝ)
  consistencyOrder : ℕ
  stabilityCondition : Prop
  consistencyOrderTerm : consistencyOrder
  stabilityConditionTerm : stabilityCondition

structure TimeSteppingEvidence {M : DiscreteMeshPackage}
    (T : TimeSteppingPackage M) where
  consistencyOrderClosed : T.consistencyOrder
  stabilityConditionClosed : T.stabilityCondition

def TimeSteppingClosed {M : DiscreteMeshPackage}
    (T : TimeSteppingPackage M) : Prop :=
  T.consistencyOrder ∧ T.stabilityCondition

theorem time_stepping_closed_from_evidence
    {M : DiscreteMeshPackage} (T : TimeSteppingPackage M)
    (E : TimeSteppingEvidence T) : TimeSteppingClosed T :=
  And.intro E.consistencyOrderClosed E.stabilityConditionClosed

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse