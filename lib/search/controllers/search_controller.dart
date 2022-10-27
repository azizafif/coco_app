import 'dart:developer';

import 'package:coco_app/controllers/pagination_controller.dart';

import 'package:coco_app/search/data/model/coco_model.dart';
import 'package:coco_app/search/data/model/instance_model.dart';
import 'package:coco_app/search/data/services/search_services.dart';

class SearchController extends PaginationController<SearchServices> {
  SearchController() : super(SearchServices());
  SearchController.serving(super.service);

  List<dynamic> catsList = [];
  List<CocoModel> imagesList = [];
  List<InstanceModel> instancesList = [];

  void getCats({required List<num> ids, bool fromBeginnig = false}) {
    isLoading = true;
    service
        .getCats(ids: ids)
        .then(
          (result) => result.fold((error) => null, (data) {
            log('getCats 2');
            catsList.addAll(data?.result ?? []);
            log(catsList[0].runtimeType.toString());

            update();
          }),
        )
        .then((value) {
      getImages(ids: List<int>.from(catsList));
      getInstances(ids: List<int>.from(catsList));
    }).whenComplete(() => {isLoading = false});
  }

  void getImages({required List<num> ids, bool fromBeginnig = false}) {
    isLoading = true;
    service
        .getImages(ids: ids)
        .then(
          (result) => result.fold((error) => null, (data) {
            imagesList.addAll(data?.cocoas ?? []);

            update();
          }),
        )
        .whenComplete(() => {isLoading = false});
  }

  void getInstances({required List<int> ids, bool fromBeginnig = false}) {
    isLoading = true;
    service
        .getInstances(ids: ids)
        .then(
          (result) => result.fold((error) => null, (data) {
            instancesList.addAll(data?.instances ?? []);

            update();
          }),
        )
        .whenComplete(() => {isLoading = false});
  }

  void cleanData() {
    instancesList = [];
    imagesList = [];
    catsList = [];
    update();
  }
}
