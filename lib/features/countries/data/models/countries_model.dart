class CountriesModel {
  int? status;
  bool? success;
  List<Data>? data;
  Pagination? pagination;

  CountriesModel({this.status, this.success, this.data, this.pagination});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? countryCode;
  String? name;
  String? capital;

  Data({this.id, this.countryCode, this.name, this.capital});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryCode = json['country_code'];
    name = json['name'];
    capital = json['capital'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_code'] = this.countryCode;
    data['name'] = this.name;
    data['capital'] = this.capital;
    return data;
  }
}

class Pagination {
  int? count;
  int? total;
  int? perPage;
  int? currentPage;
  int? totalPages;
  Links? links;

  Pagination(
      {this.count,
        this.total,
        this.perPage,
        this.currentPage,
        this.totalPages,
        this.links});

  Pagination.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    total = json['total'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['total'] = this.total;
    data['perPage'] = this.perPage;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    return data;
  }
}

class Links {
  String? next;

  Links({this.next});

  Links.fromJson(Map<String, dynamic> json) {
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    return data;
  }
}
