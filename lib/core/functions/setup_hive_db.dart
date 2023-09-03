import 'package:bookly/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bookly/core/entities/book_entity.dart';

Future<void> setupHiveDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  Future.wait([
    Hive.openBox<BookEntity>(kFeaturedBox),
    Hive.openBox<BookEntity>(kNewestBox),
    Hive.openBox<BookEntity>(kSimilarBox),
  ]);
}
