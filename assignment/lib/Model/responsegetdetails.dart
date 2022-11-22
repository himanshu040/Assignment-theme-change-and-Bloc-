// To parse this JSON data, do
//
//     final responseGetDetails = responseGetDetailsFromMap(jsonString);

import 'dart:convert';

class ResponseGetDetails {
  ResponseGetDetails({
    required this.data,
  });

  Data data;

  factory ResponseGetDetails.fromJson(String str) => ResponseGetDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseGetDetails.fromMap(Map<String, dynamic> json) => ResponseGetDetails(
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "data": data.toMap(),
  };
}

class Data {
  Data({
    required this.accessToken,
    required this.refreshToken,
    required this.expires,
    required this.user,
  });

  String accessToken;
  String refreshToken;
  int expires;
  User user;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
    expires: json["expires"],
    user: User.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "access_token": accessToken,
    "refresh_token": refreshToken,
    "expires": expires,
    "user": user.toMap(),
  };
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.email,
    required this.mobile,
    required this.roleId,
    required this.lastAccess,
    required this.isPasswordChange,
    required this.roleName,
    required this.roleCode,
    required this.avatar,
    required this.userAdditionalRoleId,
    required this.uarCreatedByRoleCode,
    required this.createdByRoleCode,
    required this.fgCode,
    required this.scCode,
    required this.districtGroupId,
    required this.roleUserDesignations,
    required this.stateId,
    required this.stateName,
    required this.districtId,
    required this.districtName,
    required this.organizationId,
    required this.organizationName,
    required this.roleAccelLevelId,
    required this.roleAccelLevelName,
    required this.ancillaryGroup,
    required this.ancillaryGroupTitle,
    required this.ancillaryGroupCode,
  });

  String id;
  String firstName;
  String lastName;
  String fullName;
  String email;
  String mobile;
  String roleId;
  DateTime lastAccess;
  bool isPasswordChange;
  String roleName;
  String roleCode;
  dynamic avatar;
  int userAdditionalRoleId;
  String uarCreatedByRoleCode;
  String createdByRoleCode;
  dynamic fgCode;
  dynamic scCode;
  dynamic districtGroupId;
  dynamic roleUserDesignations;
  int stateId;
  String stateName;
  dynamic districtId;
  dynamic districtName;
  dynamic organizationId;
  dynamic organizationName;
  int roleAccelLevelId;
  String roleAccelLevelName;
  dynamic ancillaryGroup;
  dynamic ancillaryGroupTitle;
  dynamic ancillaryGroupCode;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    fullName: json["full_name"],
    email: json["email"],
    mobile: json["mobile"],
    roleId: json["role_id"],
    lastAccess: DateTime.parse(json["last_access"]),
    isPasswordChange: json["is_password_change"],
    roleName: json["role_name"],
    roleCode: json["role_code"],
    avatar: json["avatar"],
    userAdditionalRoleId: json["user_additional_role_id"],
    uarCreatedByRoleCode: json["uar_created_by_role_code"],
    createdByRoleCode: json["created_by_role_code"],
    fgCode: json["fg_code"],
    scCode: json["sc_code"],
    districtGroupId: json["district_group_id"],
    roleUserDesignations: json["role_user_designations"],
    stateId: json["state_id"],
    stateName: json["state_name"],
    districtId: json["district_id"],
    districtName: json["district_name"],
    organizationId: json["organization_id"],
    organizationName: json["organization_name"],
    roleAccelLevelId: json["role_accel_level_id"],
    roleAccelLevelName: json["role_accel_level_name"],
    ancillaryGroup: json["ancillary_group"],
    ancillaryGroupTitle: json["ancillary_group_title"],
    ancillaryGroupCode: json["ancillary_group_code"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "full_name": fullName,
    "email": email,
    "mobile": mobile,
    "role_id": roleId,
    "last_access": lastAccess.toIso8601String(),
    "is_password_change": isPasswordChange,
    "role_name": roleName,
    "role_code": roleCode,
    "avatar": avatar,
    "user_additional_role_id": userAdditionalRoleId,
    "uar_created_by_role_code": uarCreatedByRoleCode,
    "created_by_role_code": createdByRoleCode,
    "fg_code": fgCode,
    "sc_code": scCode,
    "district_group_id": districtGroupId,
    "role_user_designations": roleUserDesignations,
    "state_id": stateId,
    "state_name": stateName,
    "district_id": districtId,
    "district_name": districtName,
    "organization_id": organizationId,
    "organization_name": organizationName,
    "role_accel_level_id": roleAccelLevelId,
    "role_accel_level_name": roleAccelLevelName,
    "ancillary_group": ancillaryGroup,
    "ancillary_group_title": ancillaryGroupTitle,
    "ancillary_group_code": ancillaryGroupCode,
  };
}
