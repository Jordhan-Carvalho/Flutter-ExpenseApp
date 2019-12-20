import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class ListItem extends StatelessWidget {
  final Transaction tx;
  final Function deleteTrans;

  ListItem(this.tx, this.deleteTrans);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${tx.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          '${tx.title}',
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat('yMMMEd', 'pt-BR').format(tx.date),
          style: TextStyle(color: Colors.grey),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                onPressed: () => deleteTrans(
                  tx.id,
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTrans(tx.id),
              ),
      ),
    );
  }
}
