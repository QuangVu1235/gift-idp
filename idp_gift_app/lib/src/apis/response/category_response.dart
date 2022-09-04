
class Categories {
  int? id;
  String? code;
  String? name;
  String? slug;
  String? description;
  String? type;
  String? sortOrder;
  int? order;
  String? parentId;
  int? imageId;
  String? storeId;
  int? areaId;
  int? syncZalo;
  String? zaloId;
  String? data;
  int? isActive;
  int? deleted;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? deletedAt;
  String? deletedBy;
  int? categoryPublish;
  int? productPublish;
  int? isCategoryGift;

  Categories(
      {this.id,
        this.code,
        this.name,
        this.slug,
        this.description,
        this.type,
        this.sortOrder,
        this.order,
        this.parentId,
        this.imageId,
        this.storeId,
        this.areaId,
        this.syncZalo,
        this.zaloId,
        this.data,
        this.isActive,
        this.deleted,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.deletedAt,
        this.deletedBy,
        this.categoryPublish,
        this.productPublish,
        this.isCategoryGift});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    type = json['type'];
    sortOrder = json['sort_order'];
    order = json['order'];
    parentId = json['parent_id'];
    imageId = json['image_id'];
    storeId = json['store_id'];
    areaId = json['area_id'];
    syncZalo = json['sync_zalo'];
    zaloId = json['zalo_id'];
    data = json['data'];
    isActive = json['is_active'];
    deleted = json['deleted'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    deletedBy = json['deleted_by'];
    categoryPublish = json['category_publish'];
    productPublish = json['product_publish'];
    isCategoryGift = json['is_category_gift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['type'] = this.type;
    data['sort_order'] = this.sortOrder;
    data['order'] = this.order;
    data['parent_id'] = this.parentId;
    data['image_id'] = this.imageId;
    data['store_id'] = this.storeId;
    data['area_id'] = this.areaId;
    data['sync_zalo'] = this.syncZalo;
    data['zalo_id'] = this.zaloId;
    data['data'] = this.data;
    data['is_active'] = this.isActive;
    data['deleted'] = this.deleted;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['deleted_at'] = this.deletedAt;
    data['deleted_by'] = this.deletedBy;
    data['category_publish'] = this.categoryPublish;
    data['product_publish'] = this.productPublish;
    data['is_category_gift'] = this.isCategoryGift;
    return data;
  }
}
