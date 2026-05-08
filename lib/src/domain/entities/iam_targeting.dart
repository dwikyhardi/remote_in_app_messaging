import 'package:freezed_annotation/freezed_annotation.dart';

part 'iam_targeting.freezed.dart';
part 'iam_targeting.g.dart';

@freezed
abstract class IamTargeting with _$IamTargeting {
  const factory IamTargeting({
    @Default(<String>[]) List<String> platforms,
    @Default(<String>[]) List<String> envs,
    String? minAppVersion,
    String? maxAppVersion,
    @Default(<String>[]) List<String> organizations,
    @Default(<String>[]) List<String> excludeOrganizations,
    @Default(<String>[]) List<String> roles,
    @Default(<String>[]) List<String> allowUserIds,
    @Default(<String>[]) List<String> denyUserIds,
  }) = _IamTargeting;

  factory IamTargeting.fromJson(Map<String, dynamic> json) =>
      _$IamTargetingFromJson(json);
}
