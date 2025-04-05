import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizzaria/src/repositories/costumers/costumers_repository.dart';
import 'package:provider/provider.dart';

import 'src/repositories/orders/orders_repository.dart';
import 'src/service/costumers/costumers_interface.dart';
import 'src/service/orders/http/http_service_imp.dart';
import 'src/shared/utils/theme/theme.dart';
import 'src/shared/utils/theme/util.dart';
import 'src/ui/costumers/costumers_page.dart';
import 'src/viewmodel/costumers/costumers_viewmodel.dart';
import 'src/viewmodel/orders/orders_map_viewmodel.dart';
import 'src/viewmodel/orders/orders_viewmodel.dart';

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
          Provider<ICostumersInterface>(create: (_) => CostumersRepository()),
          Provider<HttpServiceDio>(create: (_) => HttpServiceDio()),
          ChangeNotifierProvider<CostumersController>(
            create: (i) => CostumersController(i.read<ICostumersInterface>()),
          ),
          ChangeNotifierProvider<OrdersController>(
            create: (i) => OrdersController(i.read<CostumersController>()),
          ),
          Provider<MapsRepositories>(
              create: (i) => MapsRepositories(i.read<HttpServiceDio>())),
          ChangeNotifierProvider<OrdersMapController>(
            create: (i) => OrdersMapController(i.read<MapsRepositories>()),
          )
        ],
        child: MaterialApp(
          theme: theme.light(),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
          },
        ));
  }
}
