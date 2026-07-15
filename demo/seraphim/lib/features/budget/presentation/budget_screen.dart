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
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No budget items yet. Add one!'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final isIncome = item.type == BudgetType.income;
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: isIncome ? Colors.green.shade100 : Colors.red.shade100,
                  child: Icon(
                    isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                    color: isIncome ? Colors.green : Colors.red,
                  ),
                ),
                title: Text(item.name),
                subtitle: Text('${item.category} • ${item.frequency.name}'),
                trailing: Text(
                  '${isIncome ? '+' : '-'}\$${item.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: isIncome ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
        },
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
  
  BudgetType _selectedType = BudgetType.expense;
  BudgetFrequency _selectedFrequency = BudgetFrequency.monthly;
  String? _selectedCategory;

  final Map<BudgetType, List<String>> _categories = {
    BudgetType.income: ['Salary', 'Freelance', 'Investments', 'Government Support', 'Other'],
    BudgetType.expense: ['Housing', 'Utilities', 'Groceries', 'Transport', 'Health', 'Entertainment', 'Insurance', 'Debt', 'Other'],
  };

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentCategories = _categories[_selectedType]!;
    if (_selectedCategory == null || !currentCategories.contains(_selectedCategory)) {
      _selectedCategory = currentCategories.first;
    }

    return AlertDialog(
      title: const Text('Add Budget Item'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<BudgetType>(
              value: _selectedType,
              decoration: const InputDecoration(labelText: 'Type'),
              items: BudgetType.values.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type.name.toUpperCase()),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) {
                  setState(() => _selectedType = val);
                }
              },
            ),
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Name/Description')),
            TextField(controller: _amountController, decoration: const InputDecoration(labelText: 'Amount'), keyboardType: TextInputType.number),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: const InputDecoration(labelText: 'Category'),
              items: currentCategories.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
              onChanged: (val) => setState(() => _selectedCategory = val),
            ),
            DropdownButtonFormField<BudgetFrequency>(
              value: _selectedFrequency,
              decoration: const InputDecoration(labelText: 'Frequency'),
              items: BudgetFrequency.values.map((freq) {
                return DropdownMenuItem(
                  value: freq,
                  child: Text(freq.name),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) {
                  setState(() => _selectedFrequency = val);
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            final name = _nameController.text;
            final amount = double.tryParse(_amountController.text) ?? 0.0;
            if (name.isNotEmpty) {
              Navigator.of(context).pop(BudgetItem(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                name: name,
                amount: amount,
                category: _selectedCategory!,
                frequency: _selectedFrequency,
                type: _selectedType,
              ));
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
