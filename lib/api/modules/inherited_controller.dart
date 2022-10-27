import 'package:coco_app/api/modules/exports.dart';
import 'package:coco_app/controllers/base_controller.dart';

class InheritedController<T extends BaseController> extends InheritedWidget {
  InheritedController({super.key, required this.screen}) : super(child: screen);

  final Widget screen;
  final T controller = Get.find<T>();

  @override
  bool updateShouldNotify(InheritedController<T> oldWidget) =>
      controller != oldWidget.controller;
}
