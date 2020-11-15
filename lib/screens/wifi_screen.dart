
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';

// import '../components/meal_item.dart';
// import '../models/meal.dart';



// class WifiScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//         final Wifi = ModalRoute.of(context).settings.arguments as WifiScreen;

//     return  Container(
//               height: 70,
//               child: Row(
//                 children: <Widget>[
//                   FlatButton(

//                   child: Text('Checa conexão'),
//                   color: Theme.of(context).primaryColor,
//                   textColor: Theme.of(context).textTheme.button.color,
//                   onPressed: ()=> _checaInternet,  
//                   shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)
//                   ),  

//                   ), 
//                 ],
//               ),
//             );
//   }
// }


// _checaInternet() async {
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
// showDialog(
//   // context: context,
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

// }, context: null);
// }




import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';


class WifiScreen extends StatefulWidget {
  @override
  _WifiScreenState createState() => _WifiScreenState();
}

class _WifiScreenState extends State<WifiScreen> {
  @override
  Widget build(BuildContext context) {
    return Card(
      
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 15, 25, 7),
        child: Column(
          children: <Widget>[

            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  FlatButton(

                  child: Text('Checa conexão'),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  onPressed: ()=> _checaInternet,  
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

_checaInternet() async {
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
showDialog(context: context,
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

});

}

}

