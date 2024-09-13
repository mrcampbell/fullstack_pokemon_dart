import 'package:logger/logger.dart';
import 'package:postgres/postgres.dart';

class Context {
  final Connection db;
  final Logger logger;

  Context(this.db, this.logger);
}