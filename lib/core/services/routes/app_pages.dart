import 'package:get/get.dart';
import '/futures/home/presentations/home_view.dart';
import 'app_routes.dart';

class AppPages {
  static const String initial = Routes.home;

  static final routes = <GetPage<dynamic>>[
    GetPage(name: Routes.home, page: () => const HomeView()),


  ];
}
