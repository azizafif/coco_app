import 'package:coco_app/api/protocol/modeling_protocol.dart';

class CatsModel extends ModelingProtocol {
  CatsModel({this.catsIds});
  List<int>? catsIds;

  @override
  CatsModel fromJson(dynamic json) => CatsModel(
        catsIds: json as List<int>,
      );

  @override
  List<Object?> get props => [catsIds];
}
