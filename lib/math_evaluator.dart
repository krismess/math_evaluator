class MathExpEvaluator {
  String expression;
  final Map<String, int>? params;

  late List<String> _tokens;
  int _index = 0;

  MathExpEvaluator(
    this.expression, {
    this.params,
  });

  /// интерепретирует математическое выражение и возвращает результат вычисления (double)
  double evaluateMathExpression() {
    _tokens =
        _replaceParamsWithValues().split(RegExp(r'(?<=[-+*/()])|(?=[-+*/()])'));
    double result = _plusOrMinus();
    return result;
  }

  /// заменяет переменные числовыми значениями
  /// и преобразовывает строку:
  /// удаляет лишние пробелы и меняет унарный минус на 0-
  String _replaceParamsWithValues() {
    String result = expression
        .replaceAll(' ', '')
        .replaceAll('(-', '(0-')
        .replaceAll(RegExp(r'^-'), '0-');
    expression.replaceAll(' ', '');

    return params == null
        ? result
        : params!.entries.fold(
            result, (prev, e) => prev.replaceAll(e.key, e.value.toString()));
  }

  /// Сложение и вычитание
  double _plusOrMinus() {
    double first = _multiplyOrDevide();
    while (_index < _tokens.length) {
      String operator = _tokens[_index];
      if (operator != '+' && operator != '-') {
        break;
      } else {
        _index++;
      }

      double second = _multiplyOrDevide();
      operator == '+' ? first += second : first -= second;
    }
    return first;
  }

  /// умнажение и деление
  double _multiplyOrDevide() {
    double first = _factor();
    while (_index < _tokens.length) {
      String operator = _tokens[_index];
      if (operator != '*' && operator != '/') {
        break;
      } else {
        _index++;
      }

      double second = _factor();
      operator == '*' ? first *= second : first /= second;
    }
    return first;
  }

  /// скобки
  double _factor() {
    String nextToken = _tokens[_index];
    double result;
    if (nextToken == '(') {
      _index++;
      result = _plusOrMinus();
      String rightParenthesis;
      _index < _tokens.length
          ? rightParenthesis = _tokens[_index]
          : throw Exception("Error - end of expression");

      if (_index < _tokens.length && rightParenthesis == ')') {
        _index++;
        return result;
      }
      throw Exception('Error - right Parenthesis is not found');
    }
    _index++;
    return double.parse(nextToken);
  }
}
