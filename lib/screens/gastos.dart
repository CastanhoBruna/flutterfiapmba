import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';

import '../components/transaction_form.dart';
import '../components/transaction_list.dart';
import '../components/chart.dart';
import '../models/transaction.dart';



// class GastosPage extends StatefulWidget {
//   GastosPage({Key key}) : super(key: key);

//   @override
//   GastosPageState createState() => GastosPageState();
// }


class GastosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        // final gastos = ModalRoute.of(context).settings.arguments as GastosPage;

    // return MaterialApp(
    //   home: MyHomePage(),
    //   theme: ThemeData(
    //     primarySwatch: Colors.orange,
    //     accentColor: Colors.amber,
    //     fontFamily: 'Quicksand',
    //     textTheme: ThemeData.light().textTheme.copyWith(
    //           headline6: TextStyle(
    //             fontFamily: 'OpenSans',
    //             fontSize: 18,
    //             fontWeight: FontWeight.bold,
    //           ),
    //           button: TextStyle(
    //             color: Colors.white,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //     appBarTheme: AppBarTheme(
    //       textTheme: ThemeData.light().textTheme.copyWith(
    //             // ignore: deprecated_member_use
    //             title: TextStyle(
    //               fontFamily: 'OpenSans',
    //               fontSize: 20,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //     ),
    //   ),
    // );

  }
}

class MyCostsPage extends StatefulWidget {
  @override
  _MyCostsPageState createState() => _MyCostsPageState();
}

class _MyCostsPageState extends State<MyCostsPage> {
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
            // TransactionList(_transactions, _removeTransaction),
            TransactionList(_transactions),

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
