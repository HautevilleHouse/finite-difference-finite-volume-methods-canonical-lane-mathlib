import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure EllipticDiscretizationPackage where
  differenceScheme : Type u
  matrixStructure : Prop
  symmetricPositiveDefinite : Prop
  conditionNumberBound : ℝ
  mMatrixProperty : Prop

structure EllipticDiscretizationEvidence (E : EllipticDiscretizationPackage) where
  matrixStructureClosed : E.matrixStructure
  symmetricPositiveDefiniteClosed : E.symmetricPositiveDefinite
  conditionNumberBoundFinite : E.conditionNumberBound < ∞
  mMatrixPropertyClosed : E.mMatrixProperty

def EllipticDiscretizationClosed (E : EllipticDiscretizationPackage) : Prop :=
  E.matrixStructure ∧ E.symmetricPositiveDefinite ∧ E.conditionNumberBound < ∞ ∧ E.mMatrixProperty

theorem elliptic_discretization_closed_from_evidence (E : EllipticDiscretizationPackage) (Ev : EllipticDiscretizationEvidence E) : EllipticDiscretizationClosed E := by
  exact And.intro Ev.matrixStructureClosed (And.intro Ev.symmetricPositiveDefiniteClosed (And.intro Ev.conditionNumberBoundFinite Ev.mMatrixPropertyClosed))

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse