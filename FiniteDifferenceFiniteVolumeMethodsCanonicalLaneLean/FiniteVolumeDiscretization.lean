import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure FiniteVolumeDiscretizationPackage where
  mesh : Type u
  cellCenters : Type v
  faceFluxes : Type w
  conservationLaw : Prop
  consistencyOrder : Nat
  stabilityCondition : Prop
  conservationLawTerm : conservationLaw
  consistencyOrderTerm : consistencyOrder = 2
  stabilityConditionTerm : stabilityCondition

structure FiniteVolumeDiscretizationEvidence (F : FiniteVolumeDiscretizationPackage) where
  conservationLawClosed : F.conservationLaw
  consistencyOrderClosed : F.consistencyOrder = 2
  stabilityConditionClosed : F.stabilityCondition

def FiniteVolumeDiscretizationClosed (F : FiniteVolumeDiscretizationPackage) : Prop :=
  F.conservationLaw ∧ F.consistencyOrder = 2 ∧ F.stabilityCondition

theorem finite_volume_discretization_closed_from_evidence
    (F : FiniteVolumeDiscretizationPackage) (E : FiniteVolumeDiscretizationEvidence F) :
    FiniteVolumeDiscretizationClosed F := by
  exact And.intro E.conservationLawClosed (And.intro E.consistencyOrderClosed E.stabilityConditionClosed)

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse
