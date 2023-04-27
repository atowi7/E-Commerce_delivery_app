class OrdersDetailsModel {
  String? prosPrice;
  String? prosCount;
  String? proId;
  String? proName;
  String? proNameAr;
  String? proDescription;
  String? proDescriptionAr;
  String? proImage;
  String? proPrice;
  String? proDiscount;
  String? proActive;
  String? proCount;
  String? proCreatedat;
  String? catId;
  String? cartId;
  String? cartUserid;
  String? cartProid;
  String? cartOrdersid;

  OrdersDetailsModel(
      {this.prosPrice,
      this.prosCount,
      this.proId,
      this.proName,
      this.proNameAr,
      this.proDescription,
      this.proDescriptionAr,
      this.proImage,
      this.proPrice,
      this.proDiscount,
      this.proActive,
      this.proCount,
      this.proCreatedat,
      this.catId,
      this.cartId,
      this.cartUserid,
      this.cartProid,
      this.cartOrdersid});

  OrdersDetailsModel.fromJson(json) {
    prosPrice = json['pros_price'];
    prosCount = json['pros_count'];
    proId = json['pro_id'];
    proName = json['pro_name'];
    proNameAr = json['pro_name_ar'];
    proDescription = json['pro_description'];
    proDescriptionAr = json['pro_description_ar'];
    proImage = json['pro_image'];
    proPrice = json['pro_price'];
    proDiscount = json['pro_discount'];
    proActive = json['pro_active'];
    proCount = json['pro_count'];
    proCreatedat = json['pro_createdat'];
    catId = json['cat_id'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartProid = json['cart_proid'];
    cartOrdersid = json['cart_ordersid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['pros_price'] = prosPrice;
    data['pros_count'] = prosCount;
    data['pro_id'] = proId;
    data['pro_name'] = proName;
    data['pro_name_ar'] = proNameAr;
    data['pro_description'] = proDescription;
    data['pro_description_ar'] = proDescriptionAr;
    data['pro_image'] = proImage;
    data['pro_price'] = proPrice;
    data['pro_discount'] = proDiscount;
    data['pro_active'] = proActive;
    data['pro_count'] = proCount;
    data['pro_createdat'] = proCreatedat;
    data['cat_id'] = catId;
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_proid'] = cartProid;
    data['cart_ordersid'] = cartOrdersid;
    return data;
  }
}
