/// status : "ok"
/// totalResults : 34
/// articles : [{"source":{"id":"the-washington-post","name":"The Washington Post"},"author":"Emily Langer","title":"Tim Johnson, three-term senator from South Dakota, dies at 77 - The Washington Post","description":"Mr. Johnson earned bipartisan respect as a quiet workhorse attuned to the needs of his state.","url":"https://www.washingtonpost.com/obituaries/2024/10/09/tim-johnson-south-dakota-senator/","urlToImage":"https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/H4DXSNIJNJ6KTPAIEW6334P47U_size-normalized.JPG&w=1440","publishedAt":"2024-10-10T02:44:26Z","content":"Tim Johnson, a South Dakota Democrat who served for nearly three decades on Capitol Hill 10 years in the House and 18 in the Senate earning bipartisan respect as a quiet workhorse attuned to the need… [+6578 chars]"},{"source":{"id":"espn","name":"ESPN"},"author":"Rich Cimini","title":"Rodgers resents talk he had hand in Saleh's exit - ESPN","description":"Aaron Rodgers insisted he played no role in the firing of Robert Saleh as the Jets' coach and called such allegations \"patently false.\"","url":"https://www.espn.com/nfl/story/_/id/41702325/aaron-rodgers-resents-rumors-had-hand-robert-saleh-firing","urlToImage":"https://a.espncdn.com/combiner/i?img=%2Fphoto%2F2024%2F1009%2Fr1398394_2_1296x729_16%2D9.jpg","publishedAt":"2024-10-09T19:15:00Z","content":"FLORHAM PARK, N.J. -- New York Jets quarterback Aaron Rodgers, commenting for the first time on Robert Saleh's dismissal, fired back at those who believe he influenced owner Woody Johnson's decision … [+4392 chars]"}]

class HeadlineNewsModel {
  HeadlineNewsModel({
    String? status,
    num? totalResults,
    List<Articles>? articles,
  }) {
    _status = status;
    _totalResults = totalResults;
    _articles = articles;
  }

  HeadlineNewsModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalResults = json['totalResults'];
    if (json['articles'] != null) {
      _articles = [];
      json['articles'].forEach((v) {
        _articles?.add(Articles.fromJson(v));
      });
    }
  }
  String? _status;
  num? _totalResults;
  List<Articles>? _articles;
  HeadlineNewsModel copyWith({
    String? status,
    num? totalResults,
    List<Articles>? articles,
  }) =>
      HeadlineNewsModel(
        status: status ?? _status,
        totalResults: totalResults ?? _totalResults,
        articles: articles ?? _articles,
      );
  String? get status => _status;
  num? get totalResults => _totalResults;
  List<Articles>? get articles => _articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalResults'] = _totalResults;
    if (_articles != null) {
      map['articles'] = _articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// source : {"id":"the-washington-post","name":"The Washington Post"}
/// author : "Emily Langer"
/// title : "Tim Johnson, three-term senator from South Dakota, dies at 77 - The Washington Post"
/// description : "Mr. Johnson earned bipartisan respect as a quiet workhorse attuned to the needs of his state."
/// url : "https://www.washingtonpost.com/obituaries/2024/10/09/tim-johnson-south-dakota-senator/"
/// urlToImage : "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/H4DXSNIJNJ6KTPAIEW6334P47U_size-normalized.JPG&w=1440"
/// publishedAt : "2024-10-10T02:44:26Z"
/// content : "Tim Johnson, a South Dakota Democrat who served for nearly three decades on Capitol Hill 10 years in the House and 18 in the Senate earning bipartisan respect as a quiet workhorse attuned to the need… [+6578 chars]"

class Articles {
  Articles({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
  }

  Articles.fromJson(dynamic json) {
    _source = json['source'] != null ? Source.fromJson(json['source']) : null;
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }
  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;
  Articles copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) =>
      Articles(
        source: source ?? _source,
        author: author ?? _author,
        title: title ?? _title,
        description: description ?? _description,
        url: url ?? _url,
        urlToImage: urlToImage ?? _urlToImage,
        publishedAt: publishedAt ?? _publishedAt,
        content: content ?? _content,
      );
  Source? get source => _source;
  String? get author => _author;
  String? get title => _title;
  String? get description => _description;
  String? get url => _url;
  String? get urlToImage => _urlToImage;
  String? get publishedAt => _publishedAt;
  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_source != null) {
      map['source'] = _source?.toJson();
    }
    map['author'] = _author;
    map['title'] = _title;
    map['description'] = _description;
    map['url'] = _url;
    map['urlToImage'] = _urlToImage;
    map['publishedAt'] = _publishedAt;
    map['content'] = _content;
    return map;
  }
}

/// id : "the-washington-post"
/// name : "The Washington Post"

class Source {
  Source({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Source.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;
  Source copyWith({
    String? id,
    String? name,
  }) =>
      Source(
        id: id ?? _id,
        name: name ?? _name,
      );
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}
