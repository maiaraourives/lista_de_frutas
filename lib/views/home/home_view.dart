import 'package:flutter/material.dart';
import '../../configs/routes/local_routes.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_elevated_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Home',
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: CsElevatedButton(
              label: 'Salva no Sqflite',
              onPressed: () => getIt<NavigationService>().pushNamed(LocalRoutes.SALVA_BANCO_DADOS),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: CsElevatedButton(
              label: 'Salva no Shared Preferences',
              onPressed: () => getIt<NavigationService>().pushNamed(LocalRoutes.SALVA_SHARED_PREFERENCES),
            ),
          ),
        ],
      ),
    );
  }
}
