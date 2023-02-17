import 'package:flutter/material.dart';
import 'package:listinha/src/configuration/services/configuration_service.dart';

class AppStore {
  // Organizacao:
  // 1) Variaveis publicas | 2) Variaveis privadas | 3) Construtor | 4) Métodos
  final themeMode = ValueNotifier(ThemeMode.system);
  final syncDate = ValueNotifier<DateTime?>(null);
  final ConfigurationService _configurationService;

  AppStore(this._configurationService) {
    init();
  }

  void init() {
    final model = _configurationService.getConfiguration();
    syncDate.value = model.syncDate;
    themeMode.value = _getThemeModeByName(model.themeModeName);
  }

  void save() {
    _configurationService.saveConfiguration(
      themeMode.value.name,
      syncDate.value,
    );
  }

  void deleteApp() {
    _configurationService.deleteAll();
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      save();
    }
  }

  void setSyncDate(DateTime date) {
    syncDate.value = date;
    save();
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((element) => element.name == name);
  }
}
