import 'dart:async';

import 'package:dart_either/dart_either.dart';
import 'package:faker/faker.dart';
import 'package:flutter_recipes_app/src/data/data.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/faker_test_helpers.dart';

class MockRecipeRemoteDatasource extends Mock implements IRecipeRemoteDatasource {}

void main() {
  late RecipeRepository sut;
  late MockRecipeRemoteDatasource mockRemoteDatasource;
  late Faker faker;

  setUp(() {
    mockRemoteDatasource = MockRecipeRemoteDatasource();
    sut = RecipeRepository(remoteDatasource: mockRemoteDatasource);
    faker = Faker();
  });

  group('getCategories', () {
    group('Success', () {
      test('should return list of categories when datasource succeeds', () async {
        // Arrange
        final categoryModels = List.generate(3, (index) => faker.createCategoryModel());
        final categoriesResponse = CategoriesResponseModel(categories: categoryModels);

        when(() => mockRemoteDatasource.getCategories()).thenAnswer((_) async => categoriesResponse);

        // Act
        final result = await sut.getCategories();

        // Assert
        expect(result, isA<Right<Failure, List<Category>>>());
        result.fold(
          ifLeft: (failure) => fail('Expected Right but got Left: ${failure.message}'),
          ifRight: (categories) {
            expect(categories, hasLength(3));
            expect(categories[0].name, categoryModels[0].strCategory);
            expect(categories[0].id, categoryModels[0].idCategory);
            expect(categories[0].description, categoryModels[0].strCategoryDescription);
          },
        );
        verify(() => mockRemoteDatasource.getCategories()).called(1);
      });

      test('should return empty list when datasource returns empty list', () async {
        // Arrange
        final categoriesResponse = CategoriesResponseModel(categories: []);

        when(() => mockRemoteDatasource.getCategories()).thenAnswer((_) async => categoriesResponse);

        // Act
        final result = await sut.getCategories();

        // Assert
        expect(result, isA<Right<Failure, List<Category>>>());
        result.fold(
          ifLeft: (failure) => fail('Expected Right but got Left: ${failure.message}'),
          ifRight: (categories) => expect(categories, isEmpty),
        );
        verify(() => mockRemoteDatasource.getCategories()).called(1);
      });
    });

    group('Failure', () {
      test('should return Failure when datasource throws TimeoutException', () async {
        // Arrange
        when(() => mockRemoteDatasource.getCategories()).thenThrow(TimeoutException('Request timeout'));

        // Act
        final result = await sut.getCategories();

        // Assert
        expect(result, isA<Left<Failure, List<Category>>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Timeout occurred while performing getCategories'));
            expect(failure.cause, isA<TimeoutException>());
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.getCategories()).called(1);
      });

      test('should return Failure when datasource throws FormatException', () async {
        // Arrange
        when(() => mockRemoteDatasource.getCategories()).thenThrow(FormatException('Invalid JSON format'));

        // Act
        final result = await sut.getCategories();

        // Assert
        expect(result, isA<Left<Failure, List<Category>>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Invalid format while performing getCategories'));
            expect(failure.cause, isA<FormatException>());
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.getCategories()).called(1);
      });

      test('should return Failure when datasource throws generic Exception', () async {
        // Arrange
        final exception = Exception('Unexpected error');
        when(() => mockRemoteDatasource.getCategories()).thenThrow(exception);

        // Act
        final result = await sut.getCategories();

        // Assert
        expect(result, isA<Left<Failure, List<Category>>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Unexpected error during getCategories'));
            expect(failure.cause, equals(exception));
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.getCategories()).called(1);
      });
    });
  });

  group('searchRecipesByName', () {
    group('Success', () {
      test('should return list of detailed recipes when datasource succeeds', () async {
        // Arrange
        final searchQuery = faker.food.dish();
        final detailedRecipeModels = List.generate(
          2,
          (index) => faker.createDetailedRecipeModel(
            ingredientCount: 1,
            includeInstructions: false,
            includeTags: false,
            includeYoutube: false,
          ),
        );
        final mealsResponse = MealsResponseModel(
          meals: detailedRecipeModels.map((model) => model.toJson()).toList(),
        );

        when(() => mockRemoteDatasource.searchRecipesByName(searchQuery)).thenAnswer((_) async => mealsResponse);

        // Act
        final result = await sut.searchRecipesByName(searchQuery);

        // Assert
        expect(result, isA<Right<Failure, List<DetailedRecipe>>>());
        result.fold(
          ifLeft: (failure) => fail('Expected Right but got Left: ${failure.message}'),
          ifRight: (recipes) {
            expect(recipes, hasLength(2));
            expect(recipes[0].name, detailedRecipeModels[0].strMeal);
            expect(recipes[0].id, detailedRecipeModels[0].idMeal);
          },
        );
        verify(() => mockRemoteDatasource.searchRecipesByName(searchQuery)).called(1);
      });

      test('should return empty list when no recipes found', () async {
        // Arrange
        final searchQuery = faker.food.dish();
        final mealsResponse = MealsResponseModel(meals: []);

        when(() => mockRemoteDatasource.searchRecipesByName(searchQuery)).thenAnswer((_) async => mealsResponse);

        // Act
        final result = await sut.searchRecipesByName(searchQuery);

        // Assert
        expect(result, isA<Right<Failure, List<DetailedRecipe>>>());
        result.fold(
          ifLeft: (failure) => fail('Expected Right but got Left: ${failure.message}'),
          ifRight: (recipes) => expect(recipes, isEmpty),
        );
        verify(() => mockRemoteDatasource.searchRecipesByName(searchQuery)).called(1);
      });
    });

    group('Failure', () {
      test('should return Failure when datasource throws TimeoutException', () async {
        // Arrange
        final searchQuery = faker.food.dish();
        when(
          () => mockRemoteDatasource.searchRecipesByName(searchQuery),
        ).thenThrow(TimeoutException('Request timeout'));

        // Act
        final result = await sut.searchRecipesByName(searchQuery);

        // Assert
        expect(result, isA<Left<Failure, List<DetailedRecipe>>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Timeout occurred while performing searchRecipesByName'));
            expect(failure.cause, isA<TimeoutException>());
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.searchRecipesByName(searchQuery)).called(1);
      });

      test('should return Failure when datasource throws FormatException', () async {
        // Arrange
        final searchQuery = faker.food.dish();
        when(
          () => mockRemoteDatasource.searchRecipesByName(searchQuery),
        ).thenThrow(FormatException('Invalid JSON format'));

        // Act
        final result = await sut.searchRecipesByName(searchQuery);

        // Assert
        expect(result, isA<Left<Failure, List<DetailedRecipe>>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Invalid format while performing searchRecipesByName'));
            expect(failure.cause, isA<FormatException>());
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.searchRecipesByName(searchQuery)).called(1);
      });

      test('should return Failure when datasource throws generic Exception', () async {
        // Arrange
        final searchQuery = faker.food.dish();
        final exception = Exception('Network error');
        when(() => mockRemoteDatasource.searchRecipesByName(searchQuery)).thenThrow(exception);

        // Act
        final result = await sut.searchRecipesByName(searchQuery);

        // Assert
        expect(result, isA<Left<Failure, List<DetailedRecipe>>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Unexpected error during searchRecipesByName'));
            expect(failure.cause, equals(exception));
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.searchRecipesByName(searchQuery)).called(1);
      });

      test('should handle empty search query', () async {
        // Arrange
        when(() => mockRemoteDatasource.searchRecipesByName('')).thenThrow(Exception('Empty search query'));

        // Act
        final result = await sut.searchRecipesByName('');

        // Assert
        expect(result, isA<Left<Failure, List<DetailedRecipe>>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Unexpected error during searchRecipesByName'));
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.searchRecipesByName('')).called(1);
      });
    });
  });

  group('getRecipesByCategory', () {
    group('Success', () {
      test('should return list of recipe summaries when datasource succeeds', () async {
        // Arrange
        final category = faker.createCategory();
        final recipeSummaryModels = List.generate(5, (index) => faker.createRecipeSummaryModel());
        final mealsResponse = MealsResponseModel(
          meals: recipeSummaryModels.map((model) => model.toJson()).toList(),
        );

        when(() => mockRemoteDatasource.getRecipesByCategory(category.name)).thenAnswer((_) async => mealsResponse);

        // Act
        final result = await sut.getRecipesByCategory(category);

        // Assert
        expect(result, isA<Right<Failure, List<RecipeSummary>>>());
        result.fold(
          ifLeft: (failure) => fail('Expected Right but got Left: ${failure.message}'),
          ifRight: (recipes) {
            expect(recipes, hasLength(5));
            expect(recipes[0].name, recipeSummaryModels[0].strMeal);
            expect(recipes[0].id, recipeSummaryModels[0].idMeal);
          },
        );
        verify(() => mockRemoteDatasource.getRecipesByCategory(category.name)).called(1);
      });
    });

    group('Failure', () {
      test('should return Failure when datasource throws TimeoutException', () async {
        // Arrange
        final category = faker.createCategory(description: null);
        when(
          () => mockRemoteDatasource.getRecipesByCategory(category.name),
        ).thenThrow(TimeoutException('Request timeout'));

        // Act
        final result = await sut.getRecipesByCategory(category);

        // Assert
        expect(result, isA<Left<Failure, List<RecipeSummary>>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Timeout occurred while performing getRecipesByCategory'));
            expect(failure.cause, isA<TimeoutException>());
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.getRecipesByCategory(category.name)).called(1);
      });

      test('should return Failure when datasource throws FormatException', () async {
        // Arrange
        final category = faker.createCategory(description: null);
        when(
          () => mockRemoteDatasource.getRecipesByCategory(category.name),
        ).thenThrow(FormatException('Invalid JSON format'));

        // Act
        final result = await sut.getRecipesByCategory(category);

        // Assert
        expect(result, isA<Left<Failure, List<RecipeSummary>>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Invalid format while performing getRecipesByCategory'));
            expect(failure.cause, isA<FormatException>());
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.getRecipesByCategory(category.name)).called(1);
      });

      test('should return Failure when datasource throws generic Exception', () async {
        // Arrange
        final category = faker.createCategory(description: null);
        final exception = Exception('Server error');
        when(() => mockRemoteDatasource.getRecipesByCategory(category.name)).thenThrow(exception);

        // Act
        final result = await sut.getRecipesByCategory(category);

        // Assert
        expect(result, isA<Left<Failure, List<RecipeSummary>>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Unexpected error during getRecipesByCategory'));
            expect(failure.cause, equals(exception));
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.getRecipesByCategory(category.name)).called(1);
      });

      test('should handle empty category name', () async {
        // Arrange
        final category = Category(name: '');
        when(() => mockRemoteDatasource.getRecipesByCategory('')).thenThrow(Exception('Empty category name'));

        // Act
        final result = await sut.getRecipesByCategory(category);

        // Assert
        expect(result, isA<Left<Failure, List<RecipeSummary>>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Unexpected error during getRecipesByCategory'));
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.getRecipesByCategory('')).called(1);
      });
    });
  });

  group('getRecipeById', () {
    group('Success', () {
      test('should return detailed recipe when datasource succeeds', () async {
        // Arrange
        final recipeId = faker.guid.guid();
        final detailedRecipeModel = faker.createDetailedRecipeModel(idMeal: recipeId);

        when(() => mockRemoteDatasource.getRecipeById(recipeId)).thenAnswer((_) async => detailedRecipeModel);

        // Act
        final result = await sut.getRecipeById(recipeId);

        // Assert
        expect(result, isA<Right<Failure, DetailedRecipe>>());
        result.fold(
          ifLeft: (failure) => fail('Expected Right but got Left: ${failure.message}'),
          ifRight: (recipe) {
            expect(recipe.id, recipeId);
            expect(recipe.name, detailedRecipeModel.strMeal);
            expect(recipe.ingredients, hasLength(2));
            expect(recipe.tags, hasLength(2));
          },
        );
        verify(() => mockRemoteDatasource.getRecipeById(recipeId)).called(1);
      });
    });

    group('Failure', () {
      test('should return Failure when datasource throws TimeoutException', () async {
        // Arrange
        final recipeId = faker.guid.guid();
        when(() => mockRemoteDatasource.getRecipeById(recipeId)).thenThrow(TimeoutException('Request timeout'));

        // Act
        final result = await sut.getRecipeById(recipeId);

        // Assert
        expect(result, isA<Left<Failure, DetailedRecipe>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Timeout occurred while performing getRecipeById'));
            expect(failure.cause, isA<TimeoutException>());
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.getRecipeById(recipeId)).called(1);
      });

      test('should return Failure when datasource throws FormatException', () async {
        // Arrange
        final recipeId = faker.guid.guid();
        when(() => mockRemoteDatasource.getRecipeById(recipeId)).thenThrow(FormatException('Invalid JSON format'));

        // Act
        final result = await sut.getRecipeById(recipeId);

        // Assert
        expect(result, isA<Left<Failure, DetailedRecipe>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Invalid format while performing getRecipeById'));
            expect(failure.cause, isA<FormatException>());
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.getRecipeById(recipeId)).called(1);
      });

      test('should return Failure when datasource throws generic Exception', () async {
        // Arrange
        final recipeId = faker.guid.guid();
        final exception = Exception('Not found');
        when(() => mockRemoteDatasource.getRecipeById(recipeId)).thenThrow(exception);

        // Act
        final result = await sut.getRecipeById(recipeId);

        // Assert
        expect(result, isA<Left<Failure, DetailedRecipe>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Unexpected error during getRecipeById'));
            expect(failure.cause, equals(exception));
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.getRecipeById(recipeId)).called(1);
      });

      test('should handle empty recipe id', () async {
        // Arrange
        when(() => mockRemoteDatasource.getRecipeById('')).thenThrow(Exception('Empty recipe id'));

        // Act
        final result = await sut.getRecipeById('');

        // Assert
        expect(result, isA<Left<Failure, DetailedRecipe>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Unexpected error during getRecipeById'));
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.getRecipeById('')).called(1);
      });
    });
  });

  group('getRandomRecipe', () {
    group('Success', () {
      test('should return detailed recipe when datasource succeeds', () async {
        // Arrange
        final recipeId = faker.guid.guid();
        final detailedRecipeModel = faker.createDetailedRecipeModel(idMeal: recipeId);

        when(() => mockRemoteDatasource.getRandomRecipe()).thenAnswer((_) async => detailedRecipeModel);

        // Act
        final result = await sut.getRandomRecipe();

        // Assert
        expect(result, isA<Right<Failure, DetailedRecipe>>());
        result.fold(
          ifLeft: (failure) => fail('Expected Right but got Left: ${failure.message}'),
          ifRight: (recipe) {
            expect(recipe.id, recipeId);
            expect(recipe.name, detailedRecipeModel.strMeal);
            expect(recipe.ingredients, hasLength(2));
            expect(recipe.tags, hasLength(2));
          },
        );
        verify(() => mockRemoteDatasource.getRandomRecipe()).called(1);
      });
    });

    group('Failure', () {
      test('should return Failure when datasource throws', () async {
        // Arrange
        when(() => mockRemoteDatasource.getRandomRecipe()).thenThrow(TimeoutException('Request timeout'));

        // Act
        final result = await sut.getRandomRecipe();

        // Assert
        expect(result, isA<Left<Failure, DetailedRecipe>>());
        result.fold(
          ifLeft: (failure) {
            expect(failure.message, contains('Timeout occurred while performing getRandomRecipe'));
            expect(failure.cause, isA<TimeoutException>());
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRemoteDatasource.getRandomRecipe()).called(1);
      });
    });
  });
}
