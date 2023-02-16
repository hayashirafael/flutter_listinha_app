import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/configuration/configuration_page.dart';
import 'package:listinha/src/configuration/services/configuration_services.dart';
import 'package:listinha/src/home/home_module.dart';
import 'package:listinha/src/shared/services/realm/realm_config.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';

class AppModule extends Module {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
        Bind.instance(Realm(config)),
        Bind.factory<ConfigurationServices>((i) => ConfigurationServiceImpl.new),
        Bind.singleton((i) => AppStore()),
      ];
  // Singleton, criando apenas 1 instancia

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute('/config', child: (context, args) => const ConfigurationPage()),
      ];
}
