class PromoModel {
  final String? id;
  final String? name;
  final String? description;
  final String? image;
  final String? couponValue;

  PromoModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.couponValue,
  });

  PromoModel.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        image = json['image'] as String?,
        couponValue = json['couponCode'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'description': description,
        'image': image,
        'couponCode': couponValue,
      };
}
