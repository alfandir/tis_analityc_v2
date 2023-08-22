class ClubModel {
  String? status;
  List<DataClub>? data;
  String? message;

  ClubModel({this.status, this.data, this.message});

  ClubModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataClub>[];
      json['data'].forEach((v) {
        data!.add(DataClub.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class DataClub {
  int? id;
  String? name;
  String? userId;
  String? createdAt;
  String? updatedAt;
  List<AgeGroups>? ageGroups;

  DataClub(
      {this.id,
      this.name,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.ageGroups});

  DataClub.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['age_groups'] != null) {
      ageGroups = <AgeGroups>[];
      json['age_groups'].forEach((v) {
        ageGroups!.add(AgeGroups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (ageGroups != null) {
      data['age_groups'] = ageGroups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AgeGroups {
  int? id;
  String? name;
  String? clubId;
  String? createdAt;
  String? updatedAt;

  AgeGroups({this.id, this.name, this.clubId, this.createdAt, this.updatedAt});

  AgeGroups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    clubId = json['club_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['club_id'] = clubId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
