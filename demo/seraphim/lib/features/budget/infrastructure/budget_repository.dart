import 'package:solidpod/solidpod.dart';
import '../domain/budget_model.dart';

class BudgetRepository {
  final String podUri;

  BudgetRepository(this.podUri);

  Future<List<BudgetItem>> getBudgetItems() async {
    final fileUrl = '$podUri/budget/items.ttl';
    try {
      final data = await readPod(fileUrl);
      // POC: Extract specific FIBO paths directly from the fetched TTL graph string
      final nameMatch = RegExp(r'<([^>]+)> <.*hasName> "(.*)" \.').firstMatch(data);
      final amountMatch = RegExp(r'<([^>]+)> <.*hasAmount> "(.*)" \.').firstMatch(data);
      final categoryMatch = RegExp(r'<([^>]+)> <.*hasCategory> "(.*)" \.').firstMatch(data);
      
      if (nameMatch != null && amountMatch != null) {
        return [
          BudgetItem(
            id: nameMatch.group(1) ?? '1',
            name: nameMatch.group(2) ?? 'Unknown',
            amount: double.tryParse(amountMatch.group(2) ?? '0') ?? 0.0,
            category: categoryMatch?.group(2) ?? 'Uncategorized',
          )
        ];
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<void> saveBudgetItem(BudgetItem item) async {
    final fileUrl = '$podUri/budget/items.ttl';
    // Serialize to RDF using FIBO (Financial Industry Business Ontology)
    final fiboBase = 'https://spec.edmcouncil.org/fibo/ontology/';
    final rdfData = '<${item.id}> <${fiboBase}FND/Relations/Relations/hasName> "${item.name}" .\n'
        '<${item.id}> <${fiboBase}FND/Accounting/CurrencyAmount/hasAmount> "${item.amount}" .\n'
        '<${item.id}> <${fiboBase}FBC/FinancialInstruments/FinancialInstruments/hasCategory> "${item.category}" .\n';
    
    // Append to Pod using solidpod
    await writePod(fileUrl, rdfData);
  }
}
