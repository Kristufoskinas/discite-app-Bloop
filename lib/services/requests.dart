import 'dart:io';
import 'dart:typed_data';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const String serverUrl = "http://127.0.0.1:8000/test/";

// realus konspektavimas v2

class Summarize {
  final String title;
  const Summarize({this.title});
  factory Summarize.fromJson(Map<String, dynamic> json) {
    return Summarize(
      title: json['text'],
    );
  }

  Future<Summarize> summarizeText2(String origText) async {
    final response = await http.post(
      Uri.parse(serverUrl),
      body: jsonEncode(origText),
    );
    if (response.statusCode == 200) {
      //return Summarize.fromJson(jsonDecode(response.body));
      print(Summarize.fromJson(jsonDecode(response.body)));
    } else {
      throw Exception('Failed to create summary.');
    }
  }
}

class RequestsService {
  // Singleton pattern
  static final RequestsService requestsService = RequestsService._internal();
  factory RequestsService() => requestsService;
  RequestsService._internal();

  static const String serverUrl = "http://127.0.0.1:8000/test/";

  /// realus konspektavimas v1
  Future<String> summarizeText(String origText) async {
    Dio dio = new Dio();
    var res;

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    FormData formData = FormData.fromMap({
      "text": origText,
    });

    try {
      res = await dio.post(serverUrl, data: formData);
      // print(res);
    } catch (e) {
      print(e);
    }

    // TEMP METHOD TO FIX OUTPUT
    // return res.data.toString().split("[")[1].split("]")[0].replaceAll("\\n", "\n") ?? "Error during summarisation!";

    return res?.data;
  }

  /// realus nuotraukos ikelimas
  Future<String> postImage(ByteData bd) async {
    Dio dio = new Dio();
    var res;

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    FormData formData = FormData.fromMap({
      "scan": MultipartFile.fromBytes(bd.buffer.asUint8List(),
          filename: 'scan.jpg'),
    });

    try {
      res = await dio.post(
        serverUrl + "/qwertyuioplkjhgfdsa/ocr/ocr.php",
        data: formData,
        options: Options(
            headers: {"enctype": "multipart/form-data"},
            followRedirects: true,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      // print(res.data);
    } catch (e) {
      print(e);
    }

    return res?.data;
  }
}
