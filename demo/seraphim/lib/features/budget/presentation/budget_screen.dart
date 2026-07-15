import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solidui/solidui.dart';
import '../domain/budget_model.dart';
import '../application/budget_providers.dart';

class BudgetScreen extends ConsumerWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetItemsAsync = ref.watch(budgetItemsProvider);

    return SolidScaffold(
      body: budgetItemsAsync.when(
        data: (items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.category),
              trailing: Text('\$${item.amount.toStringAsFixed(2)}'),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final item = await showDialog<BudgetItem>(
            context: context,
            builder: (context) => const _AddBudgetDialog(),
          );
          if (item != null) {
            final repo = ref.read(budgetRepositoryProvider);
            await repo.saveBudgetItem(item);
            ref.invalidate(budgetItemsProvider);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AddBudgetDialog extends StatefulWidget {
  const _AddBudgetDialog();
  @override
  State<_AddBudgetDialog> createState() => _AddBudgetDialogState();
}

class _AddBudgetDialogState extends State<_AddBudgetDialog> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Budget Item'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Name')),
            TextField(controller: _amountController, decoration: const InputDecoration(labelText: 'Amount'), keyboardType: TextInputType.number),
            TextField(controller: _categoryController, decoration: const InputDecoration(labelText: 'Category')),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            final name = _nameController.text;
            final amount = double.tryParse(_amountController.text) ?? 0.0;
            final category = _categoryController.text.isEmpty ? 'Uncategorized' : _categoryController.text;
            if (name.isNotEmpty) {
              Navigator.of(context).pop(BudgetItem(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                name: name,
                amount: amount,
                category: category,
              ));
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
