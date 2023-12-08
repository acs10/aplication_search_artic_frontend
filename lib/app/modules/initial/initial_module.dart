import 'package:aplication_search_artic/app/modules/initial/pages/initial_page.dart';
import 'package:aplication_search_artic/app/modules/initial/pages/profile_page.dart';
import 'package:aplication_search_artic/app/modules/initial/store/initial_store.dart';
import 'package:aplication_search_artic/app/modules/initial/store/profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => InitialStore()),
    Bind.lazySingleton((i) => ProfileStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => InitialPage()),
    ChildRoute('/profile', child: (_, args) => ProfilePage()),
  ];

}