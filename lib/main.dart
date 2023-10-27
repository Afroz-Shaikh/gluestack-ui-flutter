import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/token/color_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button_text/gs_button_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio_text/gs_radio_text.dart';
import 'package:provider/provider.dart';

import 'token/index.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GSButton(
                  action: GSActions.negative,
                  variant: GSVariants.solid,
                  size: GSSizes.lg,
                  onPressed: () {},
                  style: GSStyle(
                    web: GSStyle(
                      bg: $GSColors.amber600,
                    ),
                    ios: GSStyle(
                      bg: $GSColors.pink600,
                    ),
                    md: GSStyle(
                      bg: $GSColors.pink400,
                      onHover: GSStyle(
                        bg: $GSColors.green400,
                      ),
                      onFocus: GSStyle(
                        bg: $GSColors.blueGray600,
                      ),
                      onActive: GSStyle(
                        bg: $GSColors.amber600,
                        borderColor: $GSColors.error500,
                        borderWidth: $GSBorderWidth.$4,
                      ),
                    ),
                  ),
                  child: const GSButtonText(text: "Click Here"),
                ),
                //  GSRadio(icon: GSRadioIcon(value: 'value', groupValue: 'd', onChanged: (p0) =>false ,),label:const GSRadioText(text: 'hello world'),),

                // GSButton(
                //   action: GSButtonAction.secondary,
                //   variant: GSButtonVariant.outline,
                //   size: GSButtonSize.lg,
                //   onPressed: () {},
                //   style: GSStyle(
                //     xs: GSStyle(
                //       bg: $GSColors.purple400,
                //     ),
                //     lg: GSStyle(
                //       bg: $GSColors.warning800,
                //     ),
                //     dark: GSStyle(
                //       bg: $GSColors.blueGray700,
                //       sm: GSStyle(
                //         bg: $GSColors.amber300,
                //       ),
                //       md: GSStyle(
                //         bg: $GSColors.green400,
                //       ),
                //     ),
                //   ),
                //   child: const GSButtonText(text: "Click Here"),
                // ),
                // GSInput(
                //   size: GSInputSize.xl,
                //   variant: GSInputVariant.rounded,
                //   hintText: "Enter Text Here",
                //   enabled: true,
                //   style: GSStyle(
                //     width: 200,
                //     xs: GSStyle(
                //       borderColor: $GSColors.purple400,
                //     ),
                //     lg: GSStyle(
                //       borderColor: $GSColors.warning800,
                //     ),
                //     dark: GSStyle(
                //       borderColor: $GSColors.blueGray700,
                //       sm: GSStyle(
                //         borderColor: $GSColors.amber300,
                //       ),
                //       md: GSStyle(
                //         borderColor: $GSColors.green400,
                //       ),
                //     ),
                //   ),
                // ),
                // GSBox(
                //   style: StyleData(
                //     context,
                //     color: $GSColors.primary500,
                //     width: 200,
                //     height: 200,
                //     padding: const EdgeInsets.symmetric(
                //       vertical: $GSSpace.$5,
                //       horizontal: $GSSpace.$5,
                //     ),
                //     borderRadius: $GSRadii.$sm,
                //   )
                //       .onDark(color: $GSColors.purple800)
                //       .sm(color: $GSColors.green500)
                //       .smDark(color: $GSColors.amber400),
                //   child: const Text(
                //     "I am a container",
                //     style: TextStyle(
                //       color: $GSColors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              themeProvider.toggleTheme();
            },
            child: Icon(themeProvider.currentTheme == GSThemeMode.light
                ? Icons.light_mode
                : Icons.dark_mode),
          ),
        ),
      );
    });
  }
}
