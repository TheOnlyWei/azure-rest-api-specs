// imports to rest,http and versioning should be done outside of this file (csharp emitter issue)
using TypeSpec.Rest;
using TypeSpec.Http;
using TypeSpec.Versioning;

@service({
  title: "Azure AI Health Insights",
})
@versioned(ApiVersion)
@doc("Azure AI Health Insights provides an API that serves insight models, specific for Health & Life Sciences, that perform analysis and provide inferences to be used by a human.")
@server(
  "{endpoint}/health-insights",
  "Azure AI Health Insights provides an API that serves insight models, specific for Health & Life Sciences, that perform analysis and provide inferences to be used by a human.",
  {
    @doc("Supported Cognitive Services endpoints (protocol and hostname, for example: https://westus2.api.cognitive.microsoft.com).")
    endpoint: url,
  }
)
@useAuth(AzureKey)
namespace AzureHealthInsights;

@doc("The secret key for your Azure Cognitive Services subscription.")
model AzureKey
  is ApiKeyAuth<ApiKeyLocation.header, "Ocp-Apim-Subscription-Key">;

enum ApiVersion {
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  v2024_04_01: "2024-04-01",
}
