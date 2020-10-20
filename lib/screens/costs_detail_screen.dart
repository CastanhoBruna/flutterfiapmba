import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';

import '../components/transaction_form.dart';
import '../components/transaction_list.dart';
import '../components/chart.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class CostsDetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final titleController = TextEditingController();
    final valueController = TextEditingController();



    final costs = ModalRoute.of(context).settings.arguments;

    final _transactions = [
      Transaction(
        id: "t1",
        title: "nova compra",
        value: 205.23,
        date: DateTime.now(),
         ),
      Transaction(
        id: "t2",
        title: "nova compra2",
        value: 225.23,
        date: DateTime.now(),
         ),

    ]; 
    
    return Scaffold(
      appBar: AppBar(
        title: Text(costs),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            color: Colors.blueGrey,
            child: Text("Gráfico"),
            elevation: 5,
          ),
        ),
        TransactionList(_transactions), 
        // TransactionForm(),
        // Column(
        //   children: _transactions.map((tr) {
        //     return Card(
        //       child: Row(
        //         children: <Widget>[
        //           Container(
        //             margin: EdgeInsets.symmetric(
        //               horizontal: 15,
        //               vertical: 10
        //             ),
        //             decoration: BoxDecoration(
        //               border: Border.all(
        //                 color: Colors.blueGrey,
        //                 width: 2,
        //               )
        //             ),
        //             padding: EdgeInsets.all(10),
        //             child: Text(
        //               "R\$ ${tr.value.toStringAsFixed(2)}",
        //               style: TextStyle(
        //                 fontSize: 20,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.blueGrey[800],
        //               ),
        //               ),
        //               ),
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: <Widget>[
        //               Text(tr.title,
        //               style: TextStyle(
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.bold
        //               ),),
        //               Text(
        //                 DateFormat('d MMM y').format(tr.date), 
        //               style: TextStyle(
        //                 color: Colors.grey[700],
        //               ),
        //               )
        //             ],
        //           )
                
        //       ],
        //   )
        //   );
        //   }).toList(),
        // ),
        Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                controller: titleController,
                  decoration: InputDecoration(
                    labelText: "Título"
                    )
                ),
                TextField(
                  controller: valueController,
                  decoration: InputDecoration(
                    labelText: "Valor (R\$)"
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(onPressed: () {}, 
                    child: Text("Nova transação"),
                    textColor: Colors.blueGrey[800],
                    ),
                  ],
                )
              ],
              
            ),
          )
        )

      ],)
      
    
    );
  }

}

abstract class CostsDetail implements StatefulWidget {
  @override
  _CostsDetailScreenState createState() => _CostsDetailScreenState();
}

class _CostsDetailScreenState extends State<CostsDetail> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
         
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_transactions),
            // TransactionList(_transactions, _removeTransaction),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}






