import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure FiniteDifferenceGrid where
  numPoints : Nat
  h : Nat -> Float
  uniform : Prop
  uniformTerm : uniform

def FiniteDifferenceGridClosed (G : FiniteDifferenceGrid) : Prop :=
  G.uniform

theorem finite_difference_grid_closed (G : FiniteDifferenceGrid) (h : G.uniform) : FiniteDifferenceGridClosed G := by
  exact h

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse