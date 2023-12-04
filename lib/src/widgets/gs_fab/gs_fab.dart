import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_fab/gs_fab_style.dart';

class GSFab extends StatelessWidget {
  final GSSizes? size;
  final GSPlacements? placement;
  final Widget? label;
  final GSStyle? style;
  final Widget? icon;
  final bool isDisabled;
  final bool isPressed;
  final bool isHovered;
  final void Function()? onPressed;
  const GSFab(
      {super.key,
      required this.onPressed,
      this.size,
      this.label,
      this.icon,
      this.placement,
      this.style,
      this.isHovered = false,
      this.isPressed = false,
      this.isDisabled = false})
      : assert(
            size == GSSizes.$lg ||
                size == GSSizes.$md ||
                size == GSSizes.$sm ||
                size == null,
            "only support sizes of lg,md,sm");

  @override
  Widget build(BuildContext context) {
    final fabSize = size ?? fabStyle.props!.size!;
    final fabPlacement = placement ?? fabStyle.props?.placement!;
    final styler = resolveStyles(context,
        variantStyle: GSFabStyle.placementVariants[fabPlacement],
        size: GSFabStyle.size[fabSize],
        descendantStyleKeys: fabConfig.descendantStyle,
        inlineStyle: style)!;

    final bool isCentered = placement == GSPlacements.bottomCenter ||
        placement == GSPlacements.topCenter;

    final widget = GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: Opacity(
        opacity: isDisabled ? styler.onDisabled?.opacity ?? 0.0 : 1,
        child: ElevatedButton(
            style: ButtonStyle(
              mouseCursor: MaterialStateProperty.resolveWith((states) {
                return isDisabled
                    ? SystemMouseCursors.forbidden
                    : SystemMouseCursors.click;
              }),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(styler.borderRadius ?? 0.0))),
              padding: MaterialStateProperty.all(styler.padding),
              side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.focused)) {
                  return BorderSide(
                    color:
                        styler.onFocus?.borderColor ?? const Color(0xFF000000),
                    width: styler.onFocus?.borderWidth ?? 1.0,
                  );
                }
                return null;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed) || isPressed) {
                  return styler.onActive?.bg;
                }

                if (states.contains(MaterialState.hovered) || isHovered) {
                  return styler.onHover?.bg;
                }

                return styler.bg;
              }),
            ),
            onPressed: isDisabled ? null : onPressed,
            child: resolveFlexWidget(
              flexDirection: styler.flexDirection,
              mainAxisAlignment: styler.justifyContent,
              crossAxisAlignment: styler.alignItems,
              children: [if (icon != null) icon!, if (label != null) label!],
            )),
      ),
    );

    return Positioned.fill(
        bottom: styler.bottom,
        top: styler.top,
        left: isCentered ? styler.left ?? 0.0 : styler.left,
        right: isCentered ? styler.right ?? 0.0 : styler.right,
        child: isCentered
            ? Align(
                alignment: Alignment.center,
                child: widget,
              )
            : widget);
  }
}
