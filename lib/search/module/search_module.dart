import 'package:coco_app/api/modules/inheritance_provider.dart';
import 'package:coco_app/search/controllers/search_controller.dart';
import 'package:coco_app/search_view.dart';
import 'package:get/get.dart';

final searchModule = GetPage(
  name: '/searchModule',
  page: () =>
      const InheritanceProviderOf<SearchController>(across: SearchView()),
  binding: BindingsBuilder.put(() => SearchController()),
);
