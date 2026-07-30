import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure MeshTopologyPackage where
  nodes : Type u
  elements : Type v
  nodeCoordinates : nodes → ℝ^3
  elementIncidence : elements → List nodes
  boundaryNodes : Set nodes
  interiorNodes : Set nodes
  nonDegenerate : Prop
  quasiUniform : Prop

structure MeshTopologyEvidence (M : MeshTopologyPackage) where
  nonDegenerateClosed : M.nonDegenerate
  quasiUniformClosed : M.quasiUniform

def MeshTopologyClosed (M : MeshTopologyPackage) : Prop :=
  M.nonDegenerate ∧ M.quasiUniform

theorem mesh_topology_closed_from_evidence (M : MeshTopologyPackage) (E : MeshTopologyEvidence M) : MeshTopologyClosed M :=
  And.intro E.nonDegenerateClosed E.quasiUniformClosed

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse