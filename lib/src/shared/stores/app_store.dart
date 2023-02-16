import 'package:flutter/material.dart';

class AppStore {
  // Organizacao:
  // 1) Variaveis publicas | 2) Variaveis privadas | 3) Construtor | 4) Métodos
  final themeMode = ValueNotifier(ThemeMode.system);
  final syncDate = ValueNotifier<DateTime?>(null);

  AppStore();

  void save() {
    // TODO: Salvar os dados na base local
  }

  void init() {
    // TODO: Salvar os dados na base local
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
}
