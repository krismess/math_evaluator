import 'package:math_evaluator/math_evaluator.dart';
import 'package:test/test.dart';

import 'test_utils/math_expressions.dart';

void main() {
  test('Required test expression1 = ${MathExpressions.requiredTestExpression1}',
      () {
    final double result =
        MathExpEvaluator(MathExpressions.requiredTestExpression1)
            .evaluateMathExpression();
    expect(result, equals(51.0));
  });

  test('Required test expression2 = ${MathExpressions.requiredTestExpression2}',
      () {
    final double result = MathExpEvaluator(
      MathExpressions.requiredTestExpression2,
      params: {'x': 10},
    ).evaluateMathExpression();
    expect(result, equals(5.0));
  });

  test('Required test expression3 = ${MathExpressions.requiredTestExpression3}',
      () {
    final double result = MathExpEvaluator(
      MathExpressions.requiredTestExpression3,
      params: {'x': 10},
    ).evaluateMathExpression();
    expect(result, equals(33.0));
  });

  test('test exp 1 = ${MathExpressions.testExp1}', () {
    final double result = MathExpEvaluator(
      MathExpressions.testExp1,
    ).evaluateMathExpression();
    expect(result, equals(0.0));
  });

  test('test exp 2 = ${MathExpressions.testExp2}', () {
    final double result = MathExpEvaluator(
      MathExpressions.testExp2,
      params: {
        'x': 10,
      },
    ).evaluateMathExpression();
    expect(result, equals(60.0));
  });

  test('test exp 3 = ${MathExpressions.testExp3}', () {
    final double result = MathExpEvaluator(
      MathExpressions.testExp3,
      params: {
        'a': 3,
        'b': 6,
      },
    ).evaluateMathExpression();
    expect(result, equals(-1.0));
  });
}
