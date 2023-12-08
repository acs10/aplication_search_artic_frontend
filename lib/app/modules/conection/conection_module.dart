import 'package:aplication_search_artic/app/modules/conection/data/http_client.dart';
import 'package:aplication_search_artic/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConectionModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.instance(HttpClient()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];

}