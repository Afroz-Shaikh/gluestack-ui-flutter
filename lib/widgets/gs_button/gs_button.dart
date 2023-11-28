import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_group_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector.dart';

class GSButton extends StatelessWidget {
  final GSActions? action;
  final GSVariants? variant;
  final GSSizes? size;
  final bool? isDisabled;
  final bool? isFocusVisible;
  final Widget child;
  final VoidCallback onPressed;
  final GSStyle? style;
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
    this.action,
    this.variant,
    this.size,
    this.isDisabled,
    this.isFocusVisible = false,
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
    final value = GSButtonGroupProvider.of(context);
    final buttonAction = action ?? buttonStyle.props?.action;
    final buttonVariant = variant ?? buttonStyle.props?.variant;
    final buttonSize = size ?? value?.size ?? buttonStyle.props?.size;
    final disabled = isDisabled ?? value?.isDisabled ?? false;
    final isAttached = value?.isAttached ?? false;

    // GSStyle styler2 = resolveStyles(context,
    //     variantStyle:
    //         GSButtonStyle.gsButtonCombination[buttonAction]![buttonVariant],
    //     size: GSButtonStyle.size[buttonSize]!,
    //     inlineStyle: style,
    //     descendantStyles: GSButtonStyle.buttonDescendantStyles[action]
    //         ?[variant],
    //     descendantStyleKeys: gsButtonConfig.descendantStyle)!;

    return GSFocusableActionDetector(
      child: Builder(builder: (context) {
        GSStyle styler = resolveStyles2(
            context: context,
            styles: [
              buttonStyle,
              buttonStyle.actionMap(buttonAction),
              buttonStyle.variantMap(buttonVariant),
              buttonStyle.sizeMap(buttonSize),
            ],
            inlineStyle: style);
     
        return GSAncestor(
          decedentStyles: styler.descendantStyles,
          child: GSButtonProvider(
            action: buttonAction!,
            variant: buttonVariant!,
            size: buttonSize!,
            child: Opacity(
              opacity: disabled ? styler.opacity! : 1,
              child: SizedBox(
                height: styler.height,
                child: ElevatedButton(
                  onPressed: disabled ? null : onPressed,
                  onLongPress: disabled ? null : onLongPress,
                  onHover: onHover,
                  onFocusChange: onFocusChange,
                  focusNode: focusNode,
                  autofocus: autoFocus,
                  clipBehavior: clipBehavior,
                  statesController: statesController,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double?>(0),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                        styler.padding),
                     backgroundColor: MaterialStateProperty.all(styler.bg),   
                    // backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    //   (Set<MaterialState> states) {
                    //     if (states.contains(MaterialState.pressed)) {
                    //       return styler.onActive?.bg ?? styler.bg;
                    //     } else if (states.contains(MaterialState.hovered)) {
                    //       return styler.onHover?.bg ?? styler.bg;
                    //     } else if (states.contains(MaterialState.focused)) {
                    //       return styler.onFocus?.bg ?? styler.bg;
                    //     } else if (states.contains(MaterialState.disabled) ||
                    //         disabled) {
                    //       return styler.onDisabled?.bg ?? styler.bg;
                    //     } else if (states.contains(MaterialState.error)) {
                    //       return styler.onInvaild?.bg ?? styler.bg;
                    //     }

                    //     return styler.bg!;
                    //   },
                    // ),
                    shape: MaterialStateProperty.resolveWith<
                        RoundedRectangleBorder?>((Set<MaterialState> states) {
                      double resolveBorderRadius(MaterialState state) {
                        switch (state) {
                          case MaterialState.pressed:
                            return styler.onActive?.borderRadius ??
                                styler.borderRadius!;
                          case MaterialState.hovered:
                            return styler.onHover?.borderRadius ??
                                styler.borderRadius!;
                          case MaterialState.focused:
                            return styler.onFocus?.borderRadius ??
                                styler.borderRadius!;
                          case MaterialState.disabled:
                            return styler.onDisabled?.borderRadius ??
                                styler.borderRadius!;
                          case MaterialState.error:
                            return styler.onInvaild?.borderRadius ??
                                styler.borderRadius!;
                          default:
                            return styler.borderRadius!;
                        }
                      }

                      // Common borderSide resolution.
                      BorderSide resolveBorderSide(MaterialState state) {
                        if (isAttached) return BorderSide.none;
                        if (isFocusVisible!) {
                          return const BorderSide(
                              color: $GSColors.primary500, width: 2.0);
                        } else if (variant == GSVariants.link) {
                          return BorderSide.none;
                        } else {
                          switch (state) {
                            case MaterialState.pressed:
                              return BorderSide(
                                  color: styler.onActive?.borderColor ??
                                      styler.borderColor!,
                                  width: styler.onActive?.borderWidth ?? 1.0);
                            case MaterialState.hovered:
                              return BorderSide(
                                  color: styler.onHover?.borderColor ??
                                      styler.borderColor!,
                                  width: styler.onHover?.borderWidth ?? 1.0);
                            case MaterialState.focused:
                              return BorderSide(
                                  color: styler.onFocus?.borderColor ??
                                      styler.borderColor!,
                                  width: styler.onFocus?.borderWidth ?? 1.0);
                            case MaterialState.disabled:
                              return BorderSide(
                                  color: styler.onDisabled?.borderColor ??
                                      styler.borderColor!,
                                  width: styler.onDisabled?.borderWidth ?? 1.0);
                            case MaterialState.error:
                              return BorderSide(
                                  color: styler.onInvaild?.borderColor ??
                                      styler.borderColor!,
                                  width: styler.onInvaild?.borderWidth ?? 1.0);
                            default:
                              return BorderSide(
                                  color: styler.borderColor!,
                                  width: styler.borderWidth ?? 1.0);
                          }
                        }
                      }

                      // Identify the current state to apply styles for.
                      MaterialState currentState = MaterialState.values
                          .firstWhere(states.contains,
                              orElse: () => MaterialState.values.last);
                      return RoundedRectangleBorder(
                        borderRadius: isAttached
                            ? BorderRadius.zero
                            : BorderRadius.circular(
                                resolveBorderRadius(currentState)),
                        side: resolveBorderSide(currentState),
                      );
                    }),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      child,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
