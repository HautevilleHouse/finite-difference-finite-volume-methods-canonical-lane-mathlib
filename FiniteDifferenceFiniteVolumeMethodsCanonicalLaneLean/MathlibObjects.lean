import HautevilleHouse.FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.DiscretizationSchemes
import HautevilleHouse.FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean.FiniteVolumeProcessor

namespace HautevilleHouse
namespace FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean

structure AdmittedObject where
  scheme : FiniteDifferenceScheme
  processor : FiniteVolumeProcessor
  orderProp : Prop
  stability : Prop
  conclusion : orderProp ∧ stability

structure AdmittedObjectClosed (O : AdmittedObject) : Prop :=
  schemeClosed : FiniteDifferenceSchemeClosed O.scheme
  processorClosed : FiniteVolumeProcessorClosed O.processor
  orderStabilityClosed : O.orderProp ∧ O.stability

end FiniteDifferenceFiniteVolumeMethodsCanonicalLaneLean
end HautevilleHouse
