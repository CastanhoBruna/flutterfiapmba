import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 160,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.bottomRight,
            child: Text(
              'Escape Trapp __'
              'Bora escolher sua próxima aventura ? ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 23,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          _createItem(
            Icons.landscape,
            'Explorar',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
          _createItem(
            Icons.wifi,
            'Testar Conectividade',
            () => Navigator.of(context).pushNamed(AppRoutes.WIFI),
          ),
          _createItem(
            Icons.local_fire_department,
            'Testar conexão Firebase',
            () => Navigator.of(context).pushNamed(AppRoutes.FIREBASE),
          ),
          // _createItem(
          //   Icons.contact_mail,
          //   'Testar Push notification Firebase',
          //   () => Navigator.of(context).pushNamed(AppRoutes.PUSH),
          // ),
          // _createItem(
          //   Icons.account_balance_wallet,
          //   'Gastos da Viagem',
          //   () => Navigator.of(context).pushReplacementNamed(AppRoutes.GASTOSPAGE),
          // ),
        ],
      ),
    );
  }
}
