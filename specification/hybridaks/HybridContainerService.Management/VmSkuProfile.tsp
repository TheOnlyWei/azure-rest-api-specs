import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "@typespec/rest";
import "./models.tsp";

using TypeSpec.Rest;
using Azure.ResourceManager;
using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Microsoft.HybridContainerService;
/**
 * The list of supported VM SKUs.
 */
@singleton("default")
model VmSkuProfile is ExtensionResource<VmSkuProfileProperties> {
  ...ResourceNameParameter<VmSkuProfile, "skus", "skus">;

  /**
   * Extended location pointing to the underlying infrastructure
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-invalid-envelope-property" ""
  extendedLocation?: ExtendedLocation;
}

@armResourceOperations
interface VmSkuProfiles {
  /**
   * Lists the supported VM skus for the specified custom location
   */
  #suppress "@azure-tools/typespec-azure-core/casing-style" ""
  getVMSkus is ArmResourceRead<VmSkuProfile>;

  /**
   * Puts the default VM skus resource type (one time operation, before listing the VM skus)
   */
  #suppress "@azure-tools/typespec-azure-core/casing-style" ""
  putVMSkus is ArmResourceCreateOrReplaceAsync<VmSkuProfile>;

  /**
   * Deletes the default VM skus resource type
   */
  #suppress "@azure-tools/typespec-azure-core/casing-style" ""
  deleteVMSkus is ArmResourceDeleteWithoutOkAsync<VmSkuProfile>;

  /**
   * Lists the supported VM skus for the specified custom location
   */
  list is ArmResourceListByParent<VmSkuProfile>;
}

@@doc(VmSkuProfiles.putVMSkus::parameters.resource,
  "VM SKUs resource definition"
);
