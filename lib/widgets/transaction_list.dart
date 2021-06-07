import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList(this.transactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      child: transactions.isEmpty
          ? Column(children: <Widget>[
              Text('No transaction added yet!',
                  style: Theme.of(context).textTheme.title),
              SizedBox(height: 20),
              Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover))
            ])
          : ListView.builder(
              itemBuilder: (ctx, index) {
                var tx = transactions[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(child: Text('\$${tx.amount}')),
                      ),
                    ),
                    title: Text(
                      tx.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(DateFormat.yMMMd().format(tx.date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor, 
                      onPressed: () { removeTransaction(tx.id); },
                    ),
                  ),
                );
                // return Card(
                //     child: Row(
                //   children: <Widget>[
                //     Container(
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //             border: Border.all(color: Colors.purple, width: 2),
                //             color: Theme.of(context).primaryColor),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           '\$${tx.amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 20),
                //         )),
                //     Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(tx.title,
                //               style: Theme.of(context).textTheme.title),
                //           Text(DateFormat.yMMMd().format(tx.date),
                //               style:
                //                   TextStyle(color: Colors.grey, fontSize: 12))
                //         ])
                //   ],
                // ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
