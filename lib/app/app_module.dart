import 'package:aplication_search_artic/app/modules/initial/initial_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/register/', module: HomeModule()),
    ModuleRoute('/registerActing/', module: HomeModule()),
    ModuleRoute('/registerInterest/', module: HomeModule()),
    ModuleRoute('/initial/', module: InitialModule()),
    ModuleRoute('/profile/', module: InitialModule()),
  ];

}