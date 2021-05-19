import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/view_models/orders_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/widgets/drawer.dart';
import 'package:share_a_book/ui/widgets/order_list_view.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  OrdersViewModel ordersViewModel = serviceLocator<OrdersViewModel>();
  @override
  void initState() {
    ordersViewModel.getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrdersViewModel>(
        create: (context) => ordersViewModel,
        child: Consumer<OrdersViewModel>(
            builder: (context, model, child) => Scaffold(
                drawer: DrawerWidget(),
                backgroundColor: Constants.SECONDARY_BLUE,
                appBar: AppBar(
                  title: Text(
                    "Orders",
                    style: Constants.AppBarText,
                  ),
                  centerTitle: true,
                  backgroundColor: Constants.PRIMARY_BLUE,
                ),
                body: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Center(
                      child: Column(children: <Widget>[
                        SizedBox(height: 24),
                        OrderListView(orders: ordersViewModel.orders)
                      ]),
                    )) // This trailing comma makes auto-formatting nicer for build methods.
                )));
  }
}
