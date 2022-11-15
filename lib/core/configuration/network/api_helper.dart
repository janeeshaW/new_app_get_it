import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/core/configuration/network/network_config.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/core/error/messages.dart';
import 'package:news_app/features/data/models/common/common_error_response_model.dart';



class ApiHelper {
  static final String baseUrl = NetworkConfig.getNetworkUrl();
  static BaseOptions opts = BaseOptions(
    baseUrl: baseUrl,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
            onRequest:
                (RequestOptions options, RequestInterceptorHandler handler) =>
                requestInterceptor(options, handler),
            onError: (DioError e, ErrorInterceptorHandler handler) async {
              return e.response!.data;
            }),
      );
  }

  static dynamic requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return options;
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response> get(String url) async {
    try {
      String methodUrl = baseUrl + url;
      Response response = await dio.get(methodUrl,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      return response;
    } on DioError catch (e) {
      log('[API Helper - GET] Connection Exception => ' + e.message);

      if (e.response != null) {
        final int statusCode = e.response!.statusCode!;

        if (statusCode < 200 || statusCode > 400) {
          switch (statusCode) {
            case 401:
            case 403:
              throw UnAuthorizedException(
                  ErrorResponseModel.fromJson(e.response!.data));
            case 404:
            case 500:
              throw ServerException(const ErrorResponseModel(
                  responseError: ErrorMessages.SOMETHING_WRONG));
            default:
              throw DioException(
                  errorResponseModel: ErrorResponseModel(
                      responseCode: e.response!.statusCode.toString(),
                      responseError: e.response!.statusMessage));
          }
        }
        rethrow;
      } else {
        throw ServerException(const ErrorResponseModel(
            responseError: ErrorMessages.SOMETHING_WRONG));
      }
    }
  }

  Future<Response> getWithQParam(String url,Map<String, dynamic>? queryParameters) async {
    String queryString = Uri(queryParameters: queryParameters).query;
    try {
      String methodUrl = baseUrl + url + '?' + queryString;
      Response response = await dio.get(methodUrl,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      return response;
    } on DioError catch (e) {
      log('[API Helper - GET With Query Params] Connection Exception => ' + e.message);

      if (e.response != null) {
        final int statusCode = e.response!.statusCode!;

        if (statusCode < 200 || statusCode > 400) {
          switch (statusCode) {
            case 401:
            case 403:
              throw UnAuthorizedException(
                  ErrorResponseModel.fromJson(e.response!.data));
            case 404:
            case 500:
              throw ServerException(const ErrorResponseModel(
                  responseError: ErrorMessages.SOMETHING_WRONG));
            default:
              throw DioException(
                  errorResponseModel: ErrorResponseModel(
                      responseCode: e.response!.statusCode.toString(),
                      responseError: e.response!.statusMessage));
          }
        }
        rethrow;
      } else {
        throw ServerException(const ErrorResponseModel(
            responseError: ErrorMessages.SOMETHING_WRONG));
      }
    }
  }

  Future<dynamic> post(String url, data) async {
    try {
      String methodUrl = baseUrl + url;
      Response response = await dio.post(methodUrl,
          data: data,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      return response;
    } on DioError catch (e) {
      log('[API Helper - POST] Connection Exception => ' + e.message);

      if (e.response != null) {
        final int statusCode = e.response!.statusCode!;

        if (statusCode < 200 || statusCode > 400) {
          switch (statusCode) {
            case 401:
            case 403:
              throw UnAuthorizedException(
                  ErrorResponseModel.fromJson(e.response!.data));
            case 404:
            case 500:
              throw ServerException(const ErrorResponseModel(
                  responseError: ErrorMessages.SOMETHING_WRONG));
            default:
              throw DioException(
                  errorResponseModel: ErrorResponseModel(
                      responseCode: e.response!.statusCode.toString(),
                      responseError: e.response!.statusMessage));
          }
        }
        rethrow;
      } else {
        throw ServerException(const ErrorResponseModel(
            responseError: ErrorMessages.SOMETHING_WRONG));
      }
    }
  }

  Future<dynamic> postWithQParams(
      String url, data, Map<String, dynamic>? queryParameters) async {
    try {
      String methodUrl = baseUrl + url;
      Response response = await dio.post(
        methodUrl,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      return response;
    } on DioError catch (e) {
      log('[API Helper - POST With Query Param] Connection Exception => ' + e.message);

      if (e.response != null) {
        final int statusCode = e.response!.statusCode!;

        if (statusCode < 200 || statusCode > 400) {
          switch (statusCode) {
            case 401:
            case 403:
              throw UnAuthorizedException(
                  ErrorResponseModel.fromJson(e.response!.data));
            case 404:
            case 500:
              throw ServerException(const ErrorResponseModel(
                  responseError: ErrorMessages.SOMETHING_WRONG));
            default:
              throw DioException(
                  errorResponseModel: ErrorResponseModel(
                      responseCode: e.response!.statusCode.toString(),
                      responseError: e.response!.statusMessage));
          }
        }
        rethrow;
      } else {
        throw ServerException(const ErrorResponseModel(
            responseError: ErrorMessages.SOMETHING_WRONG));
      }
    }
  }
}
