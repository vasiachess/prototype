class ReceivingDeliveryResponse {
  String jsonrpc;
  int id;
  Result result;

  ReceivingDeliveryResponse({this.jsonrpc, this.id, this.result});

  ReceivingDeliveryResponse.fromJson(Map<String, dynamic> json) {
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
  String error;

  Result({this.status, this.error});

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    return data;
  }
}
