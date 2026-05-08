import '../../domain/entities/iam_trigger_context.dart';
import '../../domain/entities/iam_trigger_context_ext.dart';
import 'in_app_messaging_engine.dart';

/// Builds the analytics parameter maps shared across `iam_message_shown`,
/// `iam_cta_clicked`, `iam_dismissed`, and `iam_cta_invalid_path` events.
///
/// Extracted from `InAppMessagingCoordinator` so the coordinator does not
/// know the concrete event-key shape.
class IamAnalyticsMapper {
  const IamAnalyticsMapper();

  /// Common parameter set attached to every IAM analytics event for a given
  /// trigger tick.
  Map<String, dynamic> baseParams(
    EligibleMessage eligible,
    IamTriggerContext ctx,
  ) {
    final variant = eligible.variant;
    return <String, dynamic>{
      'message_id': eligible.message.id,
      'variant_index': eligible.variantIndex,
      'layout': eligible.message.layout.name,
      'trigger_type': ctx.analyticsName,
      'route_or_event': ctx.analyticsTarget,
      'variant_title': variant.content.title,
    };
  }
}
