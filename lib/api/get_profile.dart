import 'package:json_annotation/json_annotation.dart';

import 'base.dart';
import 'model/user.dart';

part 'get_profile.g.dart';

class GetProfileRequest extends ApiRequest {
  String method() => "GET";
  String endpoint() => "/api?results=1";
  dynamic body() => null;
  Map<String, dynamic> query() => null;
}

@JsonSerializable(explicitToJson: true)
class GetProfileResponse {
  GetProfileResponse();

  @JsonKey(name: 'results')
  List<User> results;

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetProfileResponseToJson(this);
}
