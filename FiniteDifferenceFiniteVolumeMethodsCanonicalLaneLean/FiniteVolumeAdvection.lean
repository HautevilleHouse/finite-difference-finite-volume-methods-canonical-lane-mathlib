import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure FiniteVolumeAdvectionPackage where
  domainPartition : Type u
  controlVolumes : List (Set domainPartition)
  numericalFlux : (domainPartition -> Float) -> (domainPartition -> Float) -> Float
  consLaws : Prop
  fluxConsistency : Prop
  stabilityCondition : Prop

structure FiniteVolumeAdvectionEvidence (P : FiniteVolumeAdvectionPackage) where
  consLawsClosed : P.consLaws
  fluxConsistencyClosed : P.fluxConsistency
  stabilityConditionClosed : P.stabilityCondition

def FiniteVolumeAdvectionClosed (P : FiniteVolumeAdvectionPackage) : Prop :=
  P.consLaws ∧ P.fluxConsistency ∧ P.stabilityCondition

theorem finite_volume_advection_closed_from_evidence
    (P : FiniteVolumeAdvectionPackage) (E : FiniteVolumeAdvectionEvidence P) :
    FiniteVolumeAdvectionClosed P := by
  exact And.intro E.consLawsClosed (And.intro E.fluxConsistencyClosed E.stabilityConditionClosed)

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse
