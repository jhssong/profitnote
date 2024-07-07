import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class MenuDialogWidget extends StatefulWidget {
  const MenuDialogWidget({
    super.key,
    required this.callback,
    this.initialValue,
    this.dialogTitle,
    this.dialogBodyList,
  });

  /// Function that save the input data.
  final Function(String) callback;

  final String? initialValue;

  final String? dialogTitle;

  final List<String>? dialogBodyList;

  @override
  State<MenuDialogWidget> createState() => _MenuDialogWidgetState();

  static void showMenuDialog(BuildContext context, Widget showMenu) {}
}

class _MenuDialogWidgetState extends State<MenuDialogWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  /// If TextField is controlled by custom dialog, make onTap to open custom dialog.
  void _onTap() {
    _showSelectionDialog(
      context,
      title: widget.dialogTitle!,
      bodyList: widget.dialogBodyList,
      dialogCallback: _dialogCallback,
    );
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
