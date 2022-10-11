class ProductModel {
  final String? id;
  final String? name;
  final String? description;
  final double? price;
  final List<String>? images;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.images,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        price = json['price'] as double?,
        images =
            (json['images'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'description': description,
        'price': price,
        'images': images,
      };
}
