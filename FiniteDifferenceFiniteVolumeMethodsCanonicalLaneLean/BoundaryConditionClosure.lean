import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure BoundaryConditionClosurePackage {G : GridGeometryPackage} {S : StencilPackage G} where
  ghostCellMethod : Prop
  neumannBC : Prop
  dirichletBC : Prop
  robinBC : Prop
  periodicBC : Prop

def BoundaryConditionClosureClosed {G : GridGeometryPackage} {S : StencilPackage G} (B : BoundaryConditionClosurePackage G S) : Prop :=
  B.ghostCellMethod ∧ (B.neumannBC ∨ B.dirichletBC ∨ B.robinBC ∨ B.periodicBC)

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse