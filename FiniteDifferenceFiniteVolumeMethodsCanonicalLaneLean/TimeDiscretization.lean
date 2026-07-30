import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure TimeDiscretizationPackage {G : GridGeometryPackage} (S : StencilPackage G) where
  timeStep : Type u
  courantNumber : Prop
  explicitScheme : Prop
  implicitScheme : Prop
  rungeKuttaStageCount : Nat

def TimeDiscretizationClosed {G : GridGeometryPackage} {S : StencilPackage G} (T : TimeDiscretizationPackage G S) : Prop :=
  T.courantNumber ∧ (T.explicitScheme ∨ T.implicitScheme) ∧ T.rungeKuttaStageCount ≥ 1

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse