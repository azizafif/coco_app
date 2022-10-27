library request_performer;

import 'dart:async';

import 'package:coco_app/environment/app_environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as getx;

import '../helpers/debugging_printer.dart';
import 'exports.dart';
import 'utils/response_decoding.dart';

part 'request_interceptor.dart';

/// #### A Generic request performer based on a smart Dio Interceptor
class RequestPerformer extends _DioRequestInterceptor {
  void _preRequestSetup({
    final bool loaderEnabled = true,
    final bool debugginEnabled = true,
    String? baseUrl,
    final String? contentType,
    final StringKeyedMap? extraHeaders,
  }) {
    _DioRequestInterceptor.contentType =
        contentType ?? applicationJsonContentType;
    _DioRequestInterceptor.loaderEnabled = loaderEnabled;
    _DioRequestInterceptor.baseUrl = baseUrl ?? AppEnvironment.current.baseUrl;
    _RequestDebugger.debugginEnabled = debugginEnabled;
    dio.options.headers.addExtraHeaders(extraHeaders);
  }

  /// ### A generic method that consumes an API and handles automatic data serialization/mocking
  Future<R?> performDecodingRequest<R, MP extends ModelingProtocol>({
    required MP decodableModel,
    final bool loaderEnabled = true,
    final bool debugginEnabled = true,
    final bool paginated = false,
    required RestfullMethods method,
    String? baseUrl,
    required String path,
    final dynamic data,
    final String? contentType,
    final StringKeyedMap? extraHeaders,
    final StringKeyedMap? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) async {
    _preRequestSetup(
      loaderEnabled: loaderEnabled,
      debugginEnabled: debugginEnabled,
      baseUrl: baseUrl,
      contentType: contentType,
      extraHeaders: extraHeaders,
    );

    switch (method) {
      case RestfullMethods.get:
        return dio
            .get(path,
                queryParameters: queryParameters,
                options: options,
                cancelToken: cancelToken,
                onReceiveProgress: onReceiveProgress)
            .then((response) => decode(decodableModel,
                response: response, paginated: paginated));

      case RestfullMethods.post:
        return dio
            .post(path,
                data: data,
                queryParameters: queryParameters,
                options: options,
                cancelToken: cancelToken,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress)
            .then((response) => decode(decodableModel,
                response: response, paginated: paginated));

      case RestfullMethods.put:
        return dio
            .put(path,
                data: data,
                queryParameters: queryParameters,
                options: options,
                cancelToken: cancelToken,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress)
            .then((response) => decode(decodableModel,
                response: response, paginated: paginated));

      case RestfullMethods.patch:
        return dio
            .patch(path,
                data: data,
                queryParameters: queryParameters,
                options: options,
                cancelToken: cancelToken,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress)
            .then((response) => decode(decodableModel,
                response: response, paginated: paginated));

      case RestfullMethods.delete:
        return dio
            .delete(path,
                data: data,
                queryParameters: queryParameters,
                options: options,
                cancelToken: cancelToken)
            .then((response) => decode(decodableModel,
                response: response, paginated: paginated));
    }
  }
}
