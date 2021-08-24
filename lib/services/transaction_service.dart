import 'package:transactions_app/global/utils.dart';
import 'package:transactions_app/models/api/transaction.dart';

class TransactionService {
  List<Transaction> searchByTransactionType(
          List<Transaction> transactions, String text) =>
      transactions.where((e) => e.type.contains(text)).toList();

  List<Transaction> sortByTransactionTime(
      List<Transaction> transactions) {
    transactions.sort(
        (a, b) => Utils.formatDate(a.date).compareTo(Utils.formatDate(b.date)));
    return transactions;
  }
}
