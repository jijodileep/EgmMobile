import 'dart:io';

import 'package:http/http.dart' as http;

import 'end_point.dart';

class HttpsConfig {
  /// The function `postCall` sends a POST request to a specified URL with form data and returns the
  /// response.
  ///
  /// Args:
  ///   url (String): The URL where the POST request will be sent.
  ///   formData: The `formData` parameter is the data that you want to send in the body of the HTTP
  /// POST request. It can be of type `Map<String, dynamic>` or `String`. If it is a `Map<String,
  /// dynamic>`, it will be automatically encoded as form data. If it is
  ///   sendProgress (Function?): The `sendProgress` parameter is an optional callback function that can
  /// be used to track the progress of the HTTP request being sent. It can be used to update the UI or
  /// perform any other actions based on the progress of the request.
  ///
  /// Returns:
  ///   a `Future<dynamic>`.
  Future<dynamic> postCall(String url, formData,
      {Function? sendProgress}) async {
    http.Response response;
    try {
      response = await http.post(EndPoint.baseUrl + url as Uri, body: formData);
    } on HttpException catch (httpError) {
      return httpError;
    }
    return HttpResponse.hasResponse(response);
  }

  /// The function `getCall` makes an HTTP GET request to the specified URL and returns the response.
  ///
  /// Args:
  ///   url (String): The `url` parameter is a string that represents the URL of the API endpoint that
  /// you want to make a GET request to.
  ///
  /// Returns:
  ///   a `Future<Object>`.
  Future<Object> getCall(String url) async {
    http.Response response;
    try {
      response = await http.get(url as Uri);
    } on HttpException catch (httpError) {
      return httpError;
    }
    return HttpResponse.hasResponse(response);
  }

  /// The function `getCallParams` makes an HTTP GET request to a specified URL with optional query
  /// parameters and returns the response or an error.
  ///
  /// Args:
  ///   url (String): The `url` parameter is a string representing the URL of the API endpoint that you
  /// want to make a GET request to.
  ///   queryParams (Map): The `queryParams` parameter is a `Map` object that contains key-value pairs
  /// representing the query parameters to be included in the URL. These query parameters are used to
  /// provide additional information to the server when making an HTTP GET request.
  ///
  /// Returns:
  ///   a `Future<Object>`.
  Future<Object> getCallParams(String url, Map queryParams) async {
    http.Response response;
    try {
      final uri = Uri.https(url, queryParams as String);
      response = await http.get(uri);
    } on HttpException catch (httpError) {
      return HttpResponse.hasError(httpError);
    }
    return HttpResponse.hasResponse(response);
  }

  /// The function `postCallParams` sends a POST request to a specified URL with the given query
  /// parameters and returns the response.
  ///
  /// Args:
  ///   url (String): The `url` parameter is a string that represents the URL to which the POST request
  /// will be made. It should be a valid URL format, such as "https://example.com/api/endpoint".
  ///   queryParams (Map): The `queryParams` parameter is a `Map` that contains the key-value pairs of the
  /// parameters to be sent in the HTTP POST request. These parameters are typically used to provide
  /// additional data to the server.
  ///
  /// Returns:
  ///   The method `postCallParams` returns a `Future<HttpResponse>`.

  Future<HttpResponse> postCallParams(String url, Map queryParams) async {
    http.Response response;
    try {
      response = await http.post(
        url as Uri,
        body: queryParams as Map<String, dynamic>?,
      );
    } on HttpException catch (httpError) {
      return HttpResponse.hasError(httpError);
    }
    return HttpResponse.hasResponse(response);
  }
}

/// The `HttpResponse` class represents the response of an HTTP request, including the response data or
/// any error that occurred.
class HttpResponse {
  http.Response? response;

  bool hasError = false;
  String errorMessage = '';
  late HttpException httpError;

  HttpResponse.hasResponse(this.response) {
    hasError = false;
  }

  HttpResponse.hasError(this.httpError) {
    hasError = true;
  }
}
