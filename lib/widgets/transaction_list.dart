import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transactionContainer.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionContainer(userTransactions[index]);
        },
        itemCount: userTransactions.length,
      ),
    );
  }
}
