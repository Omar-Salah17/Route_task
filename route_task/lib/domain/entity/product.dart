class ProductResponseEntity {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  DimensionsEntity? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<ReviewsEntity>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  MetaEntity? meta;
  List<String>? images;
  String? thumbnail;

  ProductResponseEntity({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });
}

class DimensionsEntity {
  double? width;
  double? height;
  double? depth;

  DimensionsEntity({this.width, this.height, this.depth});
}

class ReviewsEntity {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  ReviewsEntity({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });
}

class MetaEntity {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  MetaEntity({this.createdAt, this.updatedAt, this.barcode, this.qrCode});
}
