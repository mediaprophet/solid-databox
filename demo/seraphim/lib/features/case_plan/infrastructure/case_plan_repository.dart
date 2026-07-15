import 'package:solidpod/solidpod.dart';
import '../domain/case_plan_model.dart';

class CasePlanRepository {
  final String podUri;

  CasePlanRepository(this.podUri);

  Future<List<CaseTask>> getTasks() async {
    final fileUrl = '$podUri/case_plan/tasks.ttl';
    try {
      final data = await readPod(fileUrl);
      // POC: Extract specific Schema.org paths directly from the fetched TTL graph string
      final nameMatch = RegExp(r'<([^>]+)> <.*name> "(.*)" \.').firstMatch(data);
      final descMatch = RegExp(r'<([^>]+)> <.*description> "(.*)" \.').firstMatch(data);
      final statusMatch = RegExp(r'<([^>]+)> <.*actionStatus> "(.*)" \.').firstMatch(data);

      if (nameMatch != null) {
        return [
          CaseTask(
            id: nameMatch.group(1) ?? '1',
            title: nameMatch.group(2) ?? 'Task',
            description: descMatch?.group(2) ?? '',
            isCompleted: statusMatch?.group(2) == 'CompletedActionStatus',
          )
        ];
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<void> saveTask(CaseTask task) async {
    final fileUrl = '$podUri/case_plan/tasks.ttl';
    final rdfData = '<${task.id}> <http://schema.org/name> "${task.title}" .\n'
        '<${task.id}> <http://schema.org/description> "${task.description}" .\n'
        '<${task.id}> <http://schema.org/actionStatus> "${task.isCompleted ? 'CompletedActionStatus' : 'PotentialActionStatus'}" .\n';
    await writePod(fileUrl, rdfData);
  }
}
