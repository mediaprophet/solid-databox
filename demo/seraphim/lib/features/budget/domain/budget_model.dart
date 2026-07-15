enum BudgetFrequency {
  daily,
  weekly,
  fortnightly,
  monthly,
  quarterly,
  semiAnnually,
  yearly,
}

enum BudgetType {
  income,
  expense,
}

class BudgetItem {
  final String id;
  final String name;
  final double amount;
  final String category;
  final BudgetFrequency frequency;
  final BudgetType type;

  BudgetItem({
    required this.id,
    required this.name,
    required this.amount,
    required this.category,
    required this.frequency,
    required this.type,
  });
}
