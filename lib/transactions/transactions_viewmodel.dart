import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transactions_app/models/api/transaction.dart';
import 'package:transactions_app/services/navigation_service.dart';
import 'package:transactions_app/services/transaction_service.dart';
import 'package:transactions_app/services/transactions_controller.dart';

class TransactionsViewModel extends BaseViewModel {
  List<Transaction> _transactions = [];

  List<Transaction> _searchedTransactions = [];
  List<Transaction> get searchedTransactions => _searchedTransactions;
  set searchedTransactions(List<Transaction> val) {
    _searchedTransactions = val;
    notifyListeners();
  }

  Future<void> init() async {
    setBusy(true);
    _transactions = await TransactionsController().getTransactions(Dio());
    searchedTransactions =
        TransactionService().sortByTransactionTime(_transactions);
    setBusy(false);
  }

  void handleTap(BuildContext context, int index) => NavigationService()
      .navigateToTransactionDetailsView(context, _searchedTransactions[index]);

  void handleSearch(String text) {
    searchedTransactions =
        TransactionService().searchByTransactionType(_transactions, text);
  }
}
