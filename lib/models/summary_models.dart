

class SummaryData {
  String id;
  String title;
  String author;
  String date;
  String content;


  SummaryData({ this.id, this.title, this.author, this.date, this.content});

  SummaryData.fromJSON(Map<String, dynamic> json):
        id = json["id"],
      title = json["title"],
      author = json["author"],
      date = json["date"],
      content = json["content"];

  Map<String, dynamic> toJSON() => {
    "id": id,
    "title" : title,
    "author": author,
    "date": date,
    "content": content,
  };
}

class SummaryListData {
  // Keep track of the 5 most recently accessed elements
  List<SummaryData> recentlyAccessed = List<SummaryData>.filled(4, null, growable: false);
  List<SummaryData> allEntries = <SummaryData>[];

  SummaryListData({this.recentlyAccessed, this.allEntries});

  SummaryListData.fromJSON(Map<String, dynamic> json):
      recentlyAccessed = json["recentlyAccessed"],
      allEntries = json["allEntries"];

  Map<String, dynamic> toJSON() => {
    "recentlyAccessed": recentlyAccessed,
    "allEntries": allEntries,
  };

  SummaryData get mostRecent {
    return recentlyAccessed[0];
  }

  void updateRecents(SummaryData mostRecent){
    recentlyAccessed.removeAt(4);
    for(int i = 1; i < 4; i++){
      recentlyAccessed[i] = recentlyAccessed[i - 1];
    }

    recentlyAccessed[0] = mostRecent;
  }

  void addEntry(SummaryData entry){
    allEntries.add(entry);
  }

}