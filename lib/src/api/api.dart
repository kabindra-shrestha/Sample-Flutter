class APIs {
  APIs();

  static const String _apiBaseUrl = "catfact.ninja";

  Uri catFact() => _buildUri(
        endpoint: "/fact",
        parametersBuilder: () => queryParameters(),
      );

  Uri _buildUri({
    required String endpoint,
    required Map<String, dynamic> Function() parametersBuilder,
  }) {
    return Uri(
      scheme: "https",
      host: _apiBaseUrl,
      path: endpoint,
      queryParameters: parametersBuilder(),
    );
  }

  Map<String, dynamic> queryParameters() => {};
}
