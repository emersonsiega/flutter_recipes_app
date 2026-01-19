import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/data/data.dart';
import 'package:flutter_recipes_app/src/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../utils/faker_test_helpers.dart';

class MockRecipeSearchScreenViewModel extends Mock implements RecipeSearchScreenViewModel {}

void main() {
  late MockRecipeSearchScreenViewModel mockViewModel;
  late Faker faker;
  late String testSearchName;

  setUp(() {
    mockViewModel = MockRecipeSearchScreenViewModel();
    faker = Faker();
    testSearchName = faker.food.dish();
    LocaleSettings.setLocale(AppLocale.ptBr);
  });

  Widget createTestWidget(RecipeSearchScreenViewModel viewModel, String name) {
    return MaterialApp(
      home: ChangeNotifierProvider<RecipeSearchScreenViewModel>.value(
        value: viewModel,
        child: RecipeSearchScreen(name: name),
      ),
    );
  }

  group('RecipeSearchScreen', () {
    group('Initial Load', () {
      testWidgets('should call searchRecipesByName on init', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipeSearchState(recipes: [], isLoading: true, hasError: false),
        );
        when(() => mockViewModel.searchRecipesByName(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testSearchName));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        verify(() => mockViewModel.searchRecipesByName(testSearchName)).called(1);
      });
    });

    group('Loading', () {
      testWidgets('should display loading indicator when recipes are loading', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipeSearchState(recipes: [], isLoading: true, hasError: false),
        );
        when(() => mockViewModel.searchRecipesByName(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testSearchName));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.byType(CustomProgressIndicator), findsOneWidget);
      });
    });

    group('Success', () {
      testWidgets('should display title with search name', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipeSearchState(recipes: [], isLoading: false, hasError: false),
        );
        when(() => mockViewModel.searchRecipesByName(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testSearchName));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(t.recipeSearch.title(name: testSearchName)), findsOneWidget);
      });

      testWidgets('should display back to home button', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipeSearchState(recipes: [], isLoading: false, hasError: false),
        );
        when(() => mockViewModel.searchRecipesByName(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testSearchName));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(t.actions.backToHome), findsOneWidget);
      });

      testWidgets('should display recipes list when search succeeds', (tester) async {
        // Arrange
        final recipes = List.generate(
          3,
          (index) => faker.createDetailedRecipeModel().toEntity(),
        );

        when(() => mockViewModel.state).thenReturn(
          RecipeSearchState(recipes: recipes, isLoading: false, hasError: false),
        );
        when(() => mockViewModel.searchRecipesByName(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testSearchName));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        // SliverList is lazy-loaded, so we check that RecipeCards exist and count text is displayed
        expect(find.byType(RecipeCard), findsWidgets);
        expect(find.text(t.recipeSearch.recipesCount(count: 3)), findsOneWidget);
      });

      testWidgets('should display recipes count when recipes are available', (tester) async {
        // Arrange
        final recipes = List.generate(
          5,
          (index) => faker.createDetailedRecipeModel().toEntity(),
        );

        when(() => mockViewModel.state).thenReturn(
          RecipeSearchState(recipes: recipes, isLoading: false, hasError: false),
        );
        when(() => mockViewModel.searchRecipesByName(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testSearchName));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        // SliverList is lazy-loaded, so we check that RecipeCards exist and count text is displayed
        expect(find.text(t.recipeSearch.recipesCount(count: 5)), findsOneWidget);
        expect(find.byType(RecipeCard), findsWidgets);
      });

      testWidgets('should display no recipes message when recipes list is empty', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipeSearchState(recipes: [], isLoading: false, hasError: false),
        );
        when(() => mockViewModel.searchRecipesByName(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testSearchName));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(t.recipeSearch.noRecipesFound), findsOneWidget);
        expect(find.byType(RecipeCard), findsNothing);
      });
    });

    group('Failure', () {
      testWidgets('should display error message box when search fails', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipeSearchState(recipes: [], isLoading: false, hasError: true),
        );
        when(() => mockViewModel.searchRecipesByName(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testSearchName));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.byType(ErrorMessageBox), findsOneWidget);
        expect(find.text(t.recipeSearch.errorLoadingRecipes), findsOneWidget);
        expect(find.text(t.actions.retry), findsOneWidget);
      });

      testWidgets('should call searchRecipesByName when retry button is tapped', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipeSearchState(recipes: [], isLoading: false, hasError: true),
        );
        when(() => mockViewModel.searchRecipesByName(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testSearchName));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        final retryButton = find.text(t.actions.retry);
        expect(retryButton, findsOneWidget);
        await tester.tap(retryButton);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        verify(() => mockViewModel.searchRecipesByName(testSearchName)).called(2); // Once on init, once on retry
      });
    });
  });
}
