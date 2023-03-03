import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../shared/stores/app_store.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final appStore = Modular.get<AppStore>();

  void _changeModeTheme(ThemeMode? mode) {
    if (mode != null) {
      appStore.themeMode.value = mode;
    }
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => appStore.themeMode.value);
    //quando o appStore.themeMode.value for modificado, ira atualizar o widget inteiro
    return Scaffold(
      appBar: AppBar(
        title: const Text('configuration'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Tema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            RadioListTile<ThemeMode>(
              title: const Text('Sistema'),
              value: ThemeMode.system,
              groupValue: appStore.themeMode.value,
              onChanged: _changeModeTheme,
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Claro'),
              value: ThemeMode.light,
              groupValue: appStore.themeMode.value,
              onChanged: _changeModeTheme,
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Escuro'),
              value: ThemeMode.dark,
              groupValue: appStore.themeMode.value,
              onChanged: _changeModeTheme,
            ),
            const SizedBox(height: 10),
            Text(
              'Controle de dados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Apagar cache e reiniciar o app'),
            )
          ],
        ),
      ),
    );
  }
}
