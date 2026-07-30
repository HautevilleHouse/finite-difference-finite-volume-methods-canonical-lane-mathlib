import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure AdvectionDiffusionPackage (M : DiscreteMeshPackage) where
  advectionCoefficient : M.nodeSet → ℝ
  diffusionCoefficient : ℝ
  centralDifferenceScheme : (M.nodeSet → ℝ) → (M.nodeSet → ℝ)
  upwindScheme : (M.nodeSet → ℝ) → (M.nodeSet → ℝ)
  consistency : Prop
  stability : Prop
  consistencyTerm : consistency
  stabilityTerm : stability

structure AdvectionDiffusionEvidence {M : DiscreteMeshPackage}
    (A : AdvectionDiffusionPackage M) where
  consistencyClosed : A.consistency
  stabilityClosed : A.stability

def AdvectionDiffusionClosed {M : DiscreteMeshPackage}
    (A : AdvectionDiffusionPackage M) : Prop :=
  A.consistency ∧ A.stability

theorem advection_diffusion_closed_from_evidence
    {M : DiscreteMeshPackage} (A : AdvectionDiffusionPackage M)
    (E : AdvectionDiffusionEvidence A) : AdvectionDiffusionClosed A :=
  And.intro E.consistencyClosed E.stabilityClosed

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse