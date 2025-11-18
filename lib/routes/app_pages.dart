import 'package:get/get.dart';
import 'package:portfolio/home/home_page.dart';
import 'app_routes.dart';


class AppPages {
static const initial = Routes.HOME;


static final routes = [
GetPage(name: Routes.HOME, page: () =>  HomePage()),
];
}