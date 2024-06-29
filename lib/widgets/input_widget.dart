import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    super.key,
    required this.callback,
    this.initialValue,
    this.isReadonly,
    this.dialogTitle,
    this.dialogBodyList,
  });

  /// Function that save the input data.
  final Function(String) callback;

  final String? initialValue;

  /// If TextField is controlled by custom dialog, this should be true.
  final bool? isReadonly;

  final String? dialogTitle;

  final List<String>? dialogBodyList;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _controller = TextEditingController();
  late final bool _isReadOnly;

  @override
  void initState() {
    super.initState();
    if (widget.isReadonly != null) {
      _isReadOnly = widget.isReadonly!;
    } else {
      _isReadOnly = false;
    }
  }

  /// If TextField is controlled by custom dialog, make onTap to open custom dialog.
  void _onTap() {
    if (_isReadOnly == true) {
      _showCustomDialog(
        context,
        title: widget.dialogTitle!,
        bodyList: widget.dialogBodyList,
        onPressed: _dialogCallback,
      );
    }
  }

  void _dialogCallback(String value) {
    setState(() => _controller.text = value);
    widget.callback(value);
    Navigator.of(context).pop();
  }

  Future<void> _showCustomDialog(
    BuildContext context, {
    required title,
    required bodyList,
    required onPressed,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorTheme.cardBackground,
          title: Center(child: Text('$title')),
          titleTextStyle: Theme.of(context).textTheme.titleMedium,
          contentTextStyle: Theme.of(context).textTheme.bodyMedium,
          content: Wrap(
            children: List.generate(bodyList.length, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => onPressed(bodyList[index]),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        foregroundColor: ColorTheme.pointText,
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                      child: Text("${bodyList[index]}"),
                    ),
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Input Label",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            readOnly: _isReadOnly,
            onTap: _onTap,
            onChanged: (value) => widget.callback(value),
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorTheme.cardBackground,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
