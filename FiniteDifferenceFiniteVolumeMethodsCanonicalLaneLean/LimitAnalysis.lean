import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure LimitAnalysisPackage {G : GridGeometryPackage} {S : StencilPackage G} (T : TimeDiscretizationPackage G S) where
  stabilityCriterion : Prop
  consistencyOrder : Nat
  convergenceRate : Prop
  errorEstimateLaxRichtmyer : Prop

def LimitAnalysisClosed {G : GridGeometryPackage} {S : StencilPackage G} {T : TimeDiscretizationPackage G S} (L : LimitAnalysisPackage T) : Prop :=
  L.stabilityCriterion ∧ L.consistencyOrder ≥ 1 ∧ L.convergenceRate ∧ L.errorEstimateLaxRichtmyer

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse