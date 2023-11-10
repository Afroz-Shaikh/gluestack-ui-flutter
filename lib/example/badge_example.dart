import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/color_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_text.dart';

class BadgeExample extends StatelessWidget {
  const BadgeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSBadge(
              size: GSSizes.$lg,
              action: GSActions.error,
              variant: GSVariants.outline,
              style: GSStyle(
                md: GSStyle(
                  bg: $GSColors.green400,
                ),
                variants: Variants(
                  action: GSAction(
                    error: GSStyle(bg: Colors.green),
                  ),
                ),
              ),
              // borderRadius: 4,
              text: const GSBadgeText(
                'Error',
              ),
            ),
            const GSBadge(
              size: GSSizes.$sm,
              action: GSActions.info,
              variant: GSVariants.solid,
              iconData: Icons.info_outline,
              text: GSBadgeText(
                'information',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
