import 'package:dartz/dartz.dart';
import 'package:flutter_testing_code/core/usecases/usecase.dart';
import 'package:flutter_testing_code/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_testing_code/features/number_trivia/domain/repositories/number_trivia_repository.dart';
// import 'package:flutter_testing_code/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_testing_code/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {

}

void main() {
  late GetRandomNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia( mockNumberTriviaRepository);
  });

  final tNumberTrivia = NumberTrivia(text: 'text', number: 1);


  test(
    'should get trivia from the repository',
    () async {
      // arrange
      when(mockNumberTriviaRepository.getRandomNumberTrivia()).thenAnswer((_) async => Right(tNumberTrivia));


      // act 
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}