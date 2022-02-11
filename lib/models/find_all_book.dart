import 'package:thebook_app/models/book_info.dart';

class FindAllBook {
  String? code;
  String? msg;
  Data? data;

  FindAllBook({this.code, this.msg, this.data});

  FindAllBook.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<BookInfo>? records;
  int? total;
  int? size;
  int? current;
  bool? optimizeCountSql;
  bool? searchCount;
  int? pages;

  Data(
      {this.records,
      this.total,
      this.size,
      this.current,
      this.optimizeCountSql,
      this.searchCount,
      this.pages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <BookInfo>[];
      json['records'].forEach((v) {
        records!.add(BookInfo.fromJson(v));
      });
    }
    total = json['total'];
    size = json['size'];
    current = json['current'];
    optimizeCountSql = json['optimizeCountSql'];
    searchCount = json['searchCount'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (records != null) {
      data['records'] = records!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['size'] = this.size;
    data['current'] = this.current;
    data['searchCount'] = this.searchCount;
    data['pages'] = this.pages;
    return data;
  }
}
