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
 * The provisioned cluster resource definition.
 */
@singleton("default")
model ProvisionedCluster is ExtensionResource<ProvisionedClusterProperties> {
  @key("provisionedClusterInstance")
  @segment("provisionedClusterInstances")
  @visibility("read")
  name: string;

  /**
   * Extended location pointing to the underlying infrastructure
   */
  extendedLocation?: ExtendedLocation;
}

@armResourceOperations
interface ProvisionedClusters {
  /**
   * Gets the provisioned cluster instance
   */
  get is ArmResourceRead<ProvisionedCluster>;

  /**
   * Creates or updates the provisioned cluster instance
   */
  createOrUpdate is ArmResourceCreateOrReplaceAsync<ProvisionedCluster>;

  /**
   * Deletes the provisioned cluster instance
   */
  delete is ArmResourceDeleteWithoutOkAsync<ProvisionedCluster>;

  /**
   * Lists the ProvisionedClusterInstance resource associated with the ConnectedCluster
   */
  list is ArmResourceListByParent<ProvisionedCluster>;

  /**
   * Lists the user credentials of the provisioned cluster (can only be used within private network)
   */
  listUserKubeconfig is ArmResourceActionAsync<
    ProvisionedCluster,
    void,
    ListCredentialResponse
  >;

  /**
   * Lists the admin credentials of the provisioned cluster (can only be used within private network)
   */
  listAdminKubeconfig is ArmResourceActionAsync<
    ProvisionedCluster,
    void,
    ListCredentialResponse
  >;
}

@@doc(ProvisionedClusters.createOrUpdate::parameters.resource,
  "Provisioned Cluster resource definition"
);
