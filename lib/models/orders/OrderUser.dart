import '../catalogs/Product.dart';
import '../users/User.dart';

class OrderUser {

  int? id;
  Product? product;
  User? user;
  int? quantity;
  double? price;
  bool? sold;
  String? datecraete;

  OrderUser({
      this.id, 
      this.product, 
      this.user,
      this.quantity, 
      this.price, 
      this.sold, 
      this.datecraete,});

  OrderUser.fromJson(dynamic json) {
    id = json['id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    user = json['userApp'] != null ? User.fromJson(json['userApp']) : null;
    quantity = json['quantity'];
    price = json['price'];
    sold = json['sold'];
    datecraete = json['datecraete'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (product != null) {
      map['product'] = product!.toJson();
    }
    if (user != null) {
      map['userApp'] = user!.toJson();
    }
    map['quantity'] = quantity;
    map['price'] = price;
    map['sold'] = sold;
    return map;
  }

}