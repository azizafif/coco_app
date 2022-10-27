import 'package:coco_app/api/protocol/modeling_protocol.dart';
import 'package:coco_app/api/utils/networking_utilities.dart';

class InstancesListModel extends ModelingProtocol {
  List<InstanceModel>? instances;

  InstancesListModel({this.instances});

  @override
  InstancesListModel? fromJson(dynamic json) => InstancesListModel(
        instances: (json as List?)
            ?.map(
                (element) => InstanceModel.fromJson(element as StringKeyedMap))
            .toList(),
      );

  @override
  List<Object?> get props => [instances];
  @override
  List<StringKeyedMap> get mockingData => [
        {
          "image_id": 34873,
          "segmentation":
              "[[307.07, 195.17, 307.84, 190.41, 311.21, 188.42, 314.13, 188.26, 317.35, 188.72, 320.42, 190.56, 322.11, 192.71, 321.95, 196.24, 321.19, 197.47, 319.19, 197.62, 314.28, 197.62, 308.61, 197.01]]",
          "category_id": 53
        },
        {
          "image_id": 242422,
          "segmentation":
              "[[101.7, 343.6, 83.5, 332.48, 82.99, 317.32, 83.25, 304.93, 106.24, 311.76, 116.86, 322.12, 132.53, 341.32, 132.53, 345.62, 109.28, 347.14, 101.95, 348.15, 101.44, 345.62]]",
          "category_id": 53
        },
      ];
}

class InstanceModel {
  int? imageId;
  String? segmentation;
  int? categoryId;

  InstanceModel({
    this.imageId,
    this.segmentation,
    this.categoryId,
  });

  factory InstanceModel.fromJson(Map<String, dynamic> json) => InstanceModel(
        imageId: json['image_id'] as int?,
        segmentation: json['segmentation'] as String?,
        categoryId: json['category_id'] as int?,
      );
}
