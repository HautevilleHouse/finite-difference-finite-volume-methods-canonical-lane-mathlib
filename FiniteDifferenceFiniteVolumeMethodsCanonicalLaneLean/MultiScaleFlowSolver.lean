import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure MultiScaleFlowSolverPackage (G : GridGeometryPackage) (S : StencilPackage G) (T : TimeDiscretizationPackage G S) (L : LimitAnalysisPackage T) where
  multiGridLevels : Nat
  mgThersholdFactor : Prop
  coarseGridCorrection : Prop
  fullMultiGridCycle : Prop

def MultiScaleFlowSolverClosed {G : GridGeometryPackage} {S : StencilPackage G} {T : TimeDiscretizationPackage G S} {L : LimitAnalysisPackage T} (M : MultiScaleFlowSolverPackage G S T L) : Prop :=
  M.multiGridLevels > 0 ∧ M.mgThersholdFactor ∧ M.coarseGridCorrection ∧ M.fullMultiGridCycle

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse