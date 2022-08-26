class DataCategories {
  List<Categories>? data;

  DataCategories({this.data});

  DataCategories.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Categories>[];
      json['data'].forEach((v) {
        data!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? code;
  String? name;
  String? slug;
  int? order;
  String? sortOrder;
  String? description;
  int? areaId;
  Area? area;
  String? parentId;
  String? parentCode;
  String? parentName;
  String? imageUrl;
  // List<Null>? data;
  dynamic imageId;
  int? categoryPublish;
  int? productPublish;
  int? isActive;
  List<StoreDetails>? storeDetails;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
        this.code,
        this.name,
        this.slug,
        this.order,
        this.sortOrder,
        this.description,
        this.areaId,
        this.area,
        this.parentId,
        this.parentCode,
        this.parentName,
        this.imageUrl,
        // this.data,
        this.imageId,
        this.categoryPublish,
        this.productPublish,
        this.isActive,
        this.storeDetails,
        this.createdAt,
        this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    slug = json['slug'];
    order = json['order'];
    sortOrder = json['sort_order'];
    description = json['description'];
    areaId = json['area_id'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    parentId = json['parent_id'];
    parentCode = json['parent_code'];
    parentName = json['parent_name'];
    imageUrl = json['image_url'];
    // if (json['data'] != null) {
    //   data = <Null>[];
    //   json['data'].forEach((v) {
    //     data!.add(new Null.fromJson(v));
    //   });
    // }
    imageId = json['image_id'];
    categoryPublish = json['category_publish'];
    productPublish = json['product_publish'];
    isActive = json['is_active'];
    if (json['store_details'] != null) {
      storeDetails = <StoreDetails>[];
      json['store_details'].forEach((v) {
        storeDetails!.add(new StoreDetails.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['order'] = this.order;
    data['sort_order'] = this.sortOrder;
    data['description'] = this.description;
    data['area_id'] = this.areaId;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    data['parent_id'] = this.parentId;
    data['parent_code'] = this.parentCode;
    data['parent_name'] = this.parentName;
    data['image_url'] = this.imageUrl;
    // if (this.data != null) {
    //   data['data'] = this.data!.map((v) => v.toJson()).toList();
    // }
    data['image_id'] = this.imageId;
    data['category_publish'] = this.categoryPublish;
    data['product_publish'] = this.productPublish;
    data['is_active'] = this.isActive;
    if (this.storeDetails != null) {
      data['store_details'] =
          this.storeDetails!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Area {
  int? id;
  String? name;

  Area({this.id, this.name});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class StoreDetails {
  int? id;
  int? categoryId;
  int? storeId;
  String? storeCode;
  String? storeName;
  String? zaloCategoryId;
  String? syncZalo;
  String? createdAt;
  String? updatedAt;

  StoreDetails(
      {this.id,
        this.categoryId,
        this.storeId,
        this.storeCode,
        this.storeName,
        this.zaloCategoryId,
        this.syncZalo,
        this.createdAt,
        this.updatedAt});

  StoreDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    storeId = json['store_id'];
    storeCode = json['store_code'];
    storeName = json['store_name'];
    zaloCategoryId = json['zalo_category_id'];
    syncZalo = json['sync_zalo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['store_id'] = this.storeId;
    data['store_code'] = this.storeCode;
    data['store_name'] = this.storeName;
    data['zalo_category_id'] = this.zaloCategoryId;
    data['sync_zalo'] = this.syncZalo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}