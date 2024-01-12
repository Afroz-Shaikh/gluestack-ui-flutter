import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
final List<Option<int>> sizeOptions = [
  Option<int>(value: 2, label: GSSizes.$sm.name),
  Option<int>(value: 3, label: GSSizes.$md.name),
  Option<int>(value: 4, label: GSSizes.$lg.name),
];

final class CheckboxStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSCheckBox(
        size: GSSizes.values[context.knobs
            .options(label: 'Size', initial: 3, options: sizeOptions)],
        isInvalid: context.knobs.boolean(label: "isInvalid", initial: false),
        isDisabled: context.knobs.boolean(label: "isDisabled", initial: false),
        icon: GSCheckBoxIndicator(
          style: GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
          child: const GSCheckBoxIcon(),
        ),
        value: "value 1",
        onChanged: (value) {},
        label: const GSCheckBoxLabel(text: "value1"),
      ),
    );
  }

  @override
  String get routePath => "checkboxPreview";

  @override
  String get storyName => "Checkbox";
}
