// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:lista_movivel/configs/routes/local_routes.dart';
import 'package:lista_movivel/views/home/home_view.dart';
import 'package:lista_movivel/views/salva-banco-dados/salva_banco_dados.dart';
import 'package:lista_movivel/views/salva-shared-preferences/salva_shared_preferences.dart';
import 'package:lista_movivel/widgets/cs_app_bar.dart';
import 'package:lista_movivel/widgets/nenhuma_informacao.dart';

import 'widgets/cs_elevated_button.dart';

class RouterApp {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LocalRoutes.HOME:
        return _PageBuilder(
          child: const HomeView(),
          settings: settings,
        );

      case LocalRoutes.SALVA_BANCO_DADOS:
        return _PageBuilder(
          child: const SalvaBancoDados(),
          settings: settings,
        );

      case LocalRoutes.SALVA_SHARED_PREFERENCES:
        return _PageBuilder(
          child: const SalvaSharedPreferences(),
          settings: settings,
        );

      default:
        return _PageBuilder(
          child: const _RotaInexistenteView(),
          settings: settings,
        );
    }
  }
}

class _PageBuilder extends PageRouteBuilder {
  _PageBuilder({
    required this.child,
    required this.settings,
  }) : super(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 100),
          pageBuilder: (context, animation, secAnimation) => child,
        );

  final Widget child;

  @override
  final RouteSettings settings;
}

class _RotaInexistenteView extends StatelessWidget {
  const _RotaInexistenteView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CsAppBar(title: 'Ops! Ocorreu um erro'),
      body: Center(
        child: SingleChildScrollView(
          child: NenhumaInformacao(
            Image.network('https://thecolor.blog/wp-content/uploads/2021/10/GIF-1.gif', width: double.maxFinite, height: 400),
            message: 'Desculpe, a página que você está procurando não foi encontrada. Relate o seu problema abrindo um chamado no botão abaixo!',
            actions: [
              CsElevatedButton(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.8,
                label: 'Abrir chamado',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RotaErrorWidgetView extends StatelessWidget {
  const RotaErrorWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: NenhumaInformacao(
            Image.network('https://thecolor.blog/wp-content/uploads/2021/10/GIF-1.gif', width: double.maxFinite, height: 400),
            message: 'Ocorreu um problema desconhecido. Ajude a equipe de desenvolvimento abrindo um chamado no botão abaixo',
            actions: [
              CsElevatedButton(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.8,
                label: 'Abrir chamado',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
