import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/calculator.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    super.key,
    required this.inputLabel,
    required this.callback,
    this.initialValue,
    this.isUseWidget = false,
    this.isUseDialog = false,
    this.showCustomWidget,
    this.showCustomDialog,
    this.dialogTitle,
    this.dialogBodyList,
    this.isHorizontal = false,
  });

  final String inputLabel;

  /// Function that save the input data.
  final Function(String) callback;

  final String? initialValue;

  /// If this is true, when user tap the widget navigate to custom widget.
  final bool isUseWidget;

  /// If TextField is controlled by custom dialog, this should be true.
  final bool isUseDialog;

  /// When use custom widget, set this parameter
  final Function? showCustomWidget;

  /// When use custom dialog, set this parameter
  final Function? showCustomDialog;

  final String? dialogTitle;

  final List<String>? dialogBodyList;

  /// Set to true if the label and input box should lie horizontally.
  final bool isHorizontal;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _controller = TextEditingController();
  late final bool _isUseWidget = widget.isUseWidget;
  late final bool _isUseDialog = widget.isUseDialog;
  late final bool _isHorizontal = widget.isHorizontal;

  @override
  void initState() {
    super.initState();
  }

  /// If TextField is controlled by custom dialog, make onTap to open custom dialog.
  void _onTap() {
    if (_isUseDialog == true) {
      if (widget.showCustomDialog != null) {
        widget.showCustomDialog!(
          context: context,
          dialogCallback: _dialogCallback,
        );
      } else {
        _showSelectionDialog(
          context,
          title: widget.dialogTitle!,
          bodyList: widget.dialogBodyList,
          dialogCallback: _dialogCallback,
        );
      }
    }
    if (_isUseWidget == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CalculatorScreen(),
        ),
      ).then((value) {
        if (value != null) {
          setState(() {
            _controller.text = value;
          });
        }
      });
    }
  }

  void _dialogCallback(String value) {
    setState(() => _controller.text = value);
    widget.callback(value);
  }

  Future<void> _showSelectionDialog(
    BuildContext context, {
    required title,
    required bodyList,
    required dialogCallback,
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
                      onPressed: () {
                        dialogCallback(bodyList[index]);
                        Navigator.of(context).pop();
                      },
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
    var textField = TextField(
      controller: _controller,
      readOnly: _isUseDialog || _isUseWidget,
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
      textAlign: TextAlign.center,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: _isHorizontal
          ? Row(
              children: [
                Text(
                  widget.inputLabel,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorTheme.cardLabelText),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: textField,
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.inputLabel,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorTheme.cardLabelText),
                ),
                const SizedBox(height: 8),
                textField,
              ],
            ),
    );
  }
}
