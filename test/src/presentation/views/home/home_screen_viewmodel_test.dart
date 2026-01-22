import 'package:dart_either/dart_either.dart';
import 'package:faker/faker.dart';
import 'package:flutter_recipes_app/src/data/data.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/views/home/home_screen_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/faker_test_helpers.dart';

class MockRecipeRepository extends Mock implements IRecipeRepository {}

class MockFetchRecipeSuggestions extends Mock implements FetchRecipeSuggestions {}

void main() {
  late HomeViewModel sut;
  late MockRecipeRepository mockRecipeRepository;
  late MockFetchRecipeSuggestions mockFetchRecipeSuggestions;
  late Faker faker;

  setUp(() {
    mockRecipeRepository = MockRecipeRepository();
    mockFetchRecipeSuggestions = MockFetchRecipeSuggestions();
    sut = HomeViewModel(mockRecipeRepository, mockFetchRecipeSuggestions);
    faker = Faker();
  });

  group('fetchCategories', () {
    group('Success', () {
      test('should update state to loading then success with categories when repository succeeds', () async {
        // Arrange
        final categories = List.generate(3, (index) => faker.createCategory());

        when(() => mockRecipeRepository.getCategories()).thenAnswer((_) async => Right(categories));

        // Act
        await sut.fetchCategories();

        // Assert
        expect(sut.state.categories.data, hasLength(3));
        expect(sut.state.categories.isLoading, isFalse);
        expect(sut.state.categories.hasError, isFalse);
        expect(sut.state.categories.data[0].name, categories[0].name);
        expect(sut.state.categories.data[0].id, categories[0].id);
        verify(() => mockRecipeRepository.getCategories()).called(1);
      });

      test('should update state to loading then success with empty list when repository returns empty list', () async {
        // Arrange
        final emptyCategories = <Category>[];

        when(() => mockRecipeRepository.getCategories()).thenAnswer((_) async => Right(emptyCategories));

        // Act
        await sut.fetchCategories();

        // Assert
        expect(sut.state.categories.data, isEmpty);
        expect(sut.state.categories.isLoading, isFalse);
        expect(sut.state.categories.hasError, isFalse);
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
        expect(sut.state.categories.hasError, isTrue);
        expect(sut.state.categories.isLoading, isFalse);
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
        expect(sut.state.categories.hasError, isTrue);
        expect(sut.state.categories.isLoading, isFalse);
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
        expect(sut.state.categories.hasError, isTrue);
        expect(sut.state.categories.isLoading, isFalse);
        verify(() => mockRecipeRepository.getCategories()).called(1);
      });
    });
  });

  group('fetchSuggestions', () {
    group('Success', () {
      test('should update state to loading then success with suggestions when use case succeeds', () async {
        // Arrange
        final suggestions = List.generate(3, (index) => faker.createDetailedRecipeModel().toEntity());

        when(() => mockFetchRecipeSuggestions()).thenAnswer((_) async => Right(suggestions));

        // Act
        await sut.fetchSuggestions();

        // Assert
        expect(sut.state.suggestions.data, hasLength(3));
        expect(sut.state.suggestions.isLoading, isFalse);
        expect(sut.state.suggestions.hasError, isFalse);
        expect(sut.state.suggestions.data[0].id, suggestions[0].id);
        expect(sut.state.suggestions.data[0].name, suggestions[0].name);
        verify(() => mockFetchRecipeSuggestions()).called(1);
      });

      test('should update state to loading then success with empty list when use case returns empty list', () async {
        // Arrange
        final emptySuggestions = <DetailedRecipe>[];

        when(() => mockFetchRecipeSuggestions()).thenAnswer((_) async => Right(emptySuggestions));

        // Act
        await sut.fetchSuggestions();

        // Assert
        expect(sut.state.suggestions.data, isEmpty);
        expect(sut.state.suggestions.isLoading, isFalse);
        expect(sut.state.suggestions.hasError, isFalse);
        verify(() => mockFetchRecipeSuggestions()).called(1);
      });
    });

    group('Failure', () {
      test('should update state to loading then error when use case returns failure', () async {
        // Arrange
        final failure = Failure(message: 'Network error', cause: Exception('Connection failed'));

        when(() => mockFetchRecipeSuggestions()).thenAnswer((_) async => Left(failure));

        // Act
        await sut.fetchSuggestions();

        // Assert
        expect(sut.state.suggestions.hasError, isTrue);
        expect(sut.state.suggestions.isLoading, isFalse);
        verify(() => mockFetchRecipeSuggestions()).called(1);
      });

      test('should update state to loading then error when use case returns failure with timeout', () async {
        // Arrange
        final failure = Failure(
          message: 'Timeout occurred while performing fetchSuggestions',
          cause: Exception('Request timeout'),
        );

        when(() => mockFetchRecipeSuggestions()).thenAnswer((_) async => Left(failure));

        // Act
        await sut.fetchSuggestions();

        // Assert
        expect(sut.state.suggestions.hasError, isTrue);
        expect(sut.state.suggestions.isLoading, isFalse);
        verify(() => mockFetchRecipeSuggestions()).called(1);
      });

      test('should update state to loading then error when use case returns failure with format error', () async {
        // Arrange
        final failure = Failure(
          message: 'Invalid format while performing fetchSuggestions',
          cause: Exception('Invalid JSON format'),
        );

        when(() => mockFetchRecipeSuggestions()).thenAnswer((_) async => Left(failure));

        // Act
        await sut.fetchSuggestions();

        // Assert
        expect(sut.state.suggestions.hasError, isTrue);
        expect(sut.state.suggestions.isLoading, isFalse);
        verify(() => mockFetchRecipeSuggestions()).called(1);
      });
    });
  });
}
