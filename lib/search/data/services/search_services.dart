import 'package:coco_app/api/exports.dart';
import 'package:coco_app/search/data/model/coco_model.dart';
import 'package:coco_app/search/data/model/instance_model.dart';

class SearchServices extends RequestPerformer {
  //? This function returns a list of categories
  FutureRequestResult<NoDataModel> getCats({required List<num> ids}) async {
    try {
      return Right(
        await performDecodingRequest(
            baseUrl:
                'https://us-central1-open-images-dataset.cloudfunctions.net',
            loaderEnabled: false,
            method: RestfullMethods.post,
            path: '/coco-dataset-bigquery',
            decodableModel: NoDataModel(),
            data: {"category_ids": ids, "querytype": "getImagesByCats"},
            extraHeaders: {'Content-Type': 'application/json'}),
      );
    } on DioError catch (e) {
      return Left(e);
    }
  }

  //? This function returns a list of coco images

  FutureRequestResult<CocoListModel> getImages({required List<num> ids}) async {
    try {
      return Right(
        await performDecodingRequest(
          baseUrl: 'https://us-central1-open-images-dataset.cloudfunctions.net',
          loaderEnabled: false,
          method: RestfullMethods.post,
          path: '/coco-dataset-bigquery',
          decodableModel: CocoListModel(),
          data: {"image_ids": ids, "querytype": "getImages"},
        ),
      );
    } on DioError catch (e) {
      return Left(e);
    }
  }

  //? This function returns a list of instances

  FutureRequestResult<InstancesListModel> getInstances(
      {required List<num> ids}) async {
    try {
      return Right(
        await performDecodingRequest(
          baseUrl: 'https://us-central1-open-images-dataset.cloudfunctions.net',
          loaderEnabled: false,
          method: RestfullMethods.post,
          path: '/coco-dataset-bigquery',
          decodableModel: InstancesListModel(),
          data: {"image_ids": ids, "querytype": "getInstances"},
        ),
      );
    } on DioError catch (e) {
      return Left(e);
    }
  }
}
