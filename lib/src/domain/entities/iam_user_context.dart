import 'package:freezed_annotation/freezed_annotation.dart';

part 'iam_user_context.freezed.dart';

/// Runtime user + device/app context used to evaluate targeting rules.
///
/// Built by the host app (see `IamHostBindings.currentUser`).
@freezed
abstract class IamUserContext with _$IamUserContext {
  const factory IamUserContext({
    @Default('') String userId,
    @Default('') String platform, // 'android' | 'ios'
    @Default('') String env, // 'production' | 'development' | ...
    @Default('0.0.0') String appVersion,
    String? organizationId,
    @Default(<String>[]) List<String> roles,
  }) = _IamUserContext;
}
