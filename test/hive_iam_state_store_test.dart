import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:remote_in_app_messaging/remote_in_app_messaging.dart';

void main() {
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('iam_hive_test_');
    Hive.init(tempDir.path);
  });

  tearDown(() async {
    await Hive.close();
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  test('logs error and returns null on corrupted entry', () async {
    final box = await Hive.openBox<dynamic>('iam_corrupt_test');
    // Inject a value the JSON deserializer cannot consume.
    await box.put('m1', <String, dynamic>{
      'impressions': 'not-an-int',
      'dismissed': 'nope',
      'ctaClicked': 'maybe',
    });

    final errors = <Object>[];
    final store = HiveIamStateStore(
      box,
      logError: (error, [stackTrace, context]) => errors.add(error),
    );

    final read = store.read('m1');
    expect(read, isNull);
    expect(errors, isNotEmpty);
  });
}
