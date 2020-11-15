import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import '../components/transaction_user.dart';
import '../components/transaction_form.dart';
import '../components/transaction_list.dart';
import '../components/chart.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class CostsDetailScreen extends StatefulWidget {

   @override
  _CostsDetailScreenState createState() => _CostsDetailScreenState();

  // @override
  // Widget build(BuildContext context) {

  //   final costs = ModalRoute.of(context).settings.arguments;
  
  //      final _transactions = [
  //     Transaction(
  //       id: "t1",
  //       title: "nova compra",
  //       value: 205.23,
  //       date: DateTime.now(),
  //        ),
  //    ];

  //   return Scaffold(
  //     body: SingleChildScrollView(
  //             child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: <Widget>[
  //         Container(
  //           width: double.infinity,
  //           child: Card(
  //             color: Colors.blueGrey,
  //             child: Text("Gráfico"),
  //             elevation: 5,
  //           ),
  //         ),
  //             // TransactionList(_transactions, _removeTransaction),
              
  //           ],
  //         ),
  //       ),
  //     ) ;   
    
  // }

}

// abstract class CostsDetail implements StatefulWidget {
//   @override
//   _CostsDetailScreenState createState() => _CostsDetailScreenState();
// }

class _CostsDetailScreenState extends State<CostsDetailScreen> {
 
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
            TransactionList(_transactions, _removeTransaction),
            // TransactionList(_transactions, _removeTransaction),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // onPressed: () {},
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}






