import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:project/models/summary_models.dart';
import 'dart:math';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class StorageService {

  StorageService(){
    _ensureFileExists();
  }

  void _ensureFileExists() async {
    final _path = (await getApplicationDocumentsDirectory()).path;
    if(await File('$_path/summaries.txt').exists() == false){
      _writeJSON('\n');
    }
  }

  Future<File> get _dataFile async {
    final _path = (await getApplicationDocumentsDirectory()).path;
    return File('$_path/summaries.txt');
  }

  Future<File> _writeJSON(String json) async {
    final file = await _dataFile;

    return file.writeAsString(json);
  }

  Future _readJSON() async {
    try{
      final _file = await _dataFile;

      String json = await _file.readAsString();
      print("JSON extracted: " + json);

      return json.isNotEmpty ? json: null;
    }catch (e){
      print(e);
      return null;
    }
  }
  writeEntry(SummaryData summaryData) async{
   // List<SummaryData> recentlyAccessed = List<SummaryData>.filled(4, null, growable: false);
    //List<SummaryData> allEntries = <SummaryData>[];
    SummaryListData summaryListData = SummaryListData(recentlyAccessed: [summaryData], allEntries: [summaryData]);
    var json = await _readJSON();
    if(json != null){
      summaryListData = SummaryListData.fromJSON(jsonDecode(json));
      summaryListData.allEntries.add(summaryData);
    }

    print(summaryListData);

    await _writeJSON(summaryListData.toJSON().toString());
  }
  createFakeEntries() async {
    List<SummaryData> recentlyAccessed = List<SummaryData>.filled(4, null, growable: false);
    List<SummaryData> allEntries = <SummaryData>[];

    SummaryData(title: "Random title", author: "random author", date: "random date", content: "random content");

    for(int i = 5; i > 0; i--){
      allEntries.add(
        SummaryData(title: "Random title", author: "random author", date: "random date", content: "random content"),
      );
    }

    SummaryListData summaryListData = SummaryListData(recentlyAccessed: recentlyAccessed, allEntries: allEntries);

    print(summaryListData.toJSON());

    // await _writeJSON(jsonEncode(summaryListData.toJSON()));
    print((await _readJSON()).toString());
  }

  Future<List<SummaryData>> get recentSummaries async{
    SummaryListData summaryListData = SummaryListData.fromJSON(await _readJSON());
    return summaryListData?.recentlyAccessed;
  }

  Future<List<SummaryData>> get allEntries async{
    SummaryListData summaryListData = SummaryListData.fromJSON(await _readJSON());
    return summaryListData?.allEntries;
  }

  Future<SummaryListData> get summaryListData async{
    return SummaryListData.fromJSON(await _readJSON());
  }

  Future<bool> get noEntries async {
    return (await _readJSON()) == null;
  }

}