import 'package:dio/dio.dart';
import 'package:transactions_app/global/api_constants.dart';
import 'package:transactions_app/models/api/transaction.dart';

class TransactionsController {
  final String _getTransactionsUrl = ApiConstants.baseUrl + 'transactions';

  Future<List<Transaction>> getTransactions(Dio dio) async {
    try {
      final Response response = await dio.get(_getTransactionsUrl);
      List<Transaction> transactions = [];
      for (Map<String, dynamic> data in response.data) {
        transactions.add(Transaction.fromJson(data));
      }
      return transactions;
    } catch (e) {
      print('get transactions error: $e');
      return [];
    }
  }
}
