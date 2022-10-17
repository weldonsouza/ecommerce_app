class CommentsModel {
  final String? id;
  final String? name;
  final String? comment;
  final String? photo;
  final double? review;
  final String? date;

  CommentsModel({
    this.id,
    this.name,
    this.comment,
    this.photo,
    this.review,
    this.date,
  });

  CommentsModel.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        comment = json['comment'] as String?,
        photo = json['photo'] as String?,
        review = json['review'] as double?,
        date = json['date'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'comment': comment,
        'photo': photo,
        'review': review,
        'date': date,
      };
}
