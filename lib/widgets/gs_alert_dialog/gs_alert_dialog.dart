import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_content.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_style.dart';

class GSAlertDialog extends StatefulWidget {
  final GSAlertDialogContent content;
  final GSSizes? size;
  final GSStyle? style;
  final AlignmentGeometry? alignment;
  final Clip? clipBehavior;
  final EdgeInsets? insetPadding;
  final double? elevation;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final ShapeBorder? shape;
  final Curve? insetAnimationCurve;
  final Duration? insetAnimationDuration;

  const GSAlertDialog({
    super.key,
    required this.content,
    this.style,
    this.alignment,
    this.clipBehavior = Clip.none,
    this.insetPadding =
        const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
    this.elevation,
    this.backgroundColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.insetAnimationCurve = Curves.decelerate,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.size,
  });
  static void show(
    BuildContext context, {
    GSAlertDialogContent? content,
    bool? showBackdrop = true,
    GSStyle? style,
    final AlignmentGeometry? alignment,
    final Clip? clipBehavior = Clip.none,
    final EdgeInsets? insetPadding =
        const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
    final double? elevation,
    final Color? backgroundColor,
    final Color? shadowColor,
    final Color? surfaceTintColor,
    final ShapeBorder? shape,
    final Curve? insetAnimationCurve = Curves.decelerate,
    final Duration? insetAnimationDuration = const Duration(milliseconds: 100),
    final GSSizes? size,
  }) {
    showDialog(
      barrierColor:
          !showBackdrop! ? Colors.transparent : Colors.black.withOpacity(0.5),
      context: context,
      builder: (BuildContext context) {
        return GSAlertDialog(
          content: content ?? const GSAlertDialogContent(),
          style: style,
          alignment: alignment,
          backgroundColor: backgroundColor,
          clipBehavior: clipBehavior,
          elevation: elevation,
          insetAnimationCurve: insetAnimationCurve,
          insetAnimationDuration: insetAnimationDuration,
          insetPadding: insetPadding,
          shadowColor: shadowColor,
          shape: shape,
          surfaceTintColor: surfaceTintColor,
          size: size,
        );
      },
    );
  }

  @override
  State<GSAlertDialog> createState() => _GSAlertDialogState();
}

class _GSAlertDialogState extends State<GSAlertDialog> {
  @override
  Widget build(BuildContext context) {
    final alertSize = widget.size ?? alertDialogStyle.props?.size;
    GSStyle styler = resolveStyles(
      context,
      variantStyle: alertDialogStyle,
      size: GSAlertDialogStyle.size[alertSize],
      inlineStyle: widget.style,
    )!;
    final alertWidth = styler.width ??
        (MediaQuery.of(context).size.width *
            (GSAlertDialogStyle.size[alertSize]!.contentWidth!.toDouble()));
    final alertMaxWidth =
        GSAlertDialogStyle.size[alertSize]?.contentMaxWidth ?? double.infinity;

    return Dialog(
      backgroundColor: widget.backgroundColor ?? styler.bg,
      alignment: widget.alignment,
      clipBehavior: widget.clipBehavior!,
      elevation: widget.elevation,
      insetPadding: widget.insetPadding!,
      shadowColor: widget.shadowColor,
      shape: widget.shape,
      surfaceTintColor: widget.surfaceTintColor,
      insetAnimationCurve: widget.insetAnimationCurve!,
      insetAnimationDuration: widget.insetAnimationDuration!,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(styler.borderRadius ?? 4.0),
        child: Container(
          width: alertWidth,
          height: styler.height,
          constraints: BoxConstraints(maxWidth: alertMaxWidth),
          child: widget.content,
        ),
      ),
    );
  }
}
