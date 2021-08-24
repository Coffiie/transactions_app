import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transactions_app/global/utils.dart';
import 'package:transactions_app/transactions/transactions_viewmodel.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionsViewModel>.reactive(
      viewModelBuilder: () => TransactionsViewModel(),
      onModelReady: (m) async => await m.init(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          title: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(3),
            child: TextField(
              onChanged: (String text){
                model.handleSearch(text);
              },
              decoration: InputDecoration(
                hintText: 'Search by transaction type'
              ),
            ),
          ),
        ),
        body: model.isBusy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: model.searchedTransactions.length,
                itemBuilder: (context, i) => Card(
                      elevation: 3,
                      child: ListTile(
                        onTap: () {
                          model.handleTap(context, i);
                        },
                        title: Text(
                            '${model.searchedTransactions[i].currencyCode} ${model.searchedTransactions[i].amount}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.searchedTransactions[i].type,
                            ),
                            Text(Utils.formatDate(model.searchedTransactions[i].date)),
                          ],
                        ),
                      ),
                    )),
      ),
    );
  }
}
