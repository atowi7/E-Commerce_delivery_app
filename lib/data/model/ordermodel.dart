class OrderModel {
  String? ordersId;
  String? ordersPrice;
  String? ordersDeliveryprice;
  String? ordersTotalprice;
  String? ordersCouponid;
  String? ordersCoupondiscount;
  String? ordersPaymentmethod;
  String? ordersRate;
  String? ordersRatenote;
  String? ordersType;
  String? ordersStatus;
  String? ordersCreatedat;
  String? ordersDeleted;
  String? ordersAddressid;
  String? ordersUserid;
  String? addressId;
  String? addressName;
  String? addressLat;
  String? addressLong;
  String? addressStreet;
  String? addressCity;
  String? addressUserid;

  OrderModel({
    this.ordersId,
    this.ordersPrice,
    this.ordersDeliveryprice,
    this.ordersTotalprice,
    this.ordersCouponid,
    this.ordersCoupondiscount,
    this.ordersPaymentmethod,
    this.ordersRate,
    this.ordersRatenote,
    this.ordersType,
    this.ordersStatus,
    this.ordersCreatedat,
    this.ordersDeleted,
    this.ordersAddressid,
    this.ordersUserid,
    this.addressId,
    this.addressName,
    this.addressLat,
    this.addressLong,
    this.addressStreet,
    this.addressCity,
    this.addressUserid,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersPrice = json['orders_price'];
    ordersDeliveryprice = json['orders_deliveryprice'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCouponid = json['orders_couponid'];
    ordersCoupondiscount = json['orders_coupondiscount'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersRate = json['orders_rate'];
    ordersRatenote = json['orders_ratenote'];
    ordersType = json['orders_type'];
    ordersStatus = json['orders_status'];
    ordersCreatedat = json['orders_createdat'];
    ordersDeleted = json['orders_deleted'];
    ordersAddressid = json['orders_addressid'];
    ordersUserid = json['orders_userid'];
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressStreet = json['address_street'];
    addressCity = json['address_city'];
    addressUserid = json['address_userid'];
  }
}
