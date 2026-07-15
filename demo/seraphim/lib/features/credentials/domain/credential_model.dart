class VerifiableCredential {
  final String id;
  final List<String> type; // e.g. ['VerifiableCredential', 'DataboxConnectionCredential']
  final String issuer;
  final Map<String, dynamic> credentialSubject;

  VerifiableCredential({
    required this.id,
    required this.type,
    required this.issuer,
    required this.credentialSubject,
  });

  bool get isConnectionCredential => type.contains('DataboxConnectionCredential');
  bool get isAcceptanceReceipt => type.contains('DataboxAcceptanceReceipt');
}
