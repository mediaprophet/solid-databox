import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/case_plan_model.dart';
import '../infrastructure/case_plan_repository.dart';
import '../../budget/application/budget_providers.dart'; // To reuse podUriProvider

final casePlanRepositoryProvider = Provider<CasePlanRepository>((ref) {
  final podUri = ref.watch(podUriProvider);
  return CasePlanRepository(podUri);
});

final caseTasksProvider = FutureProvider<List<CaseTask>>((ref) async {
  final repository = ref.watch(casePlanRepositoryProvider);
  return repository.getTasks();
});
