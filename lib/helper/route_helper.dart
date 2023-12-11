import 'package:get/get.dart';
import 'package:interview_test/feature/home/view/home_screen_view.dart';


class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String home = '/home';

  static getInitialRoute() => initial;
  static getSplashRoute() => splash;
  static getHomeRoute() => home;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomeScreenView()),
    GetPage(name: splash, page: () => const HomeScreenView()),
    GetPage(name: home, page: () => const HomeScreenView()),
  ];
}