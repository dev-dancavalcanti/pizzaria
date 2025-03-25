import 'package:flutter/material.dart';
import 'package:pizzaria/src/shared/utils/components/filter_box.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

import '../../../shared/utils/components/alert_box.dart';
import '../controllers/costumers_controller.dart';
import 'costumers_details_page.dart';
import 'costumers_register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation borderAnimation;
  int currentIndex = 0;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    borderAnimation = Tween<double>(begin: 10, end: 0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0, 1)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List listPages = [
      const CostumersPage(),
      const Center(),
      const Center(
          child: Text(
        'Em breve',
        style: TextStyle(fontSize: 30),
      ))
    ];

    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35))),
          child: SafeArea(
              child: Theme(
            data: ThemeData(
              splashColor: Colors.black,
              highlightColor: Colors.black,
            ),
            child: BottomNavigationBar(
              useLegacyColorScheme: false,
              enableFeedback: false,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedIconTheme: const IconThemeData(color: Colors.red),
              elevation: 0,
              backgroundColor: Colors.transparent,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: currentIndex == 0 ? Colors.white : Colors.grey,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Icon(
                        Icons.add,
                        color: currentIndex == 1 ? Colors.white : Colors.grey,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.padding,
                      color: currentIndex == 2 ? Colors.white : Colors.grey,
                    ),
                    label: '')
              ],
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  if (value == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CostumersSignUp()));
                    Future.delayed(const Duration(seconds: 2), () {
                      currentIndex = 0;
                    });
                  } else {
                    currentIndex = value;
                  }
                });
              },
            ),
          )),
        ),
        body: listPages[currentIndex]);
  }
}

class CostumersPage extends StatefulWidget {
  const CostumersPage({super.key});

  @override
  State<CostumersPage> createState() => _CostumersPageState();
}

class _CostumersPageState extends State<CostumersPage> {
  @override
  Widget build(BuildContext context) {
    final CostumersController controller = context.watch<CostumersController>();
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: controller,
        builder: (context, child) {
          if (controller.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 55,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/icon.svg',
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Image.asset('assets/image/pizzaria-.png'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SearchBar(
                    hintText: 'Nome ou celular',
                    leading: const Icon(Icons.search),
                    trailing: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return FilterBox(
                                  controller: controller,
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.filter_alt_outlined))
                    ],
                    onChanged: (value) {
                      controller.searchCostumer(text: value);
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                  child: Text(
                    "Clientes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
                controller.listCostumers!.costumer.isEmpty
                    ? const Flexible(
                        child: Center(
                          child: Text('Cliente nao encontrado!'),
                        ),
                      )
                    : Flexible(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount:
                                controller.listCostumers!.costumer.length,
                            itemBuilder: (context, i) {
                              return Dismissible(
                                direction: DismissDirection.endToStart,
                                confirmDismiss: (direction) {
                                  return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertBox(
                                          i: i,
                                          controller: controller,
                                          name: controller.listCostumers!
                                              .costumer[i].name!);
                                    },
                                  );
                                },
                                behavior: HitTestBehavior.translucent,
                                background: const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.delete),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                                key: ValueKey(
                                    controller.listCostumers!.costumer[i]),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConstumersDetails(index: i)));
                                  },
                                  onLongPress: () {},
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 10, right: 10),
                                          child: Card(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .listCostumers!
                                                            .costumer[i]
                                                            .name!,
                                                        style: const TextStyle(
                                                          fontSize: 28,
                                                          fontFamily:
                                                              'Urbanist',
                                                        ),
                                                      ),
                                                      Text(
                                                        '# ${controller.listCostumers!.costumer[i].id}',
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'Urbanist'),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: Text(
                                                    controller.listCostumers!
                                                        .costumer[i].adress!,
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, bottom: 8),
                                                  child: Text(
                                                    controller
                                                        .listCostumers!
                                                        .costumer[i]
                                                        .phoneNumber!,
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
              ],
            );
          }
        },
      ),
    );
  }
}
