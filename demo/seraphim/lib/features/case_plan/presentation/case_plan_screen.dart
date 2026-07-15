import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solidui/solidui.dart';
import '../application/case_plan_providers.dart';

class CasePlanScreen extends ConsumerWidget {
  const CasePlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(caseTasksProvider);

    return SolidScaffold(
      body: tasksAsync.when(
        data: (tasks) => ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return CheckboxListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              value: task.isCompleted,
              onChanged: (bool? value) {
                // Handle status change
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
