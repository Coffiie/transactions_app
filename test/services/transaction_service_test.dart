import 'package:flutter_test/flutter_test.dart';
import 'package:transactions_app/models/api/transaction.dart';
import 'package:transactions_app/services/transaction_service.dart';

main() {
  group('Transaction Service should - ', () {
    TransactionService transactionService = TransactionService();
    final Transaction firstTestItem =  Transaction(
          id: '1',
          currencyCode: 'XBC',
          date: '2021-07-05T00:38:33.099Z',
          amount: '405.42',
          bic: 'bic',
          iban: 'iban',
          description: 'description',
          type: 'withdrawal');
    final Transaction secondTestItem = Transaction(
          id: '2',
          currencyCode: 'XBC',
          date: '2021-07-04T00:38:33.099Z',
          amount: '405.42',
          bic: 'bic',
          iban: 'iban',
          description: 'description',
          type: 'deposit');
    final List<Transaction> testList = [
      firstTestItem,
      secondTestItem
    ];
    test('search transactions by transaction type', () {
      final List<Transaction> returnedList = transactionService.searchByTransactionType(testList, 'w');
      expect(returnedList.first.id == '1',true);
      expect(returnedList.length, 1);
    });

    test('search transactions by transaction type 2', () {
      final List<Transaction> returnedList = transactionService.searchByTransactionType(testList, 'de');
      expect(returnedList.first.id == '2',true);
      expect(returnedList.length, 1);
    });

    test('search transactions by transaction type 3', () {
      final List<Transaction> returnedList = transactionService.searchByTransactionType(testList, '');
      expect(returnedList.first.id == '1',true);
      expect(returnedList.length, 2);
    });

    test('sort transactions by transaction time', (){
      final List<Transaction> returnedList = transactionService.sortByTransactionTime(testList);
      expect(returnedList.first.id == '2', true);
      expect(returnedList.last.id=='1', true);
    });
  });
}
