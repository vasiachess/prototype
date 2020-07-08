class Material {
  int id;
  String nameEn;
  String nameAr;
  String unitOfMeasure;
  String status;
  int quantityOnhand;
  int quantityForecast;

  Material({this.id, this.nameEn, this.nameAr, this.unitOfMeasure, this.status, this.quantityOnhand, this.quantityForecast});

  Material.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    unitOfMeasure = json['unit_of_measure'];
    status = json['status'];
    quantityOnhand = json['quantity_onhand'];
    quantityForecast = json['quantity_forecast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['unit_of_measure'] = this.unitOfMeasure;
    data['status'] = this.status;
    data['quantity_onhand'] = this.quantityOnhand;
    data['quantity_forecast'] = this.quantityForecast;
    return data;
  }

}