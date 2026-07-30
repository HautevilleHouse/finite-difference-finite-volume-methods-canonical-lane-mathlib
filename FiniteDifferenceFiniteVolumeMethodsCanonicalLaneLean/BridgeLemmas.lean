import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FDMWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse