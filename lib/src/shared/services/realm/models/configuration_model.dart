import 'package:realm/realm.dart';

part 'configuration_model.g.dart';

//flutter pub run realm generate

@RealmModel()
class _ConfigurationModel {
  late String themeModeName;
  late DateTime? syncDate;
}
