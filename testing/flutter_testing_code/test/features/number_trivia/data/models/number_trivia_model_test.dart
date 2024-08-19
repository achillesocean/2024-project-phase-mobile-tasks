import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_code/features/number_trivia/domain/entities/number_trivia.dart';

void main() {
  // a number trivia model to be used for all tests
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'test text');

  test(
    'should be subclass of NumberTrivia entity',
    () async {
      // assert
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    }
  );
} 