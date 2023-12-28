// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/frutas_model.dart';
import '../../utils/list_fruit.dart';
import '../../widgets/cards/card_itens.dart';
import '../../widgets/cs_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<FrutaModel> fruitListCopy;

  @override
  void initState() {
    super.initState();
    fruitListCopy = List.from(fruitList);
    carregarOrdem();
  }

  Future<void> salvarOrdem(List<FrutaModel> updatedList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> ordem = updatedList.map((item) => item.title).toList();
    await prefs.setStringList('ordemFruta', ordem);
  }

  Future<void> carregarOrdem() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? ordem = prefs.getStringList('ordemFruta');
    if (ordem != null) {
      setState(() {
        fruitListCopy.sort(
          (a, b) => ordem.indexOf(a.title).compareTo(ordem.indexOf(b.title)),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Lista das Frutas',
        automaticallyImplyLeading: false,
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final FrutaModel item = fruitListCopy.removeAt(oldIndex);
            fruitListCopy.insert(newIndex, item);

            salvarOrdem(fruitListCopy);
          });
        },
        proxyDecorator: (child, index, animation) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              final double animValue = Curves.easeInOut.transform(animation.value);
              final double scale = lerpDouble(1, 1.1, animValue)!;
              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child: child,
          );
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
