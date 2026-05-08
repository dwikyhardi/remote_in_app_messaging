/// Remote In-App Messaging (IAM).
///
/// A host-agnostic, JSON-driven in-app messaging engine. The host application
/// supplies all I/O and side-effects via `IamHostBindings` (loading the JSON
/// payload, getting the current user, tracking events, opening URLs, etc.),
/// and this package handles schema, eligibility evaluation, display, and
/// per-message persistence.
///
/// Public API surface is intentionally small: wire `IamHostBindings`, call
/// `IamService.init(bindings)`, and invoke `onAppLaunch` / `onRoute` / `onEvent`
/// from the host.
library;

// Domain entities (Step 2)
export 'src/domain/entities/iam_content.dart';
export 'src/domain/entities/iam_cta.dart';
export 'src/domain/entities/iam_cta_ext.dart';
export 'src/domain/entities/iam_enums.dart';
export 'src/domain/entities/iam_frequency.dart';
export 'src/domain/entities/iam_message_state.dart';
export 'src/domain/entities/iam_style.dart';
export 'src/domain/entities/iam_targeting.dart';
export 'src/domain/entities/iam_trigger.dart';
export 'src/domain/entities/iam_trigger_context.dart';
export 'src/domain/entities/iam_trigger_context_ext.dart';
export 'src/domain/entities/iam_user_context.dart';
export 'src/domain/entities/iam_variant.dart';
export 'src/domain/entities/in_app_message.dart';

// Domain — host bindings contract (Step 3)
export 'src/domain/iam_host_bindings.dart';

// Service facade (Step 4)
export 'src/iam_service.dart';

// Infrastructure — coordinator (Step 4)
export 'src/infrastructure/engine/iam_analytics_mapper.dart';
export 'src/infrastructure/engine/iam_cta_dispatcher.dart';
export 'src/infrastructure/engine/iam_message_repository.dart';
export 'src/infrastructure/engine/iam_variant_picker.dart';
export 'src/infrastructure/engine/in_app_messaging_coordinator.dart';

// Infrastructure — state store + engine (Step 3)
export 'src/infrastructure/engine/in_app_messaging_engine.dart';

// Infrastructure — parser (Step 2)
export 'src/infrastructure/parser/in_app_messages_parser.dart';
export 'src/infrastructure/state/hive_iam_state_store.dart';
export 'src/infrastructure/state/iam_state_store.dart';
export 'src/infrastructure/util/semver.dart';

// Presentation — renderers + widgets (Step 4)
export 'src/presentation/renderers/bottom_sheet_iam_renderer.dart';
export 'src/presentation/renderers/fullscreen_iam_renderer.dart';
export 'src/presentation/renderers/iam_body_dispatcher.dart';
export 'src/presentation/renderers/iam_renderer.dart';
export 'src/presentation/renderers/image_only_modal_iam_renderer.dart';
export 'src/presentation/renderers/modal_iam_renderer.dart';
export 'src/presentation/widgets/iam_body.dart';
export 'src/presentation/widgets/iam_cta_button.dart';
export 'src/presentation/widgets/iam_image.dart';
export 'src/presentation/widgets/iam_style_ext.dart';
export 'src/presentation/widgets/iam_style_resolver.dart';
