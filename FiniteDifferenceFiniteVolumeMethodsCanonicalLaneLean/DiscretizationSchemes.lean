import HautevilleHouse.FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure FiniteDifferenceScheme where
  stencil : List (Int × Int)
  order : Nat
  truncationErrorTerm : Prop
  consistency : Prop
  consistencyClosed : consistency

def FiniteDifferenceSchemeClosed (S : FiniteDifferenceScheme) : Prop :=
  S.consistency

theorem finite_difference_scheme_closed_from_evidence (S : FiniteDifferenceScheme) :
    FiniteDifferenceSchemeClosed S := by
  exact S.consistencyClosed

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse
