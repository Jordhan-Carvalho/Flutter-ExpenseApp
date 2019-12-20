import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './list_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    print('build() Transaction List');
    return Container(
      // height: MediaQuery.of(context).size.height * 0.6,
      child: userTransactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No transactions added yet!',
                      style: Theme.of(context).textTheme.title,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // return TransactionContainer(userTransactions[index]); *SelfMade container
                return ListItem(userTransactions[index], deleteTransaction);
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
