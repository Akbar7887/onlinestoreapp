import 'dart:collection';

import 'package:onlinestoreapp/models/calculate/Price.dart';

import 'Catalog.dart';
import 'Characteristic.dart';
import 'ProductImage.dart';

class Product {
  int? id;
  String? name;
  String? description;
  // dynamic? imagepath;
  // String? active;
  List<ProductImage>? productImages;

   List<Characteristic>? characteristics;
  Catalog? catalog;
  List<Price>? prices;
  double? markuser;
  int? marksize;
  String? codeproduct;

  Product(
      {this.id,
      this.name,
      this.description,
      // this.imagepath,
      // this.active,
      this.productImages,
      this.characteristics,
      this.prices,
      this.markuser,
      this.marksize,
      this.catalog,
      this.codeproduct});

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    // imagepath = json['imagepath'];
    // active = json['active'];
    if (json['productImages'] != null) {
      productImages = [];
      json['productImages'].forEach((v) {
        productImages!.add(ProductImage.fromJson(v));
      });
    }
    if (json['characteristics'] != null) {
      characteristics = [];
      json['characteristics'].forEach((c) {
        characteristics!.add(Characteristic.fromJson(c));
      });
    }
    if (json['prices'] != null) {
      prices = [];
      json['prices'].forEach((c) {
        prices!.add(Price.fromJson(c));
      });
    }
    catalog =
        json['catalog'] != null ? Catalog.fromJson(json['catalog']) : null;
    markuser = json['markuser'];
    marksize = json['marksize'];
    codeproduct = json['codeproduct'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    // map['imagepath'] = imagepath;
    // map['active'] = active;
    if (productImages != null) {
      map['productImages'] = productImages!.map((v) => v.toJson()).toList();
    }
    if (characteristics != null) {
      map['characteristics'] = characteristics!.map((v) => v.toJson()).toList();
    }
    if (prices != null) {
      map['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    if (this.catalog != null) {
      map['catalog'] = this.catalog!.toJson();
    }
    map['markuser'] = markuser;
    map['marksize'] = marksize;
    map['codeproduct'] = codeproduct;

    return map;
  }
}
