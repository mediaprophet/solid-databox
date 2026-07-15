import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/budget_model.dart';
import '../infrastructure/budget_repository.dart';

final podUriProvider = Provider<String>((ref) => 'https://example.pod/'); // Should come from session

final budgetRepositoryProvider = Provider<BudgetRepository>((ref) {
  final podUri = ref.watch(podUriProvider);
  return BudgetRepository(podUri);
});

final budgetItemsProvider = FutureProvider<List<BudgetItem>>((ref) async {
  final repository = ref.watch(budgetRepositoryProvider);
  return repository.getBudgetItems();
});
