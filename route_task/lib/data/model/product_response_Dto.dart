import 'package:route_task/domain/entity/product.dart';

class ProductResponseDto extends ProductResponseEntity {
  ProductResponseDto({
    int? id,
    String? title,
    String? description,
    String? category,
    num? price,
    num? discountPercentage,
    num? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    DimensionsDto? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<ReviewsDto>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    MetaDto? meta,
    List<String>? images,
    String? thumbnail,
  }) : super(
          id: id,
          title: title,
          description: description,
          category: category,
          price: price,
          discountPercentage: discountPercentage,
          rating: rating,
          stock: stock,
          tags: tags,
          brand: brand,
          sku: sku,
          weight: weight,
          dimensions: dimensions,
          warrantyInformation: warrantyInformation,
          shippingInformation: shippingInformation,
          availabilityStatus: availabilityStatus,
          reviews: reviews,
          returnPolicy: returnPolicy,
          minimumOrderQuantity: minimumOrderQuantity,
          meta: meta,
          images: images,
          thumbnail: thumbnail,
        );

  ProductResponseDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    tags = json['tags'].cast<String>();
    brand = json['brand'];
    sku = json['sku'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null
        ? DimensionsDto.fromJson(json['dimensions'])
        : null;
    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];
    if (json['reviews'] != null) {
      reviews = <ReviewsDto>[];
      json['reviews'].forEach((v) {
        reviews!.add(ReviewsDto.fromJson(v));
      });
    }
    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = json['minimumOrderQuantity'];
    meta = json['meta'] != null ? MetaDto.fromJson(json['meta']) : null;
    images = json['images'].cast<String>();
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['tags'] = tags;
    data['brand'] = brand;
    data['sku'] = sku;
    data['weight'] = weight;
    if (dimensions != null) {
      data['dimensions'] = dimensions!.toJson();
    }
    data['warrantyInformation'] = warrantyInformation;
    data['shippingInformation'] = shippingInformation;
    data['availabilityStatus'] = availabilityStatus;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['returnPolicy'] = returnPolicy;
    data['minimumOrderQuantity'] = minimumOrderQuantity;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['images'] = images;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

class DimensionsDto extends DimensionsEntity {
  DimensionsDto({num? width, num? height, num? depth})
      : super(width: width, height: height, depth: depth);

  DimensionsDto.fromJson(Map<String, dynamic> json)
      : super(
          width: json['width'],
          height: json['height'],
          depth: json['depth'],
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['width'] = width;
    data['height'] = height;
    data['depth'] = depth;
    return data;
  }
}

class ReviewsDto extends ReviewsEntity {
  ReviewsDto({
    int? rating,
    String? comment,
    String? date,
    String? reviewerName,
    String? reviewerEmail,
  }) : super(
          rating: rating,
          comment: comment,
          date: date,
          reviewerName: reviewerName,
          reviewerEmail: reviewerEmail,
        );

  ReviewsDto.fromJson(Map<String, dynamic> json)
      : super(
          rating: json['rating'],
          comment: json['comment'],
          date: json['date'],
          reviewerName: json['reviewerName'],
          reviewerEmail: json['reviewerEmail'],
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['comment'] = comment;
    data['date'] = date;
    data['reviewerName'] = reviewerName;
    data['reviewerEmail'] = reviewerEmail;
    return data;
  }
}

class MetaDto extends MetaEntity {
  MetaDto({
    String? createdAt,
    String? updatedAt,
    String? barcode,
    String? qrCode,
  }) : super(
          createdAt: createdAt,
          updatedAt: updatedAt,
          barcode: barcode,
          qrCode: qrCode,
        );

  MetaDto.fromJson(Map<String, dynamic> json)
      : super(
          createdAt: json['createdAt'],
          updatedAt: json['updatedAt'],
          barcode: json['barcode'],
          qrCode: json['qrCode'],
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['barcode'] = barcode;
    data['qrCode'] = qrCode;
    return data;
  }
}
