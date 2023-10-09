import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_attributes.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';
import 'package:gluestack_flutter_pro/style/style_data.dart';
import 'package:provider/provider.dart';

class GSButton extends StatelessWidget {
  final GSButtonAction? action;
  final GSButtonVariant? variant;
  final GSButtonSize? size;
  final Widget child;
  final VoidCallback onPressed;
  final StyleData? style;
  final VoidCallback? onLongPress;
  final Function(bool)? onHover;
  final Function(bool)? onFocusChange;
  final FocusNode? focusNode;
  final bool autoFocus;
  final Clip clipBehavior;
  final MaterialStatesController? statesController;
  const GSButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.action = GSButtonAction.primary,
    this.variant = GSButtonVariant.solid,
    this.size = GSButtonSize.md,
    this.style,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autoFocus = false,
    this.clipBehavior = Clip.none,
    this.statesController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).currentTheme;

    final buttonStyle =
        GSButtonAttributes.gsButtonCombination[action]![variant]![theme];

    return GSButtonProvider(
        action: action!,
        variant: variant!,
        size: size!,
        child: ElevatedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          focusNode: focusNode,
          autofocus: autoFocus,
          clipBehavior: clipBehavior,
          statesController: statesController,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: style != null
                ? style!.padding ?? GSButtonAttributes.buttonPaddings[size]
                : GSButtonAttributes.buttonPaddings[size],
            backgroundColor: style != null
                ? style!.color ?? buttonStyle!.bgColor
                : buttonStyle!.bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: style != null
                  ? style!.borderRadius != null
                      ? BorderRadius.circular(style!.borderRadius!)
                      : GSButtonAttributes.buttonBorderRadius[size]!
                  : GSButtonAttributes.buttonBorderRadius[size]!,
              side: BorderSide(
                color: style != null
                    ? style!.borderColor ?? buttonStyle!.borderColor!
                    : buttonStyle!.borderColor!,
                width: style != null ? style!.borderWidth ?? 1.0 : 1.0,
              ),
            ),
          ),
          child: child,
        ));
  }
}