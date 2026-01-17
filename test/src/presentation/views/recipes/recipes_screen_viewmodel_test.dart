import 'package:dart_either/dart_either.dart';
import 'package:faker/faker.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipes/recipes_screen_state.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipes/recipes_screen_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecipeRepository extends Mock implements IRecipeRepository {}

void main() {
  late RecipesScreenViewModel sut;
  late MockRecipeRepository mockRecipeRepository;
  late Faker faker;

  setUp(() {
    mockRecipeRepository = MockRecipeRepository();
    sut = RecipesScreenViewModel(mockRecipeRepository);
    faker = Faker();
  });

  group('fetchCategories', () {
    group('Success', () {
      test('should update state to loading then success with categories when repository succeeds', () async {
        // Arrange
        final categories = List.generate(
          3,
          (index) => Category(
            id: faker.guid.guid(),
            name: faker.food.cuisine(),
            description: faker.lorem.sentence(),
            imageUrl: Uri.parse(faker.internet.httpsUrl()),
          ),
        );

        when(() => mockRecipeRepository.getCategories()).thenAnswer((_) async => Right(categories));

        // Act
        await sut.fetchCategories();

        // Assert
        expect(sut.state, isA<SuccessState>());
        if (sut.state case SuccessState(categories: final stateCategories)) {
          expect(stateCategories, hasLength(3));
          expect(stateCategories[0].name, categories[0].name);
          expect(stateCategories[0].id, categories[0].id);
        } else {
          fail('Expected SuccessState but got ${sut.state.runtimeType}');
        }
        verify(() => mockRecipeRepository.getCategories()).called(1);
      });

      test('should update state to loading then success with empty list when repository returns empty list', () async {
        // Arrange
        final emptyCategories = <Category>[];

        when(() => mockRecipeRepository.getCategories()).thenAnswer((_) async => Right(emptyCategories));

        // Act
        await sut.fetchCategories();

        // Assert
        expect(sut.state, isA<SuccessState>());
        if (sut.state case SuccessState(categories: final stateCategories)) {
          expect(stateCategories, isEmpty);
        } else {
          fail('Expected SuccessState but got ${sut.state.runtimeType}');
        }
        verify(() => mockRecipeRepository.getCategories()).called(1);
      });
    });

    group('Failure', () {
      test('should update state to loading then error when repository returns failure', () async {
        // Arrange
        final failure = Failure(message: 'Network error', cause: Exception('Connection failed'));

        when(() => mockRecipeRepository.getCategories()).thenAnswer((_) async => Left(failure));

        // Act
        await sut.fetchCategories();

        // Assert
        expect(sut.state, isA<ErrorState>());
        verify(() => mockRecipeRepository.getCategories()).called(1);
      });

      test('should update state to loading then error when repository returns failure with timeout', () async {
        // Arrange
        final failure = Failure(
          message: 'Timeout occurred while performing getCategories',
          cause: Exception('Request timeout'),
        );

        when(() => mockRecipeRepository.getCategories()).thenAnswer((_) async => Left(failure));

        // Act
        await sut.fetchCategories();

        // Assert
        expect(sut.state, isA<ErrorState>());
        verify(() => mockRecipeRepository.getCategories()).called(1);
      });

      test('should update state to loading then error when repository returns failure with format error', () async {
        // Arrange
        final failure = Failure(
          message: 'Invalid format while performing getCategories',
          cause: Exception('Invalid JSON format'),
        );

        when(() => mockRecipeRepository.getCategories()).thenAnswer((_) async => Left(failure));

        // Act
        await sut.fetchCategories();

        // Assert
        expect(sut.state, isA<ErrorState>());
        verify(() => mockRecipeRepository.getCategories()).called(1);
      });
    });
  });
}

