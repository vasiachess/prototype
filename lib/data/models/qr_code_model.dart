class QrCodeModel {
  int materialId;
  String sessionId;

  QrCodeModel({this.materialId, this.sessionId});

  QrCodeModel.fromJson(Map<String, dynamic> json) {
    materialId = json['materialId'] ?? 0;
    sessionId = json['sessionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['materialId'] = this.materialId;
    data['sessionId'] = this.sessionId;
    return data;
  }
}