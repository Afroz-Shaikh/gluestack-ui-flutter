import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/radii_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_icon/gs_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input.dart';
import 'package:gluestack_flutter_pro/widgets/gs_spinner/gs_spinner.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text_area/gs_text_area.dart';
import 'package:gluestack_flutter_pro/widgets/gs_toast/gs_toast.dart';
import 'package:gluestack_flutter_pro/widgets/gs_toast/gs_toast_title.dart';
import 'package:gluestack_flutter_pro/widgets/gs_toast/show_toast.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class ListYourPlaceModalContent3 extends StatefulWidget {
  const ListYourPlaceModalContent3({super.key});

  @override
  State<ListYourPlaceModalContent3> createState() =>
      _ListYourPlaceModalContent3State();
}

class _ListYourPlaceModalContent3State
    extends State<ListYourPlaceModalContent3> {
  bool shouldShowSpinner = false;
  @override
  Widget build(BuildContext context) {
    return GSVStack(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      space: GSSpaces.$md,
      children: [
        const GSText(text: "Title", bold: true, size: GSSizes.$sm),
        const GSInput(),
        const GSText(text: "Description", bold: true, size: GSSizes.$sm),
        GSTextArea(
          size: GSSizes.$xl,
          hintText: "Enter text here",
          style: GSStyle(
            width: 300,
          ),
        ),
        const GSText(text: "Contact me", bold: true, size: GSSizes.$sm),
        const GSInput(),
        SizedBox(
          width: double.infinity,
          child: GSButton(
            style: GSStyle(borderRadius: $GSRadii.$md),
            action: GSActions.negative,
            child: const GSButtonText(text: 'Post Now'),
            onPressed: () {
              Navigator.of(context).pop();
              _showToast(
                  context: context, title: 'Your property has been listed');
            },
          ),
        ),
      shouldShowSpinner? const Center(child:  GSSpinner()) :SizedBox(
          width: double.infinity,
          child: GSButton(
            style: GSStyle(borderRadius: $GSRadii.$md),
            action: GSActions.secondary,
            variant: GSVariants.outline,
            child: const GSButtonText(text: 'Save fo Later'),
            onPressed: () {
              setState(() {
                shouldShowSpinner = true;
              });
              Future.delayed(
                const Duration(milliseconds: 500),
                () {
                  Navigator.of(context).pop();
                  _showToast(
                      context: context,
                      title:
                          'Your property listing has been successfully saved',
                      showCongratulations: false);
                },
              );
            },
          ),
        )
      ],
    );
  }

  _showToast(
      {required BuildContext context,
      required String title,
      bool showCongratulations = true}) {
    return showToast(
      context,
      gravity: ToastGravity.TOP,
      child: GSToast(
        variant: GSVariants.solid,
        action: GSActions.success,
        child: GSHStack(
          space: GSSpaces.$xs,
          mainAxisSize: MainAxisSize.min,
          children: [
            const GSIcon(icon: Icons.check_circle_outline_outlined),
            GSHStack(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showCongratulations)
                  GSToastTitle(
                    style: GSStyle(
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w700)),
                    title: "Congratulations!",
                  ),
                GSToastTitle(
                  title: title,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
