import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:transactions_app/global/api_constants.dart';
import 'package:transactions_app/models/api/transaction.dart';

class TransactionsApi {
  final String _getTransactionsUrl = ApiConstants.baseUrl + 'transactions';

  Future<List<Transaction>> getTransactions(Dio dio) async {
    try {
      final Response response = await dio.get(_getTransactionsUrl);
      List<Transaction> transactions = [];
      for (Map<String, dynamic> data in response.data) {
        transactions.add(Transaction.fromJson(data));
      }
      return transactions;
    } on PlatformException catch (e) {
      if (e.code == 'socket_exception') {
        //throw socket exception code to repo
        throw PlatformException(code: 'SK_001');
      } else {
        log('[TransactionsApi - getTransactions | Unhandled Platform Exception] ${e.toString()}');
        //throw unhandled platform exception code to repo
        throw PlatformException(code: 'PE_001');
      }
    } catch (e) {
      log('[TransactionsApi - getTransactions | Unhandled Transactions Error] $e');
      //throw unhandled exception to repo
      throw PlatformException(code: 'E_001');
    }
  }
}
