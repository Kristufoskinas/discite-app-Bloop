import 'dart:io';
import 'dart:typed_data';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class RequestsService{

  // Singleton pattern
  static final RequestsService requestsService = RequestsService._internal();
  factory RequestsService() => requestsService;
  RequestsService._internal();

  static const String serverUrl = "https://18.217.128.82";

    Future<String> summarizeText(String origText) async{

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

      try{
        res = await dio.post(serverUrl + "/qwertyuioplkjhgfdsa/api.php", data: formData);
        // print(res);
      }catch(e){
        print(e);
      }

      // TEMP METHOD TO FIX OUTPUT
      // return res.data.toString().split("[")[1].split("]")[0].replaceAll("\\n", "\n") ?? "Error during summarisation!";

      return res?.data;
    }

    Future<String> postImage(ByteData bd) async{
      Dio dio = new Dio();
      var res;

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      FormData formData = FormData.fromMap({
        "scan": MultipartFile.fromBytes(bd.buffer.asUint8List(), filename: 'scan.jpg'),
      });

      try{
        res = await dio.post(
            serverUrl + "/qwertyuioplkjhgfdsa/ocr/ocr.php",
            data: formData,
            options: Options(
              headers: {
                "enctype": "multipart/form-data"
              },
              followRedirects: true,
                validateStatus: (status) { return status < 500; }
            ),
        );
        // print(res.data);
      }catch(e){
        print(e);
      }

      return res?.data;
    }

  }
