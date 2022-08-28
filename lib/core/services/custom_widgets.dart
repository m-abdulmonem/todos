export 'widgets/custom_input.dart';
export 'widgets/custom_text.dart';
export 'widgets/custom_spacing.dart';
export 'widgets/custom_button.dart';
export '../utils/color.dart';

export 'binding/binding.dart';
export 'db/get_storage_keys.dart';
export 'locale/language_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'locale/language_service.dart';
import 'locale/translation.dart';
export 'themes/themes.dart';
export 'themes/theme_services.dart';
export 'routes/app_pages.dart';
export 'db/database/database_model.dart';
export 'db/database/sqlite_data_type.dart';

class CustomWidgets {
  static final storage = GetStorage();
  static bool get isRTL => LanguageService().isRTL;
  static Locale get locale => Locale(LanguageService().locale);
  static Translation get translation => Translation();

  static void snackBar(content, [duration = 10]) =>
      ScaffoldMessenger.of(Get.context!).showSnackBar(snack(content, duration));

  static SnackBar snack(content, [duration]) => SnackBar(
        content: Container(
          height: Get.height * .1,
          alignment: Alignment.center,
          child: content,
        ),
        duration: Duration(seconds: duration),
        backgroundColor: Colors.blueGrey,
      );
}

extension CustomStringExtenstion on String {
  String removeLastCharacter({String char = ',', int count = 1}) {
    String result = "";
    if (endsWith(char)) {
      result = substring(0, length - count);
    }
    return result;
  }
  String get toCapitalize => "${this[0].toUpperCase()}${substring(1)}";
}
