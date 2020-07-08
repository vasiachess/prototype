class DeliveryItem {
  int id;
  int materialId;
  String materialNameEn;
  String materialNameAr;
  int quantity;
  String warehouse;

  DeliveryItem(
      {this.id,
        this.materialId,
        this.materialNameEn,
        this.materialNameAr,
        this.quantity,
        this.warehouse});

  DeliveryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materialId = json['material_id'];
    materialNameEn = json['material_name_en'];
    materialNameAr = json['material_name_ar'];
    quantity = json['quantity'];
    warehouse = json['warehouse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['material_id'] = this.materialId;
    data['material_name_en'] = this.materialNameEn;
    data['material_name_ar'] = this.materialNameAr;
    data['quantity'] = this.quantity;
    data['warehouse'] = this.warehouse;
    return data;
  }
}