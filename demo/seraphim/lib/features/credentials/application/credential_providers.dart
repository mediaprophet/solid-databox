import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/credential_model.dart';
import '../infrastructure/credential_repository.dart';
import '../../budget/application/budget_providers.dart'; // Reuse podUriProvider

final credentialRepositoryProvider = Provider<CredentialRepository>((ref) {
  final podUri = ref.watch(podUriProvider);
  return CredentialRepository(podUri);
});

final credentialsProvider = FutureProvider<List<VerifiableCredential>>((ref) async {
  final repository = ref.watch(credentialRepositoryProvider);
  return repository.getCredentials();
});
