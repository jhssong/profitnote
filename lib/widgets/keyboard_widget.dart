import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;

  const KeyboardKey({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  State<KeyboardKey> createState() => _KeyboardKeyState();
}

class _KeyboardKeyState extends State<KeyboardKey> {
  renderLabel() {
    if (widget.label is Widget) {
      return widget.label;
    }

    return TextButton(
      onPressed: () {},
      child: Text(
        widget.label,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: ColorTheme.cardText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.value);
      },
      child: AspectRatio(
        aspectRatio: 2,
        child: Center(
          child: renderLabel(),
        ),
      ),
    );
  }
}

class CustomKeyboard extends StatelessWidget {
  final ValueSetter<dynamic> onKeyTap;
  final VoidCallback onBackspacePress;

  CustomKeyboard({
    super.key,
    required this.onKeyTap,
    required this.onBackspacePress,
  });

  final List<List<Object>> keys = [
    [
      'AC',
      '÷',
      'x',
      const Icon(
        Icons.backspace,
        color: Colors.white,
      )
    ],
    ['7', '8', '9', '-'],
    ['4', '5', '6', '+'],
    ['1', '2', '3', '='],
    [
      '+/-',
      '0',
      '.',
      "완료",
    ],
  ];

  renderKeyboard() {
    return keys
        .map(
          (x) => Row(
            children: x.map(
              (y) {
                return Expanded(
                  child: KeyboardKey(
                    label: y,
                    value: y,
                    onTap: (val) {
                      if (val is Widget) {
                        onBackspacePress();
                      } else {
                        onKeyTap(val);
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: renderKeyboard(),
      ),
    );
  }
}
