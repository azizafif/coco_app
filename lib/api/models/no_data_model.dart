import 'package:coco_app/api/exports.dart';

class NoDataModel extends ModelingProtocol {
  final List<dynamic>? result;

  NoDataModel({this.result});

  @override
  NoDataModel fromJson(dynamic json) => NoDataModel(result: json);

  @override
  List<Object?> get props => [result];
}
