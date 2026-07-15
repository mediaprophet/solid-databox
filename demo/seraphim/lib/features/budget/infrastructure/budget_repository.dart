import 'package:solidpod/solidpod.dart';
import '../domain/budget_model.dart';

class BudgetRepository {
  final String podUri;

  BudgetRepository(this.podUri);

  final List<BudgetItem> _offlineItems = [];

  Future<List<BudgetItem>> getBudgetItems() async {
    final fileUrl = '$podUri/budget/items.ttl';
    try {
      final data = await readPod(fileUrl);
      final remoteItems = <BudgetItem>[];
      
      // POC: Extract unique subjects (IDs) and then their properties
      final idMatches = RegExp(r'<([^>]+)> <').allMatches(data);
      final uniqueIds = idMatches.map((m) => m.group(1)!).toSet();
      
      for (final id in uniqueIds) {
        final escapedId = RegExp.escape(id);
        final nameMatch = RegExp('<$escapedId> <.*hasName> "(.*)" \\.').firstMatch(data);
        final amountMatch = RegExp('<$escapedId> <.*hasAmount> "(.*)" \\.').firstMatch(data);
        final categoryMatch = RegExp('<$escapedId> <.*hasCategory> "(.*)" \\.').firstMatch(data);
        final frequencyMatch = RegExp('<$escapedId> <.*frequency> "(.*)" \\.').firstMatch(data);
        final typeMatch = RegExp('<$escapedId> <.*type> "(.*)" \\.').firstMatch(data);

        if (nameMatch != null && amountMatch != null) {
          remoteItems.add(BudgetItem(
            id: id,
            name: nameMatch.group(1) ?? 'Unknown',
            amount: double.tryParse(amountMatch.group(1) ?? '0') ?? 0.0,
            category: categoryMatch?.group(1) ?? 'Uncategorized',
            frequency: BudgetFrequency.values.firstWhere(
                (e) => e.name == frequencyMatch?.group(1),
                orElse: () => BudgetFrequency.monthly),
            type: BudgetType.values.firstWhere(
                (e) => e.name == typeMatch?.group(1),
                orElse: () => BudgetType.expense),
          ));
        }
      }
      return [..._offlineItems, ...remoteItems];
    } catch (e) {
      return _offlineItems.toList();
    }
  }

  Future<void> saveBudgetItem(BudgetItem item) async {
    final fileUrl = '$podUri/budget/items.ttl';
    // Serialize to RDF using FIBO (Financial Industry Business Ontology)
    final fiboBase = 'https://spec.edmcouncil.org/fibo/ontology/';
    final rdfData = '<${item.id}> <${fiboBase}FND/Relations/Relations/hasName> "${item.name}" .\n'
        '<${item.id}> <${fiboBase}FND/Accounting/CurrencyAmount/hasAmount> "${item.amount}" .\n'
        '<${item.id}> <${fiboBase}FBC/FinancialInstruments/FinancialInstruments/hasCategory> "${item.category}" .\n'
        '<${item.id}> <http://schema.org/frequency> "${item.frequency.name}" .\n'
        '<${item.id}> <http://schema.org/type> "${item.type.name}" .\n';
    
    try {
      // Append to Pod using solidpod
      await writePod(fileUrl, rdfData);
    } catch (e) {
      _offlineItems.add(item);
    }
  }
}
