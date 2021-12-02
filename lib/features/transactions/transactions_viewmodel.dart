import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:transactions_app/features/transactions/transaction_details/transaction_details_view.dart';
import 'package:transactions_app/models/api/transaction.dart';
import 'package:transactions_app/repositories/transactions_repository.dart';
import 'package:transactions_app/services/transaction_service.dart';

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
    _transactions = await TransactionsRepository().getTransactions();
    searchedTransactions =
        TransactionService().sortByTransactionTime(_transactions);
    setBusy(false);
  }

  void onTap(BuildContext context, int index) => Get.to(
      () => TransactionDetailsView(transaction: _searchedTransactions[index]));

  void onSearch(String text) {
    searchedTransactions =
        TransactionService().searchByTransactionType(_transactions, text);
  }
}
