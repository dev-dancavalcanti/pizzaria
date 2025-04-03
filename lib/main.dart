import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizzaria/src/features/orders/controllers/orders_controller.dart';
import 'package:pizzaria/src/features/orders/controllers/orders_map_controller.dart';
import 'package:pizzaria/src/features/orders/screens/order_detail_page.dart';
import 'package:pizzaria/src/features/orders/services/http/http_service.dart';
import 'package:pizzaria/src/shared/utils/theme/theme.dart';
import 'package:pizzaria/src/shared/utils/theme/util.dart';
import 'package:provider/provider.dart';

import 'src/features/costumers/controllers/costumers_controller.dart';
import 'src/shared/repositories/shared_repositories.dart';
import 'src/shared/services/costumers_interface.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Urbanist", "Urbanist");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiProvider(
        providers: [
          Provider<ICostumersInterface>(create: (_) => SharedRepositories()),
          ChangeNotifierProvider<CostumersController>(
            create: (i) => CostumersController(i.read<ICostumersInterface>()),
          ),
          ChangeNotifierProvider<OrdersController>(
            create: (ii) => OrdersController(ii.read<CostumersController>()),
          ),
          ChangeNotifierProvider<OrdersMapController>(
            create: (iii) => OrdersMapController(iii.read<HttpService>()),
          )
        ],
        child: MaterialApp(
          theme: theme.light(),
          initialRoute: '/',
          routes: {
            '/': (context) => const OrderDetailPage(),
          },
        ));
  }
}
