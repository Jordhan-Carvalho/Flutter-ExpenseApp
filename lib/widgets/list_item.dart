import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class ListItem extends StatefulWidget {
  final Transaction tx;
  final Function deleteTrans;

  ListItem({Key key, @required this.tx, @required this.deleteTrans})
      : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  Color _bgColors;

  @override
  void initState() {
    const avaColors = [
      Colors.red,
      Colors.black,
      Colors.purple,
      Colors.blue,
      Colors.grey,
      Colors.lightBlue,
      Colors.pink,
    ];

    _bgColors = avaColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColors,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${widget.tx.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          '${widget.tx.title}',
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat('yMMMEd', 'pt-BR').format(widget.tx.date),
          style: TextStyle(color: Colors.grey),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                onPressed: () => widget.deleteTrans(
                  widget.tx.id,
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTrans(widget.tx.id),
              ),
      ),
    );
  }
}
