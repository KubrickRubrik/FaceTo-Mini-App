/// For data required for a request to the server
final class ClientModel {
  final int idApp;
  final String? publicKey;
  final String language;

  ClientModel({
    required this.idApp,
    required this.publicKey,
    required this.language,
  });
}
