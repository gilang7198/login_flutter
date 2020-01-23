import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/components/constant.dart';

Future<ProspectModel> fetchProspect(int userId, String token) async{
  try {
    http.Response  response = await http.get(
      "$baseUrlMain/leads/getbyuserId?user_id=$userId",
      headers: {
          "token" : "$token"
      }
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      var data = {"results" : jsonData};
      print("okeokeoke = $data");
      return ProspectModel.fromJson(data);
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<ProspectHistoryModel> fetchProspectHistory(int userId, int leadId, String token) async{
  print("$baseUrlMain/leads/masalampau?user_id=$userId&lead_id=$leadId");
  try {
    http.Response  response = await http.get(
      "$baseUrlMain/leads/masalampau?user_id=$userId&lead_id=$leadId",
      headers: {
          "token" : "$token"
      }
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      var data = {"results" : jsonData};
      print("okeokeoke = $data");
      return ProspectHistoryModel.fromJson(data);
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

class ProspectModel {
    List<ProspectList> results;

    ProspectModel({
        this.results,
    });

    factory ProspectModel.fromJson(Map<String, dynamic> json) => ProspectModel(
        results: json["results"] == null ? null : List<ProspectList>.from(json["results"].map((x) => ProspectList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class ProspectList {
    int id;
    bool isEvent;
    int userId;
    int statusId;
    String statusName;
    int locationId;
    String locationName;
    int resourceId;
    String resourceName;
    int vehicleId;
    String vehicleName;
    int planId;
    String planName;
    int quantity;
    bool needSpk;
    int customerId;
    String customerCode;
    int customerType;
    String name;
    String address;
    String phone;
    String description;
    String image;
    String nomorSo;
    DateTime tanggalSo;
    int paymentTypeId;
    String payment;
    double totalDp;
    bool iscash;
    String paymentType;
    String nomorDo;
    DateTime tanggalDo;
    int leasingId;
    String leasing;
    bool isdraft;
    DateTime createdDate;
    String createdUserName;
    DateTime updatedDate;
    String updatedUserName;
    String color;

    ProspectList({
        this.id,
        this.isEvent,
        this.userId,
        this.statusId,
        this.statusName,
        this.locationId,
        this.locationName,
        this.resourceId,
        this.resourceName,
        this.vehicleId,
        this.vehicleName,
        this.planId,
        this.planName,
        this.quantity,
        this.needSpk,
        this.customerId,
        this.customerCode,
        this.customerType,
        this.name,
        this.address,
        this.phone,
        this.description,
        this.image,
        this.nomorSo,
        this.tanggalSo,
        this.paymentTypeId,
        this.payment,
        this.totalDp,
        this.iscash,
        this.paymentType,
        this.nomorDo,
        this.tanggalDo,
        this.leasingId,
        this.leasing,
        this.isdraft,
        this.createdDate,
        this.createdUserName,
        this.updatedDate,
        this.updatedUserName,
        this.color,
    });

    factory ProspectList.fromJson(Map<String, dynamic> json) => ProspectList(
        id: json["ID"] == null ? null : json["ID"],
        isEvent: json["IS_EVENT"] == null ? null : json["IS_EVENT"],
        userId: json["USER_ID"] == null ? null : json["USER_ID"],
        statusId: json["STATUS_ID"] == null ? null : json["STATUS_ID"],
        statusName: json["STATUS_NAME"] == null ? null : json["STATUS_NAME"],
        locationId: json["LOCATION_ID"] == null ? null : json["LOCATION_ID"],
        locationName: json["LOCATION_NAME"] == null ? null : json["LOCATION_NAME"],
        resourceId: json["RESOURCE_ID"] == null ? null : json["RESOURCE_ID"],
        resourceName: json["RESOURCE_NAME"] == null ? null : json["RESOURCE_NAME"],
        vehicleId: json["VEHICLE_ID"] == null ? null : json["VEHICLE_ID"],
        vehicleName: json["VEHICLE_NAME"] == null ? null : json["VEHICLE_NAME"],
        planId: json["PLAN_ID"] == null ? null : json["PLAN_ID"],
        planName: json["PLAN_NAME"] == null ? null : json["PLAN_NAME"],
        quantity: json["QUANTITY"] == null ? null : json["QUANTITY"],
        needSpk: json["NEED_SPK"] == null ? null : json["NEED_SPK"],
        customerId: json["CUSTOMER_ID"] == null ? null : json["CUSTOMER_ID"],
        customerCode: json["CUSTOMER_CODE"] == null ? null : json["CUSTOMER_CODE"],
        customerType: json["CUSTOMER_TYPE"] == null ? null : json["CUSTOMER_TYPE"],
        name: json["NAME"] == null ? null : json["NAME"],
        address: json["ADDRESS"] == null ? null : json["ADDRESS"],
        phone: json["PHONE"] == null ? null : json["PHONE"],
        description: json["DESCRIPTION"] == null ? null : json["DESCRIPTION"],
        image: json["IMAGE"] == null ? null : json["IMAGE"],
        nomorSo: json["NOMOR_SO"] == null ? null : json["NOMOR_SO"],
        tanggalSo: json["TANGGAL_SO"] == null ? null : DateTime.parse(json["TANGGAL_SO"]),
        paymentTypeId: json["PAYMENT_TYPE_ID"] == null ? null : json["PAYMENT_TYPE_ID"],
        payment: json["PAYMENT"] == null ? null : json["PAYMENT"],
        totalDp: json["TOTAL_DP"] == null ? null : json["TOTAL_DP"],
        iscash: json["ISCASH"] == null ? null : json["ISCASH"],
        paymentType: json["PAYMENT_TYPE"] == null ? null : json["PAYMENT_TYPE"],
        nomorDo: json["NOMOR_DO"] == null ? null : json["NOMOR_DO"],
        tanggalDo: json["TANGGAL_DO"] == null ? null : DateTime.parse(json["TANGGAL_DO"]),
        leasingId: json["LEASING_ID"] == null ? null : json["LEASING_ID"],
        leasing: json["LEASING"] == null ? null : json["LEASING"],
        isdraft: json["ISDRAFT"] == null ? null : json["ISDRAFT"],
        createdDate: json["CREATED_DATE"] == null ? null : DateTime.parse(json["CREATED_DATE"]),
        createdUserName: json["CREATED_USER_NAME"] == null ? null : json["CREATED_USER_NAME"],
        updatedDate: json["UPDATED_DATE"] == null ? null : DateTime.parse(json["UPDATED_DATE"]),
        updatedUserName: json["UPDATED_USER_NAME"] == null ? null : json["UPDATED_USER_NAME"],
        color: json["Color"] == null ? null : json["Color"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "IS_EVENT": isEvent == null ? null : isEvent,
        "USER_ID": userId == null ? null : userId,
        "STATUS_ID": statusId == null ? null : statusId,
        "STATUS_NAME": statusName == null ? null : statusName,
        "LOCATION_ID": locationId == null ? null : locationId,
        "LOCATION_NAME": locationName == null ? null : locationName,
        "RESOURCE_ID": resourceId == null ? null : resourceId,
        "RESOURCE_NAME": resourceName == null ? null : resourceName,
        "VEHICLE_ID": vehicleId == null ? null : vehicleId,
        "VEHICLE_NAME": vehicleName == null ? null : vehicleName,
        "PLAN_ID": planId == null ? null : planId,
        "PLAN_NAME": planName == null ? null : planName,
        "QUANTITY": quantity == null ? null : quantity,
        "NEED_SPK": needSpk == null ? null : needSpk,
        "CUSTOMER_ID": customerId == null ? null : customerId,
        "CUSTOMER_CODE": customerCode == null ? null : customerCode,
        "CUSTOMER_TYPE": customerType == null ? null : customerType,
        "NAME": name == null ? null : name,
        "ADDRESS": address == null ? null : address,
        "PHONE": phone == null ? null : phone,
        "DESCRIPTION": description == null ? null : description,
        "IMAGE": image == null ? null : image,
        "NOMOR_SO": nomorSo == null ? null : nomorSo,
        "TANGGAL_SO": tanggalSo == null ? null : tanggalSo.toIso8601String(),
        "PAYMENT_TYPE_ID": paymentTypeId == null ? null : paymentTypeId,
        "PAYMENT": payment == null ? null : payment,
        "TOTAL_DP": totalDp == null ? null : totalDp,
        "ISCASH": iscash == null ? null : iscash,
        "PAYMENT_TYPE": paymentType == null ? null : paymentType,
        "NOMOR_DO": nomorDo == null ? null : nomorDo,
        "TANGGAL_DO": tanggalDo == null ? null : tanggalDo.toIso8601String(),
        "LEASING_ID": leasingId == null ? null : leasingId,
        "LEASING": leasing == null ? null : leasing,
        "ISDRAFT": isdraft == null ? null : isdraft,
        "CREATED_DATE": createdDate == null ? null : createdDate.toIso8601String(),
        "CREATED_USER_NAME": createdUserName == null ? null : createdUserName,
        "UPDATED_DATE": updatedDate == null ? null : updatedDate.toIso8601String(),
        "UPDATED_USER_NAME": updatedUserName == null ? null : updatedUserName,
        "Color": color == null ? null : color,
    };
}

class ProspectHistoryModel {
    List<ProspectHistory> results;

    ProspectHistoryModel({
        this.results,
    });

    factory ProspectHistoryModel.fromJson(Map<String, dynamic> json) => ProspectHistoryModel(
        results: json["results"] == null ? null : List<ProspectHistory>.from(json["results"].map((x) => ProspectHistory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class ProspectHistory {
    int id;
    int leadId;
    int dealerId;
    int userId;
    CreatedUsername pic;
    int spvId;
    SpvName spvName;
    int kacabId;
    KacabName kacabName;
    int statusId;
    String statusName;
    Remarks remarks;
    bool byadmin;
    DateTime createdDate;
    CreatedUsername createdUsername;
    int paymentType;
    int leasingId;
    dynamic color;

    ProspectHistory({
        this.id,
        this.leadId,
        this.dealerId,
        this.userId,
        this.pic,
        this.spvId,
        this.spvName,
        this.kacabId,
        this.kacabName,
        this.statusId,
        this.statusName,
        this.remarks,
        this.byadmin,
        this.createdDate,
        this.createdUsername,
        this.paymentType,
        this.leasingId,
        this.color,
    });

    factory ProspectHistory.fromJson(Map<String, dynamic> json) => ProspectHistory(
        id: json["ID"] == null ? null : json["ID"],
        leadId: json["LEAD_ID"] == null ? null : json["LEAD_ID"],
        dealerId: json["DEALER_ID"] == null ? null : json["DEALER_ID"],
        userId: json["USER_ID"] == null ? null : json["USER_ID"],
        pic: json["PIC"] == null ? null : createdUsernameValues.map[json["PIC"]],
        spvId: json["SPV_ID"] == null ? null : json["SPV_ID"],
        spvName: json["SPV_NAME"] == null ? null : spvNameValues.map[json["SPV_NAME"]],
        kacabId: json["KACAB_ID"] == null ? null : json["KACAB_ID"],
        kacabName: json["KACAB_NAME"] == null ? null : kacabNameValues.map[json["KACAB_NAME"]],
        statusId: json["STATUS_ID"] == null ? null : json["STATUS_ID"],
        statusName: json["STATUS_NAME"] == null ? null : json["STATUS_NAME"],
        remarks: json["REMARKS"] == null ? null : remarksValues.map[json["REMARKS"]],
        byadmin: json["BYADMIN"] == null ? null : json["BYADMIN"],
        createdDate: json["CREATED_DATE"] == null ? null : DateTime.parse(json["CREATED_DATE"]),
        createdUsername: json["CREATED_USERNAME"] == null ? null : createdUsernameValues.map[json["CREATED_USERNAME"]],
        paymentType: json["payment_type"] == null ? null : json["payment_type"],
        leasingId: json["leasing_id"] == null ? null : json["leasing_id"],
        color: json["Color"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "LEAD_ID": leadId == null ? null : leadId,
        "DEALER_ID": dealerId == null ? null : dealerId,
        "USER_ID": userId == null ? null : userId,
        "PIC": pic == null ? null : createdUsernameValues.reverse[pic],
        "SPV_ID": spvId == null ? null : spvId,
        "SPV_NAME": spvName == null ? null : spvNameValues.reverse[spvName],
        "KACAB_ID": kacabId == null ? null : kacabId,
        "KACAB_NAME": kacabName == null ? null : kacabNameValues.reverse[kacabName],
        "STATUS_ID": statusId == null ? null : statusId,
        "STATUS_NAME": statusName == null ? null : statusName,
        "REMARKS": remarks == null ? null : remarksValues.reverse[remarks],
        "BYADMIN": byadmin == null ? null : byadmin,
        "CREATED_DATE": createdDate == null ? null : createdDate.toIso8601String(),
        "CREATED_USERNAME": createdUsername == null ? null : createdUsernameValues.reverse[createdUsername],
        "payment_type": paymentType == null ? null : paymentType,
        "leasing_id": leasingId == null ? null : leasingId,
        "Color": color,
    };
}

enum CreatedUsername { SALES_DEMO }

final createdUsernameValues = EnumValues({
    "Sales Demo": CreatedUsername.SALES_DEMO
});

enum KacabName { KACAB_DEMO }

final kacabNameValues = EnumValues({
    "Kacab Demo": KacabName.KACAB_DEMO
});

enum Remarks { EMPTY, ADIRA }

final remarksValues = EnumValues({
    "ADIRA": Remarks.ADIRA,
    "": Remarks.EMPTY
});

enum SpvName { SPV_DEMO }

final spvNameValues = EnumValues({
    "Spv Demo": SpvName.SPV_DEMO
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}