import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/app_routes.dart';


class TransactionForm extends StatefulWidget {

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
    final titleController = TextEditingController();

    final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    // if (title.isEmpty || value <= 0 || selectedDate == null) {
    if (title.isEmpty || value <= 0 ) {
      return;
    }
    
    widget.onSubmit(title, value); 

    // widget.onSubmit(title, value, selectedDate);
    // widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 15, 25, 7),
        child: Column(
          children: <Widget>[

           Text(                 
             'Cadastrar gasto da Viagem',
              style: Theme.of(context).textTheme.headline6,
           ),
           
           SizedBox(height: 7),

             TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Gasto',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  // Expanded(
                  //   child: Text(
                  //     selectedDate == null
                  //         ? 'Nenhuma data selecionada!'
                  //         : 'Data pré-selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}',
                  //   ),
                  // ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // onPressed: _showDatePicker,
                  )
                ],
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Novo gasto'),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  // onPressed: _submitForm,
                  onPressed: _submitForm,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)
                  )

                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
