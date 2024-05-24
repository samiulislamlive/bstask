class GitStarModel {
  int? totalCount;
  bool? incompleteResults;
  List<Items>? items;

  GitStarModel({this.totalCount, this.incompleteResults, this.items});

  GitStarModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['incomplete_results'] = this.incompleteResults;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? name;
  String? fullName;
  String? htmlUrl;
  String? description;
  int? stargazersCount;
  String? updatedAt;
  Owner? owner;

  Items({
    this.id,
    this.name,
    this.fullName,
    this.htmlUrl,
    this.description,
    this.stargazersCount,
    this.updatedAt,
    this.owner,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    htmlUrl = json['html_url'];
    description = json['description'];
    stargazersCount = json['stargazers_count'];
    updatedAt = json['updated_at'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['html_url'] = this.htmlUrl;
    data['description'] = this.description;
    data['stargazers_count'] = this.stargazersCount;
    data['updated_at'] = this.updatedAt;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    return data;
  }
}

class Owner {
  String? login;
  String? avatarUrl;

  Owner({this.login, this.avatarUrl});

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}
