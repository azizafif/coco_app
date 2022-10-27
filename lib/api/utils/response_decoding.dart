import '../exceptions/exceptions.dart';
import '../exports.dart';

dynamic decode<T extends ModelingProtocol>(
  T decodableModel, {
  Response<dynamic>? response,
  dynamic mockingData,
  bool paginated = false,
  bool mocking = false,
}) {
  assert(
    mockingData != null || response != null,
    '\n[RequestPerformer => decode] You should provide either some mocking data or a real response to be trated',
  );

  final data = response?.data;

  try {
    if (decodableModel is NoDataModel) {
      return decodableModel.fromJson(data);
    }

    assert(data is List);

    return decodableModel.fromJson(data);
  } catch (error) {
    // FirebaseErrorRecorder.recordNonFatalError(
    //   error,
    //   stackTrace,
    //   message: mocking
    //       ? '\n[RequestPerformer => decode] Mocking has failed, please verify the provided mocking data for < ${decodableModel.runtimeType} > class'
    //       : '\n[RequestPerformer => decode] Serialization process has failed, please verify that <${decodableModel.runtimeType}> conforms to the awaited response structure',
    // );

    throw DecodingException();
  }
}
