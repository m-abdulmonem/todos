import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/core/services/custom_widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      initialBinding: Binding(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      translations: CustomWidgets.translation,
      locale: CustomWidgets.locale,
      fallbackLocale: Get.deviceLocale,
    );
  }
}
