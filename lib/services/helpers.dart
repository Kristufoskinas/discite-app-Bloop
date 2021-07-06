import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class Helpers{
  /// random ID konspektui
  String generateUniqueId(){
    var uuid = Uuid();
    var v1 = uuid.v1();
    return v1;
  }
}