import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transactions_app/features/transactions/transactions_viewmodel.dart';
import 'package:transactions_app/global/utils.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionsViewModel>.reactive(
      viewModelBuilder: () => TransactionsViewModel(),
      onModelReady: (m) async => await m.init(),
      builder: (context, transactionsViewModel, _) => Scaffold(
        appBar: AppBar(
          title: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(3),
            child: TextField(
              onChanged: (String text) => transactionsViewModel.onSearch(text),
              decoration:
                  InputDecoration(hintText: 'Search by transaction type'),
            ),
          ),
        ),
        body: transactionsViewModel.isBusy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: transactionsViewModel.searchedTransactions.length,
                itemBuilder: (context, i) => Card(
                      elevation: 3,
                      child: ListTile(
                        onTap: () => transactionsViewModel.onTap(context, i),
                        title: Text(
                            '${transactionsViewModel.searchedTransactions[i].currencyCode} ${transactionsViewModel.searchedTransactions[i].amount}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactionsViewModel
                                  .searchedTransactions[i].type,
                            ),
                            Text(Utils.formatDate(transactionsViewModel
                                .searchedTransactions[i].date)),
                          ],
                        ),
                      ),
                    )),
      ),
    );
  }
}
