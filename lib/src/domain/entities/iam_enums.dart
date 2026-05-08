import 'package:json_annotation/json_annotation.dart';

/// Visual layout of an in-app message.
enum IamLayout {
  @JsonValue('modal')
  modal,
  @JsonValue('bottom_sheet')
  bottomSheet,
  @JsonValue('fullscreen')
  fullscreen,
  @JsonValue('image_only_modal')
  imageOnlyModal,
}

/// What triggers evaluation of an in-app message.
enum IamTriggerType {
  @JsonValue('on_launch')
  onLaunch,
  @JsonValue('on_route')
  onRoute,
  @JsonValue('on_event')
  onEvent,
}

/// Action executed when a CTA is tapped.
enum IamActionType {
  @JsonValue('close')
  close,
  @JsonValue('deep_link')
  deepLink,
  @JsonValue('external_url')
  externalUrl,
}

/// What happens after the user dismisses a message.
enum IamDismissBehavior {
  @JsonValue('do_not_show_again')
  doNotShowAgain,
  @JsonValue('allow_retry')
  allowRetry,
}
