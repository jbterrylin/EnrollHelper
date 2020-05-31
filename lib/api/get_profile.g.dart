// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileResponse _$GetProfileResponseFromJson(Map<String, dynamic> json) {
  return GetProfileResponse()
    ..results = (json['results'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetProfileResponseToJson(GetProfileResponse instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };
