import '../../../core/utils/enums.dart';

class MyOrderModel {
  final String? id;
  final String? orderNumber;
  final String? trackingNumber;
  final String? quantity;
  final String? totalAmount;
  final String? status;
  final String? date;
  final List<String>? historic;
  final String? shoppingAddress;
  final BrandEnum? paymentMethod;
  final String? cardNumber;
  final String? deliveryMethod;

  MyOrderModel({
    this.id,
    this.orderNumber,
    this.trackingNumber,
    this.quantity,
    this.totalAmount,
    this.status,
    this.date,
    this.historic,
    this.shoppingAddress,
    this.paymentMethod,
    this.cardNumber,
    this.deliveryMethod,
  });

  MyOrderModel.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        orderNumber = json['orderNumber'] as String?,
        trackingNumber = json['trackingNumber'] as String?,
        quantity = json['quantity'] as String?,
        totalAmount = json['totalAmount'] as String?,
        status = json['status'] as String?,
        date = json['date'] as String?,
        historic = (json['historic'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        shoppingAddress = json['shoppingAddress'] as String?,
        paymentMethod = json['paymentMethod'] as BrandEnum?,
        cardNumber = json['cardNumber'] as String?,
        deliveryMethod = json['deliveryMethod'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'orderNumber': orderNumber,
        'trackingNumber': trackingNumber,
        'quantity': quantity,
        'totalAmount': totalAmount,
        'status': status,
        'date': date,
        'historic': historic,
        'shoppingAddress': shoppingAddress,
        'paymentMethod': paymentMethod,
        'cardNumber': cardNumber,
        'deliveryMethod': deliveryMethod,
      };
}
