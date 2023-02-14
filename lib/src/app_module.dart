import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/configuration/configuration_page.dart';
import 'package:listinha/src/home/home_module.dart';
import 'package:listinha/src/shared/stores/app_store.dart';

class AppModule extends Module {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
        Bind.singleton((i) => AppStore()),
      ];
  // Singleton, criando apenas 1 instancia

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute('/config', child: (context, args) => const ConfigurationPage()),
      ];
}
