import 'package:flutter/widgets.dart';

extension NumberExtension on num {
  Widget get hBox => SizedBox(height: toDouble());

  Widget get wBox => SizedBox(width: toDouble());
}
