import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:transactions_app/models/api/transaction.dart';
import 'package:transactions_app/services/transactions_api.dart';

class FakeDio extends Fake implements Dio {
  final dynamic testResponse = [
    {
      "date": "2021-07-05T00:34:29.993Z",
      "amount": "209.78",
      "type": "withdrawal",
      "currencyCode": "XBD",
      "iban": "IE53624A00844716683079",
      "description":
          "payment transaction at Hilpert, Emard and Denesik using card ending with ***9524 for JPY 324.08 in account ***83781284",
      "bic": "JBFEMWP1745",
      "id": "1"
    },
    {
      "date": "2021-07-05T00:38:33.099Z",
      "amount": "788.00",
      "type": "withdrawal",
      "currencyCode": "SEK",
      "iban": "PL61037295780360030002103092",
      "description":
          "invoice transaction at Bergstrom Group using card ending with ***7647 for SZL 71.96 in account ***79042495",
      "bic": "KTZOQAR1",
      "id": "2"
    },
  ];
  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    return Future.value(Response<T>(
        data: testResponse, requestOptions: RequestOptions(path: '')));
  }
}

main() {
  group('Transactions Api should - ', () {
    final TransactionsApi transactionsApi = TransactionsApi();
    final FakeDio fakeDio = FakeDio();
    test('get transactions', () async {
      List<Transaction> transactions =
          await transactionsApi.getTransactions(fakeDio);
      expect(transactions.first.id == '1', true);
      expect(transactions.length, 2);
    });
  });
}
