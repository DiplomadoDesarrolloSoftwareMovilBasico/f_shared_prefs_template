import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'domain/use_case/authentication.dart';
import 'ui/controllers/authentication_controller.dart';
import 'ui/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<Authentication>(() => Authentication());
  Get.put(AuthenticationController());
  runApp(const MyApp());
}
