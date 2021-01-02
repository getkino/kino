class ExpiringNetflixMovies {
  double _elapse;
  int _total;
  List<Results> _results;

  double get elapse => _elapse;
  int get total => _total;
  List<Results> get results => _results;

  ExpiringNetflixMovies({
      double elapse, 
      int total, 
      List<Results> results}){
    _elapse = elapse;
    _total = total;
    _results = results;
}

  ExpiringNetflixMovies.fromJson(dynamic json) {
    _elapse = json["elapse"];
    _total = json["total"];
    if (json["results"] != null) {
      _results = [];
      json["results"].forEach((v) {
        _results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["elapse"] = _elapse;
    map["total"] = _total;
    if (_results != null) {
      map["results"] = _results.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Results {
  String _expiredate;
  String _countrycode;
  int _netflixid;
  String _title;

  String get expiredate => _expiredate;
  String get countrycode => _countrycode;
  int get netflixid => _netflixid;
  String get title => _title;

  Results({
      String expiredate, 
      String countrycode, 
      int netflixid, 
      String title}){
    _expiredate = expiredate;
    _countrycode = countrycode;
    _netflixid = netflixid;
    _title = title;
}

  Results.fromJson(dynamic json) {
    _expiredate = json["expiredate"];
    _countrycode = json["countrycode"];
    _netflixid = json["netflixid"];
    _title = json["title"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["expiredate"] = _expiredate;
    map["countrycode"] = _countrycode;
    map["netflixid"] = _netflixid;
    map["title"] = _title;
    return map;
  }
}