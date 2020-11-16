import 'package:flutter/material.dart';
import 'package:flutterprojectfiap/utils/app_routes.dart';
import '../models/meal.dart';
import 'maps_screen.dart';


import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';



class WifiScreen extends StatelessWidget {

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Clique no botão para testar se está conectado a uma rede. '
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 330,
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Testar Conectividade'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 10,
              // width: double.infinity,
             
            ),

            _createSectionTitle(context, 'Testar'),

            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  FlatButton(

                  child: Text('Testar'),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  onPressed: () { 
                    checaInternet();
                    },  
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)
                  ),  

                  ), 
                ],
              ),
            ),
                
          ],
        ),
      ),

    );
  }

checaInternet() async {
  var result = await Connectivity().checkConnectivity();

  if(result == ConnectivityResult.none){
_exibirDialog(
  'Sem internet',
  'Conecte o seu celular a uma rede'
  ); 
  }else if (result == ConnectivityResult.mobile){
_exibirDialog(
  'Com internet',
  'Você está conectado a rede do celular'
  ); 

  }else if (result == ConnectivityResult.wifi){
    
_exibirDialog(
  'Com internet',
  'Você está conectado a uma rede Wi-fi'
  ); 
  }


}

_exibirDialog(title, text){

showDialog(
builder: (context){
return AlertDialog(
  title: Text(title),
  content: Text(text),
  actions: <Widget>[
    FlatButton(
      child: Text('Ok'), 
      onPressed: () {
        Navigator.of(context).pop();
      },
      ),

],
);

}, context: null);

}




showAlertDialog1(BuildContext context) 
{ 
    // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Teste se seu device está conectado a internet"),
    content: Text("Não perca a promoção."),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}


}








// class WifiScreen extends StatefulWidget {
//   @override
//   _WifiScreenState createState() => _WifiScreenState();
// }

// class _WifiScreenState extends State<WifiScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
      
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(25, 15, 25, 7),
//         child: Column(
//           children: <Widget>[

//             Container(
//               height: 70,
//               child: Row(
//                 children: <Widget>[
//                   FlatButton(

//                   child: Text('Checa conexão'),
//                   color: Theme.of(context).primaryColor,
//                   textColor: Theme.of(context).textTheme.button.color,
//                   onPressed: () { 
//                     checaInternet();
//                     },  
//                   // onPressed: ()=> checaInternet,  
//                   shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)
//                   ),  

//                   ), 
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
   
//   }

// checaInternet() async {
//   var result = await Connectivity().checkConnectivity();

//   if(result == ConnectivityResult.none){
// _exibirDialog(
//   'Sem internet',
//   'Conecte o seu celular a uma rede'
//   ); 
//   }else if (result == ConnectivityResult.mobile){
// _exibirDialog(
//   'Com internet',
//   'Você está conectado a rede do celular'
//   ); 

//   }else if (result == ConnectivityResult.wifi){
    
// _exibirDialog(
//   'Com internet',
//   'Você está conectado a uma rede Wi-fi'
//   ); 
    
//   }


// }

// _exibirDialog(title, text){
// showDialog(context: context,
// builder: (context){
// return AlertDialog(
//   title: Text(title),
//   content: Text(text),
//   actions: <Widget>[
//     FlatButton(
//       child: Text('Ok'), 
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//       ),

// ],
// );

// });

// }




// showAlertDialog1(BuildContext context) 
// { 
//     // configura o button
//   Widget okButton = FlatButton(
//     child: Text("OK"),
//     onPressed: () { },
//   );
//   // configura o  AlertDialog
//   AlertDialog alerta = AlertDialog(
//     title: Text("Teste se seu device está conectado a internet"),
//     content: Text("Não perca a promoção."),
//     actions: [
//       okButton,
//     ],
//   );
//   // exibe o dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alerta;
//     },
//   );
// }







// }

