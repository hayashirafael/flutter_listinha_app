import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/services/realm/models/configuration_model.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';
import 'package:rx_notifier/rx_notifier.dart';

abstract class ConfigurationService {
  void init();
  void deleteAll();
}

class ConfigurationServiceImpl implements ConfigurationService, Disposable {
  final Realm realm;
  final AppStore appStore;
  late final RxDisposer disposer;

  ConfigurationServiceImpl(this.realm, this.appStore);

  @override
  void deleteAll() {
    realm.deleteAll();
  }

  @override
  void init() {
    final model = _getConfiguration();
    appStore.themeMode.value = _getThemeModeByName(model.themeModeName);
    appStore.syncDate.value = model.syncDate;

    disposer = rxObserver(() {
      final themeMode = appStore.themeMode.value;
      final syncDate = appStore.syncDate.value;

      _saveConfiguration(themeMode.name, syncDate);
    });
  }

  @override
  ConfigurationModel _getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  @override
  void _saveConfiguration(String themeMode, DateTime? syncDate) {
    final model = _getConfiguration();
    realm.write(() {
      model.themeModeName = themeMode;
      model.syncDate = syncDate;
    });
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((element) => element.name == name);
  }

  @override
  void dispose() {
    disposer();
  }
}
