import 'package:coco_app/api/request_performer.dart';
import 'package:coco_app/controllers/base_controller.dart';

abstract class ServingController<S extends RequestPerformer>
    extends BaseController {
  ServingController(this.service);

  S service;
}
