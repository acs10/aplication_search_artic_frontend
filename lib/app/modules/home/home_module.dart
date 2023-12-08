import 'package:aplication_search_artic/app/modules/home/pages/registerActing_page.dart';
import 'package:aplication_search_artic/app/modules/home/pages/registerInterest_page.dart';
import 'package:aplication_search_artic/app/modules/home/pages/register_page.dart';
import 'package:aplication_search_artic/app/modules/home/store/register_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'store/home_store.dart'; 
import 'pages/home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
 Bind.lazySingleton((i) => HomeStore()),
 Bind.lazySingleton((i) => RegisterStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
   ChildRoute('/register', child: (_, args) => RegisterPage()),
   ChildRoute('/registerActing', child: (_, args) => RegisterActingPage()),
   ChildRoute('/registerInterest', child: (_, args) => RegisterInterestPage()),
 ];
}