import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/button/button_text.dart';
import 'package:gluestack_flutter_pro/theme/config/text/text.dart';

GSStyleConfig gsTextConfig =
    GSStyleConfig(componentName: 'ButtonText', ancestorStyle: ['_text']);

GSStyle buttonTextStyle = GSStyle.fromMap(data: textData)
    .merge(GSStyle.fromMap(data: buttonTextData));

