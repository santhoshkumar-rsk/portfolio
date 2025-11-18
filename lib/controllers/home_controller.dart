import 'package:get/get.dart';


class HomeController extends GetxController {
var selectedSection = 'home'.obs;


void goTo(String section) => selectedSection.value = section;
}