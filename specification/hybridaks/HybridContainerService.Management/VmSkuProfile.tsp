import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "@typespec/rest";
import "./models.tsp";

using TypeSpec.Rest;
using Azure.ResourceManager;
using Azure.ResourceManager.Foundations;
using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Microsoft.HybridContainerService;
/**
 * The list of supported VM SKUs.
 */
@singleton("default")
model VmSkuProfile is ExtensionResource<VmSkuProfileProperties> {
  @key("skus")
  @segment("skus")
  @visibility("read")
  name: string;

  /**
   * Extended location pointing to the underlying infrastructure
   */
  extendedLocation?: ExtendedLocation;
}

@armResourceOperations
interface VmSkuProfiles {
  /**
   * Lists the supported VM skus for the specified custom location
   */
  getVMSkus is ArmResourceRead<VmSkuProfile>;

  /**
   * Puts the default VM skus resource type (one time operation, before listing the VM skus)
   */
  putVMSkus is ArmResourceCreateOrReplaceAsync<VmSkuProfile>;

  /**
   * Deletes the default VM skus resource type
   */
  deleteVMSkus is ArmResourceDeleteWithoutOkAsync<VmSkuProfile>;

  /**
   * Lists the supported VM skus for the specified custom location
   */
  list is ArmResourceListByParent<VmSkuProfile>;
}

@@doc(VmSkuProfiles.putVMSkus::parameters.resource,
  "VM SKUs resource definition"
);
