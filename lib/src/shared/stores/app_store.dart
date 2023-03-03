import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class AppStore {
  // Organizacao:
  // 1) Variaveis publicas | 2) Variaveis privadas | 3) Construtor | 4) Métodos
  final themeMode = RxNotifier(ThemeMode.system);
  final syncDate = RxNotifier<DateTime?>(null);
}
