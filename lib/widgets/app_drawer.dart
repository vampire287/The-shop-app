import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/auth_screen.dart';
import '../providers/auth.dart';
import '../screens/user_products_screen.dart';
import '../screens/orders.screen.dart';
import '../helpers/custom_route.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: <Widget>[
      AppBar(
        title: const Text('Hello Friend!'),
        automaticallyImplyLeading: false,
      ),
      ListTile(
        leading: const Icon(Icons.shop),
        title: const Text('Shop'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.payment),
        title: const Text('Orders'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          // Navigator.of(context).pushReplacement(
          //   CustomRoute(
          //     builder: (ctx) => OrdersScreen(),
          //   ),
          // );
        },
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.edit),
        title: const Text('Manage Products'),
        onTap: () {
          Navigator.of(context)
              .pushReplacementNamed(UserProductsScreen.routeName);
        },
      ),
      const Divider(),
      if (ModalRoute.of(context)!.settings.name != '/user-products')
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Logout'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');
            //Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            Provider.of<Auth>(context, listen: false).logout();
          },
        ),
    ]));
  }
}
