import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure DiscreteMeshPackage where
  nodeSet : Type u
  cellSet : Type v
  faceSet : Type w
  nodeCoordinates : nodeSet → Fin 3 → ℝ
  cellVolume : cellSet → ℝ
  faceArea : faceSet → ℝ
  meshRegularity : Prop
  meshRegularityTerm : meshRegularity

structure DiscreteMeshEvidence (M : DiscreteMeshPackage) where
  meshRegularityClosed : M.meshRegularity

def DiscreteMeshClosed (M : DiscreteMeshPackage) : Prop :=
  M.meshRegularity

theorem discrete_mesh_closed_from_evidence (M : DiscreteMeshPackage)
    (E : DiscreteMeshEvidence M) : DiscreteMeshClosed M :=
  E.meshRegularityClosed

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse