import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/data/data.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/presentation.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipe_details/widgets/video_player.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../utils/faker_test_helpers.dart';

class MockRecipeDetailsViewModel extends Mock implements RecipeDetailsViewModel {}

void main() {
  late MockRecipeDetailsViewModel mockViewModel;
  late Faker faker;
  late RecipeSummary testRecipe;

  setUpAll(() {
    faker = Faker();
    registerFallbackValue(faker.createRecipeSummary());
  });

  setUp(() {
    mockViewModel = MockRecipeDetailsViewModel();
    testRecipe = faker.createRecipeSummary();
    LocaleSettings.setLocale(AppLocale.ptBr);
  });

  Widget createTestWidget(RecipeDetailsViewModel viewModel, Recipe recipe) {
    return MaterialApp(
      home: ChangeNotifierProvider<RecipeDetailsViewModel>.value(
        value: viewModel,
        child: RecipeDetailsScreen(recipe: recipe),
      ),
    );
  }

  group('RecipeDetailsScreen', () {
    group('Initial Load', () {
      testWidgets('should call fetchRecipeDetail on init', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipeDetailsState(isLoading: true, hasError: false),
        );
        when(() => mockViewModel.fetchRecipeDetail(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testRecipe));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        verify(() => mockViewModel.fetchRecipeDetail(testRecipe)).called(1);
      });
    });

    group('Loading State', () {
      testWidgets('should display loading indicator when recipe details are loading', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipeDetailsState(isLoading: true, hasError: false),
        );
        when(() => mockViewModel.fetchRecipeDetail(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testRecipe));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert - SliverFillRemaining should contain a CustomProgressIndicator
        final progressIndicator = find.descendant(
          of: find.byType(SliverFillRemaining),
          matching: find.byType(CustomProgressIndicator),
        );
        expect(progressIndicator, findsOneWidget);
      });
    });

    group('Error State', () {
      testWidgets('should display error message box when fetchRecipeDetail fails', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipeDetailsState(isLoading: false, hasError: true),
        );
        when(() => mockViewModel.fetchRecipeDetail(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testRecipe));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.byType(ErrorMessageBox), findsOneWidget);
        expect(find.text(t.recipeDetails.errorLoadingRecipe), findsOneWidget);
      });

      testWidgets('should call fetchRecipeDetail when retry button is tapped', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipeDetailsState(isLoading: false, hasError: true),
        );
        when(() => mockViewModel.fetchRecipeDetail(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testRecipe));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        final retryButton = find.text(t.actions.retry);
        expect(retryButton, findsOneWidget);
        await tester.tap(retryButton);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        verify(() => mockViewModel.fetchRecipeDetail(testRecipe)).called(2); // Once on init, once on retry
      });
    });

    group('Success State', () {
      testWidgets('should display recipe details when fetchRecipeDetail succeeds', (tester) async {
        // Arrange
        final detailedRecipe = faker.createDetailedRecipeModel().toEntity();
        when(() => mockViewModel.state).thenReturn(
          RecipeDetailsState(recipe: detailedRecipe, isLoading: false, hasError: false),
        );
        when(() => mockViewModel.fetchRecipeDetail(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testRecipe));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(detailedRecipe.category.name), findsOneWidget);
        expect(find.text(t.difficultyLevel(difficulty: detailedRecipe.difficulty)), findsOneWidget);
      });

      testWidgets('should display category chip', (tester) async {
        // Arrange
        final detailedRecipe = faker.createDetailedRecipeModel().toEntity();
        when(() => mockViewModel.state).thenReturn(
          RecipeDetailsState(recipe: detailedRecipe, isLoading: false, hasError: false),
        );
        when(() => mockViewModel.fetchRecipeDetail(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testRecipe));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(detailedRecipe.category.name), findsOneWidget);
      });

      testWidgets('should display difficulty level chip', (tester) async {
        // Arrange
        final detailedRecipe = faker.createDetailedRecipeModel().toEntity();
        when(() => mockViewModel.state).thenReturn(
          RecipeDetailsState(recipe: detailedRecipe, isLoading: false, hasError: false),
        );
        when(() => mockViewModel.fetchRecipeDetail(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testRecipe));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(t.difficultyLevel(difficulty: detailedRecipe.difficulty)), findsOneWidget);
      });

      testWidgets('should display area chip when area is provided', (tester) async {
        // Arrange
        final area = faker.address.country();
        final detailedRecipeModel = faker.createDetailedRecipeModel().copyWith(strArea: area);
        final detailedRecipe = detailedRecipeModel.toEntity();
        when(() => mockViewModel.state).thenReturn(
          RecipeDetailsState(recipe: detailedRecipe, isLoading: false, hasError: false),
        );
        when(() => mockViewModel.fetchRecipeDetail(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testRecipe));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(area), findsOneWidget);
      });

      testWidgets('should display video player when video URL is provided', (tester) async {
        // Arrange
        final detailedRecipeModel = faker.createDetailedRecipeModel();//.copyWith(strYoutube: faker.internet.httpsUrl());
        final detailedRecipe = detailedRecipeModel.toEntity();
        when(() => mockViewModel.state).thenReturn(
          RecipeDetailsState(recipe: detailedRecipe, isLoading: false, hasError: false),
        );
        when(() => mockViewModel.fetchRecipeDetail(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testRecipe));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(t.recipeDetails.videoTutorial), findsOneWidget);
        expect(find.byType(VideoPlayer), findsOneWidget);
      });

      testWidgets('should not display video player when video URL is null', (tester) async {
        // Arrange
        final detailedRecipeModel = faker.createDetailedRecipeModel(includeYoutube: false);
        final detailedRecipe = detailedRecipeModel.toEntity();
        when(() => mockViewModel.state).thenReturn(
          RecipeDetailsState(recipe: detailedRecipe, isLoading: false, hasError: false),
        );
        when(() => mockViewModel.fetchRecipeDetail(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testRecipe));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(t.recipeDetails.videoTutorial), findsNothing);
        expect(find.byType(VideoPlayer), findsNothing);
      });
    });

    group('No Recipe Found', () {
      testWidgets('should display no recipe found message when recipe is null', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipeDetailsState(recipe: null, isLoading: false, hasError: false),
        );
        when(() => mockViewModel.fetchRecipeDetail(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testRecipe));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(t.recipeDetails.noRecipeFound), findsOneWidget);
      });
    });
  });
}
