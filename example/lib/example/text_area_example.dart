import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';
import 'package:gluestack_ui_example/utils/drop_down.dart';
import 'package:gluestack_ui_example/utils/toggle.dart';

class TextAreaExample extends StatefulWidget {
  const TextAreaExample({super.key});

  @override
  State<TextAreaExample> createState() => _TextAreaExampleState();
}

class _TextAreaExampleState extends State<TextAreaExample> {
  final List dropdownSizeOptions = [
    GSSizes.$sm,
    GSSizes.$md,
    GSSizes.$lg,
    GSSizes.$xl,
  ];
  GSSizes selectedSizeOption = GSSizes.$md;

  bool isDisabled = false;
  bool isInvalid = false;
  bool isReadOnly = false;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  void updateIsDisabled(bool value) {
    setState(() {
      isDisabled = value;
    });
  }

  void updateIsInvalid(bool value) {
    setState(() {
      isInvalid = value;
    });
  }

  void updateIsReadOnly(bool value) {
    setState(() {
      isReadOnly = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''GSTextArea(
            size: GSSizes.\$md,
            hintText: "Enter text here",
            isDisabled: false,
            isInvalid: false,
            readOnly: false,
            style: GSStyle(
              width: 300,
            ),
          )
  ''';
    return Scaffold(
      appBar: AppBar(),
      body: BaseLayout(
        code: code,
        component: GSTextArea(
          size: selectedSizeOption,
          isDisabled: isDisabled,
          readOnly: isReadOnly,
          isInvalid: isInvalid,
          hintText: "Enter text here",
          style: GSStyle(
            width: 300,
          ),
        ),
        controls: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(
              title: "size",
              dropdownOptions: dropdownSizeOptions,
              selectedOption: selectedSizeOption,
              onChanged: updateSizeSelectedOption,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isDisabled",
              value: isDisabled,
              onToggle: updateIsDisabled,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isInvalid",
              value: isInvalid,
              onToggle: updateIsInvalid,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isReadOnly",
              value: isReadOnly,
              onToggle: updateIsReadOnly,
            )
          ],
        ),
      ),
    );
  }
}