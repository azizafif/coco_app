import 'package:coco_app/api/protocol/modeling_protocol.dart';
import 'package:coco_app/api/utils/networking_utilities.dart';

class CocoListModel extends ModelingProtocol {
  List<CocoModel>? cocoas;

  CocoListModel({this.cocoas});

  @override
  CocoListModel? fromJson(dynamic json) => CocoListModel(
        cocoas: (json as List?)
            ?.map((element) => CocoModel.fromJson(element as StringKeyedMap))
            .toList(),
      );

  @override
  List<Object?> get props => [cocoas];

  @override
  List<StringKeyedMap> get mockingData => [
        {
          'id': 108669,
          'coco_url':
              'http://images.cocodataset.org/train2017/000000108669.jpg',
          'flickr_url':
              'http://farm1.staticflickr.com/178/462907911_ead93eda5b_z.jpg'
        },
        {
          'id': 40471,
          'coco_url': 'http://images.cocodataset.org/val2017/000000040471.jpg',
          'flickr_url':
              'http://farm9.staticflickr.com/8325/8439933802_ed67dcf228_z.jpg'
        },
        {
          'id': 108669,
          'coco_url':
              'http://images.cocodataset.org/train2017/000000108669.jpg',
          'flickr_url':
              'http://farm1.staticflickr.com/178/462907911_ead93eda5b_z.jpg'
        },
        {
          'id': 40471,
          'coco_url': 'http://images.cocodataset.org/val2017/000000040471.jpg',
          'flickr_url':
              'http://farm9.staticflickr.com/8325/8439933802_ed67dcf228_z.jpg'
        },
      ];
}

class CocoModel {
  int? id;
  String? cocoaUrl;
  String? flickrUrl;

  CocoModel({
    this.id,
    this.cocoaUrl,
    this.flickrUrl,
  });

  factory CocoModel.fromJson(Map<String, dynamic> json) => CocoModel(
        id: json['id'] as int?,
        cocoaUrl: json['coco_url'] as String?,
        flickrUrl: json['flickr_url'] as String?,
      );
}
