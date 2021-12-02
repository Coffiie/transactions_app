import 'package:flutter_test/flutter_test.dart';
import 'package:transactions_app/global/utils.dart';

main() {
  group('Utils should - ', () {
    test('Format DateTime to dd-mm-yyyy format', () {
      String testDate = '2021-07-05T00:38:33.099Z';
      expect(Utils.formatDate(testDate), '05-07-2021');
    });

    test('Format DateTime', () {
      String testDate = '2021-07-05T00:38:33.099Z';
      DateTime dt = Utils.toDateTime(testDate);
      expect(dt.day, 5);
      expect(dt.second, 33);
      expect(dt.year, 2021);
    });
  });
}
