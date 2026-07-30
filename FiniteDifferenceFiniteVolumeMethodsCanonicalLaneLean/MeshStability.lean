import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure MeshStabilityPackage where
  meshRegularity : Prop
  aspectRatioBound : Prop
  skewnessControl : Prop
  orthogonalityMeasure : Prop
  refinementQuotient : Prop
  meshRegularityEvidence : meshRegularity
  aspectRatioBoundEvidence : aspectRatioBound
  skewnessControlEvidence : skewnessControl
  orthogonalityMeasureEvidence : orthogonalityMeasure
  refinementQuotientEvidence : refinementQuotient

structure MeshStabilityEvidence (P : MeshStabilityPackage) where
  meshRegularityClosed : P.meshRegularity
  aspectRatioBoundClosed : P.aspectRatioBound
  skewnessControlClosed : P.skewnessControl
  orthogonalityMeasureClosed : P.orthogonalityMeasure
  refinementQuotientClosed : P.refinementQuotient

def MeshStabilityClosed (P : MeshStabilityPackage) : Prop :=
  P.meshRegularity ∧ P.aspectRatioBound ∧ P.skewnessControl ∧ P.orthogonalityMeasure ∧ P.refinementQuotient

theorem mesh_stability_closed_from_evidence (P : MeshStabilityPackage) (E : MeshStabilityEvidence P) :
    MeshStabilityClosed P := by
  exact And.intro E.meshRegularityClosed (And.intro E.aspectRatioBoundClosed (And.intro E.skewnessControlClosed (And.intro E.orthogonalityMeasureClosed E.refinementQuotientClosed)))

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse