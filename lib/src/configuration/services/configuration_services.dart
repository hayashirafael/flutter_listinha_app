import 'package:listinha/src/shared/services/realm/models/configuration_model.dart';
import 'package:realm/realm.dart';

abstract class ConfigurationServices {
  ConfigurationModel getConfiguration();

  void saveConfiguration(String themeMode, DateTime? syncDate);
  void deleteAll();
}

class ConfigurationServiceImpl implements ConfigurationServices {
  final Realm realm;

  ConfigurationServiceImpl(this.realm);

  @override
  ConfigurationModel getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  @override
  void saveConfiguration(String themeMode, DateTime? syncDate) {
    final model = getConfiguration();
    realm.write(() {
      model.themeModeName = themeMode;
      model.syncDate = syncDate;
    });
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }
}
