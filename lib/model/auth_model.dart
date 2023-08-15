class AuthModel {
  String? status;
  DataAuth? data;
  String? message;

  AuthModel({this.status, this.data, this.message});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? DataAuth.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class DataAuth {
  int? id;
  String? name;
  String? email;
  String? apiToken;
  String? role;
  String? gender;
  String? birthPlace;
  String? birthDate;
  dynamic createdAt;
  String? updatedAt;

  DataAuth({
    this.id,
    this.name,
    this.email,
    this.apiToken,
    this.role,
    this.gender,
    this.birthPlace,
    this.birthDate,
    this.createdAt,
    this.updatedAt,
  });

  DataAuth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    apiToken = json['api_token'];
    role = json['role'];
    gender = json['gender'];
    birthPlace = json['birth_place'];
    birthDate = json['birth_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['api_token'] = this.apiToken;
    data['role'] = this.role;
    data['gender'] = this.gender;
    data['birth_place'] = this.birthPlace;
    data['birth_date'] = this.birthDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
