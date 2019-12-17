import 'package:flutter/foundation.dart';
// used to add require

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
