import 'package:flutter/material.dart';
import 'package:transactions_app/models/api/transaction.dart';
import 'package:transactions_app/transaction_details/transaction_details_view.dart';

class NavigationService {
  void navigateToTransactionDetailsView(
      BuildContext context, Transaction transaction) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            TransactionDetailsView(transaction: transaction)));
  }
}
