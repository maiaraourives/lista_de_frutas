// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import '../../database/helper/frutas_helper.dart';
import '../../models/frutas_model.dart';
import '../../models/frutas_model_database.dart';
import '../../utils/list_fruit.dart';
import '../../widgets/cards/card_itens.dart';
import '../../widgets/cs_app_bar.dart';

class SalvaBancoDados extends StatefulWidget {
  const SalvaBancoDados({super.key});

  @override
  State<SalvaBancoDados> createState() => _SalvaBancoDadosState();
}

class _SalvaBancoDadosState extends State<SalvaBancoDados> {
  late List<FrutaModel> listaFrutasCopy;

  @override
  void initState() {
    super.initState();
    listaFrutasCopy = List.from(listaFrutas);
    carregarOrdem();
  }

  Future<void> salvarOrdem(List<FrutaModel> updatedList) async {
    final frutasDatabaseHelper = FrutasDatabaseHelper();
    final List<FrutaDatabaseModel> frutasDatabaseList = updatedList.map((fruta) {
      return FrutaDatabaseModel(
        title: fruta.title,
        iconPath: fruta.iconPath,
      );
    }).toList();

    await frutasDatabaseHelper.savelistaFrutas(frutasDatabaseList);
  }

  Future<void> carregarOrdem() async {
    final frutasDatabaseHelper = FrutasDatabaseHelper();
    final List<FrutaDatabaseModel> frutasDatabaseList = await frutasDatabaseHelper.getlistaFrutas();

    setState(() {
      listaFrutasCopy.sort(
        (a, b) => frutasDatabaseList.indexWhere((fruta) => fruta.title == a.title).compareTo(frutasDatabaseList.indexWhere((fruta) => fruta.title == b.title)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Lista das Frutas',
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final FrutaModel item = listaFrutasCopy.removeAt(oldIndex);
            listaFrutasCopy.insert(newIndex, item);

            salvarOrdem(listaFrutasCopy);
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
          listaFrutasCopy.length,
          (index) {
            return CardItens(
              key: ValueKey(listaFrutasCopy[index].title),
              title: listaFrutasCopy[index].title,
              svgPath: listaFrutasCopy[index].iconPath,
            );
          },
        ),
      ),
    );
  }
}
