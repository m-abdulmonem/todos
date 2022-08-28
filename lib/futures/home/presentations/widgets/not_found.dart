import 'package:flutter/material.dart';
import '/core/services/custom_widgets.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText("Not Found",
          fontSize: 25, color: colorPrimary.withOpacity(.7)),
    );
  }
}
