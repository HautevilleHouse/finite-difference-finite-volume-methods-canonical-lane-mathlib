import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.StabilityAnalysis
import HautevilleHouse.FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.ConsistencyAccuracy

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure LaxEquivalencePackage {A : AdmissibleClass}
    (S : StabilityPackage A) (C : ConsistencyPackage A) where
  stabilityImpliesConvergence : Prop
  consistencySufficient : Prop
  laxTheoremApplied : Prop

structure LaxEquivalenceEvidence {A : AdmissibleClass}
    {S : StabilityPackage A} {C : ConsistencyPackage A}
    (L : LaxEquivalencePackage S C) where
  stabilityImpliesConvergenceClosed : L.stabilityImpliesConvergence
  consistencySufficientClosed : L.consistencySufficient
  laxTheoremAppliedClosed : L.laxTheoremApplied

def LaxEquivalenceClosed {A : AdmissibleClass}
    {S : StabilityPackage A} {C : ConsistencyPackage A}
    (L : LaxEquivalencePackage S C) : Prop :=
  L.stabilityImpliesConvergence ∧ L.consistencySufficient ∧ L.laxTheoremApplied

theorem lax_equivalence_closed_from_evidence
    {A : AdmissibleClass} {S : StabilityPackage A} {C : ConsistencyPackage A}
    (L : LaxEquivalencePackage S C) (E : LaxEquivalenceEvidence L) :
    LaxEquivalenceClosed L := by
  exact And.intro E.stabilityImpliesConvergenceClosed
    (And.intro E.consistencySufficientClosed E.laxTheoremAppliedClosed)

theorem convergence_from_lax_evidence
    {A : AdmissibleClass} {S : StabilityPackage A} {C : ConsistencyPackage A}
    (L : LaxEquivalencePackage S C) (E : LaxEquivalenceEvidence L) :
    StabilityClosed S ∧ ConsistencyClosed C ∧ LaxEquivalenceClosed L := by
  have hS : StabilityClosed S := by
    -- Use a lemma from StabilityAnalysis, assumed to be imported
    apply stabilityPackageClosed
  have hC : ConsistencyClosed C := by
    apply consistencyPackageClosed
  exact And.intro hS (And.intro hC (lax_equivalence_closed_from_evidence L E))

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse