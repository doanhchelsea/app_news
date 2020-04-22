


class News {
  final String id;
  final String thumb;
  final String title;
  final String source;
  final String publishedDate;
  final String catid;
  final String rid;
  final int nextpage;

  News(
      {this.id,
      this.thumb,
      this.title,
      this.source,
      this.publishedDate,
      this.catid,
      this.rid,
      this.nextpage});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json["id"] ,
      thumb: json["thumb"] ,
      title: json["title"] ,
      source: json["source"] ,
      publishedDate: json["publishedDate"] ,
      catid: json["catid"] ,
      rid: json["rid"] ,
      nextpage: json["nextpage"] ,
    );
  }
}


