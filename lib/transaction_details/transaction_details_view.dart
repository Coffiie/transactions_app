import 'package:flutter/material.dart';
import 'package:transactions_app/models/api/transaction.dart';

class TransactionDetailsView extends StatelessWidget {
  final Transaction transaction;
  const TransactionDetailsView({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AMOUNT: ${transaction.currencyCode} ${transaction.amount}',),
              Text('IBAN: ${transaction.id}',),
              Text('BIC: ${transaction.bic}'),
              Text('Description: ${transaction.description}')
            ],
          ),
        ),
      ),
    );
  }
}
