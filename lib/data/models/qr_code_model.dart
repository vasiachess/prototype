class QrCodeModel {
  int materialId;
  String serialNumber;

  QrCodeModel({this.materialId, this.serialNumber});

  QrCodeModel.fromJson(Map<String, dynamic> json) {
    materialId = json['materialId'] ?? 0;
    serialNumber = json['serialNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['materialId'] = this.materialId;
    data['serialNumber'] = this.serialNumber;
    return data;
  }
}