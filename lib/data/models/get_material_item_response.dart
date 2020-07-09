import 'package:stackedprototype/data/models/material.dart';

class GetMaterialItemResponse {
  String jsonrpc;
  int id;
  Result result;

  GetMaterialItemResponse({this.jsonrpc, this.id, this.result});

  GetMaterialItemResponse.fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jsonrpc'] = this.jsonrpc;
    data['id'] = this.id;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  String status;
  Material material;

  Result({this.status, this.material});

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    material = json['material'] != null
        ? new Material.fromJson(json['material'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.material != null) {
      data['material'] = this.material.toJson();
    }
    return data;
  }
}

