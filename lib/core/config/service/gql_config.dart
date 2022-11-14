///Define all [API] configurations.
class GQLConfig {
  GQLConfig(
    this.baseUrl, {
    this.bearerToken,
  });

  final String baseUrl;
  final TokenCallback? bearerToken;
}

typedef TokenCallback = Future<String> Function();
