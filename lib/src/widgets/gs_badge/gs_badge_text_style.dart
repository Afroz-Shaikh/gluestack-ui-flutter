import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/text/text.dart';

/// Represents the style configuration for GSBadgeText.
final GSStyle badgeTextStyle = GSStyle.fromMap(data: textData)
    .merge(GSStyle.fromMap(data: getIt<GluestackCustomConfig>().badgeText));

/// Needed configuration for descendantStyle, specifying the component name and ancestor style
const GSStyleConfig gsBadgeTextConfig = GSStyleConfig(
  componentName: 'BadgeText',
  ancestorStyle: ['_text'],
);
