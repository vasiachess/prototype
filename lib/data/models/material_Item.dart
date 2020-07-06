class MaterialItem {

  String id;
  String nameEn;
  String nameAr;
  String unitOfMeasure;
  String status;

  MaterialItem({this.id, this.nameEn, this.nameAr, this.unitOfMeasure, this.status,});

  MaterialItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    unitOfMeasure = json['unitOfMeasure'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameEn'] = this.nameEn;
    data['nameAr'] = this.nameAr;
    data['unitOfMeasure'] = this.unitOfMeasure;
    data['status'] = this.status;
    return data;
  }
}