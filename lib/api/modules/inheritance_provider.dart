import 'package:coco_app/controllers/base_controller.dart';
import 'package:flutter/cupertino.dart';

import 'inherited_controller.dart';

class InheritanceProviderOf<T extends BaseController> extends StatelessWidget {
  const InheritanceProviderOf({super.key, required StatefulWidget across})
      : screen = across;

  final StatefulWidget screen;

  @override
  Widget build(BuildContext context) => InheritedController<T>(screen: screen);
}
