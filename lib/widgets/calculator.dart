import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/custom_keyboard.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayText = '0';
  String _operator = '';
  bool _shouldReset = false;

  void onKeyTap(dynamic value) {
    setState(() {
      if (value == 'AC') {
        displayText = '0';
        _operator = '';
      } else if (value == '완료') {
        _calculate();
        Navigator.pop(context, displayText);
      } else if (value == '+/-') {
        displayText = (double.parse(displayText) * -1).toString();
      } else if (value == '=') {
        _calculate();
      } else if (_isOperator(value)) {
        if (_operator.isEmpty &&
            displayText.isNotEmpty &&
            !_isOperator(displayText[displayText.length - 1])) {
          displayText += value;
          _operator = value;
        }
      } else {
        if (_shouldReset) {
          displayText = value;
          _shouldReset = false;
        } else if (displayText == '0') {
          displayText = value;
        } else {
          displayText += value;
        }
        _operator = '';
      }
    });
  }

  void onBackspacePress() {
    setState(() {
      displayText = displayText.length > 1
          ? displayText.substring(0, displayText.length - 1)
          : '0';
      if (displayText == '0') _operator = '';
    });
  }

  bool _isOperator(String value) {
    return value == '÷' || value == 'x' || value == '-' || value == '+';
  }

  void _calculate() {
    try {
      final expression = displayText.replaceAll('x', '*').replaceAll('÷', '/');
      final result = _evaluateExpression(expression);
      displayText = result.toString();
      _shouldReset = true;
    } catch (e) {
      displayText = 'Error';
      _shouldReset = true;
    }
  }

  double _evaluateExpression(String expression) {
    final List<String> tokens =
        expression.split(RegExp(r'(?=[+\-*/])|(?<=[+\-*])'));
    tokens.removeWhere((token) => token.trim().isEmpty);
    double result = double.parse(tokens[0]);

    for (int i = 1; i < tokens.length; i += 2) {
      String operator = tokens[i];
      double nextValue = double.parse(tokens[i + 1]);

      switch (operator) {
        case '+':
          result += nextValue;
          break;
        case '-':
          result -= nextValue;
          break;
        case '*':
          result *= nextValue;
          break;
        case '/':
          result /= nextValue;
          break;
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.cardBackground,
      appBar: AppBar(
        backgroundColor: ColorTheme.cardBackground,
        leading: IconButton(
          icon: const Icon(Icons.close, size: 24.0),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24.0),
              child: Text(
                displayText,
                style: TextStyle(
                  fontSize: 48.0,
                  color: ColorTheme.cardText,
                ),
              ),
            ),
          ),
          CustomKeyboard(
            onKeyTap: onKeyTap,
            onBackspacePress: onBackspacePress,
          ),
        ],
      ),
    );
  }
}
