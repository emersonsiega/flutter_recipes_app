import 'package:dart_either/dart_either.dart';
import 'package:faker/faker.dart';
import 'package:flutter_recipes_app/src/data/data.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/domain/usecases/fetch_recipe_suggestions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/faker_test_helpers.dart';

class MockRecipeRepository extends Mock implements IRecipeRepository {}

void main() {
  late FetchRecipeSuggestions sut;
  late MockRecipeRepository mockRepository;
  late Faker faker;

  setUp(() {
    mockRepository = MockRecipeRepository();
    sut = FetchRecipeSuggestions(mockRepository);
    faker = Faker();
  });

  group('FetchRecipeSuggestions', () {
    group('Success', () {
      test('should return list of unique recipes when default recipeCount is used', () async {
        // Arrange
        final recipes = List.generate(
          3,
          (index) => faker.createDetailedRecipeModel().toEntity(),
        );

        var callCount = 0;
        when(() => mockRepository.getRandomRecipe()).thenAnswer((_) async {
          return Right(recipes[callCount++]);
        });

        // Act
        final result = await sut.call();

        // Assert
        expect(result, isA<Right<Failure, List<DetailedRecipe>>>());
        result.fold(
          ifLeft: (failure) => fail('Expected Right but got Left: ${failure.message}'),
          ifRight: (recipeList) {
            expect(recipeList, hasLength(3));
            expect(recipeList[0].id, recipes[0].id);
            expect(recipeList[1].id, recipes[1].id);
            expect(recipeList[2].id, recipes[2].id);
          },
        );
        verify(() => mockRepository.getRandomRecipe()).called(3);
      });

      test('should skip duplicate recipes and continue fetching until unique count is reached', () async {
        // Arrange
        final uniqueRecipe1 = faker.createDetailedRecipeModel().toEntity();
        final uniqueRecipe2 = faker.createDetailedRecipeModel().toEntity();
        final uniqueRecipe3 = faker.createDetailedRecipeModel().toEntity();

        // First call returns unique recipe 1
        // Second call returns duplicate of recipe 1 (should be skipped)
        // Third call returns unique recipe 2
        // Fourth call returns unique recipe 3
        var callCount = 0;
        when(() => mockRepository.getRandomRecipe()).thenAnswer((_) async {
          callCount++;
          if (callCount == 1) return Right(uniqueRecipe1);
          if (callCount == 2) return Right(uniqueRecipe1); // duplicate
          if (callCount == 3) return Right(uniqueRecipe2);
          return Right(uniqueRecipe3);
        });

        // Act
        final result = await sut.call(recipeCount: 3);

        // Assert
        expect(result, isA<Right<Failure, List<DetailedRecipe>>>());
        result.fold(
          ifLeft: (failure) => fail('Expected Right but got Left: ${failure.message}'),
          ifRight: (recipeList) {
            expect(recipeList, hasLength(3));
            expect(recipeList[0].id, uniqueRecipe1.id);
            expect(recipeList[1].id, uniqueRecipe2.id);
            expect(recipeList[2].id, uniqueRecipe3.id);
            // Verify no duplicates
            final ids = recipeList.map((r) => r.id).toSet();
            expect(ids, hasLength(3));
          },
        );
        verify(() => mockRepository.getRandomRecipe()).called(4);
      });

      test('should return fewer recipes than requested if max attempts is reached', () async {
        // Arrange
        final recipeCount = 5;
        final maxAttempts = recipeCount * 2; // 10 attempts
        final uniqueRecipe = faker.createDetailedRecipeModel().toEntity();

        // Return the same recipe every time (simulating API limitation)
        when(() => mockRepository.getRandomRecipe()).thenAnswer((_) async => Right(uniqueRecipe));

        // Act
        final result = await sut.call(recipeCount: recipeCount);

        // Assert
        expect(result, isA<Right<Failure, List<DetailedRecipe>>>());
        result.fold(
          ifLeft: (failure) => fail('Expected Right but got Left: ${failure.message}'),
          ifRight: (recipeList) {
            // Should only have 1 unique recipe despite requesting 5
            expect(recipeList, hasLength(1));
            expect(recipeList[0].id, uniqueRecipe.id);
          },
        );
        // Should have made maxAttempts calls
        verify(() => mockRepository.getRandomRecipe()).called(maxAttempts);
      });

      test('should return empty list when recipeCount is 0', () async {
        // Act
        final result = await sut.call(recipeCount: 0);

        // Assert
        expect(result, isA<Right<Failure, List<DetailedRecipe>>>());
        result.fold(
          ifLeft: (failure) => fail('Expected Right but got Left: ${failure.message}'),
          ifRight: (recipeList) => expect(recipeList, isEmpty),
        );
        verifyNever(() => mockRepository.getRandomRecipe());
      });
    });

    group('Failure', () {
      test('should return Failure immediately when repository fails', () async {
        // Arrange
        final failure = Failure(message: 'Network error', cause: Exception('Connection failed'));
        when(() => mockRepository.getRandomRecipe()).thenAnswer((_) async => Left(failure));

        // Act
        final result = await sut.call(recipeCount: 3);

        // Assert
        expect(result, isA<Left<Failure, List<DetailedRecipe>>>());
        result.fold(
          ifLeft: (f) {
            expect(f.message, equals(failure.message));
            expect(f.cause, equals(failure.cause));
          },
          ifRight: (_) => fail('Expected Left but got Right'),
        );
        verify(() => mockRepository.getRandomRecipe()).called(1);
      });
    });
  });
}
