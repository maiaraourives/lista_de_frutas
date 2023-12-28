// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/list_fruit.dart';
import '../../widgets/cards/card_itens.dart';
import '../../widgets/cs_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<FruitItem> fruitListCopy;

  @override
  void initState() {
    super.initState();
    fruitListCopy = List.from(fruitList);
    loadOrderFromStorage();
  }

  Future<void> saveOrderToStorage(List<FruitItem> updatedList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> order = updatedList.map((item) => item.title).toList();
    await prefs.setStringList('fruitOrder', order);
  }

  Future<void> loadOrderFromStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? order = prefs.getStringList('fruitOrder');
    if (order != null) {
      setState(() {
        fruitListCopy.sort(
          (a, b) => order.indexOf(a.title).compareTo(order.indexOf(b.title)),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Lista de Frutas',
        automaticallyImplyLeading: false,
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final FruitItem item = fruitListCopy.removeAt(oldIndex);
            fruitListCopy.insert(newIndex, item);

            saveOrderToStorage(fruitListCopy);
          });
        },
        children: List.generate(
          fruitListCopy.length,
          (index) {
            return CardItens(
              key: ValueKey(fruitListCopy[index].title),
              title: fruitListCopy[index].title,
              svgPath: fruitListCopy[index].iconPath,
            );
          },
        ),
      ),
    );
  }
}
