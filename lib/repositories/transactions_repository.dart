import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:transactions_app/models/api/transaction.dart';
import 'package:transactions_app/services/transactions_api.dart';

class TransactionsRepository {
  //Repositories are single source of truth, no viewmodel should call any api, but always ask / insert data in repositories.
  List<Transaction> transactions = [];

  Future<List<Transaction>> getTransactions() async {
    try {
      List<Transaction> _transactions =
          await TransactionsApi().getTransactions(Dio());
      if (_transactions.isEmpty) {
        return transactions;
      } else {
        transactions = _transactions;
        return transactions;
      }
    } on PlatformException catch (ex) {
      //throw the exception to viewmodel and previous transactions so user can see the cached data
      throw PlatformException(
          code: ex.code, message: ex.message, details: transactions);
    }
  }
}
