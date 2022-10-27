import 'package:flutter/material.dart';

import '../../api/request_performer.dart';
import 'serving_controller.dart';

abstract class PaginationController<S extends RequestPerformer>
    extends ServingController<S> {
  PaginationController(super.service);

  bool isLoading = false;

  @override
  @mustCallSuper
  void onReady() {
    super.onReady();
  }

  @override
  @mustCallSuper
  void onClose() {
    super.onClose();
  }
}
