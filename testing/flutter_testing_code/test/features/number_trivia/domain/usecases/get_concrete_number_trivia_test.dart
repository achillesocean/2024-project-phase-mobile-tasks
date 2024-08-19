import 'package:dartz/dartz.dart';
import 'package:flutter_testing_code/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_testing_code/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_testing_code/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {

}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(repository: mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: 'text', number: 1);


  test(
    'should get trivia for the number from the repository',
    () async {
      // arrange
      // here you wanna give functionality to the mocked instance of the repository
      // when(mockNumberTriviaRepository.getConcreteNumberTrivia(argThat(equals(tNumber)))).thenAnswer((_) async => Right(tNumberTrivia));
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber)).thenAnswer((_) async => Right(tNumberTrivia));


      // act 
      final result = await usecase(Params(number: tNumber));
      // assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}