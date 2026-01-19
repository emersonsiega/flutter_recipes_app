import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../utils/faker_test_helpers.dart';

class MockCategoryViewController extends Mock implements CategoryViewController {}

void main() {
  late MockCategoryViewController mockViewModel;
  late Faker faker;
  late Category testCategory;

  setUpAll(() {
    faker = Faker();
    registerFallbackValue(faker.createCategory());
  });

  setUp(() {
    mockViewModel = MockCategoryViewController();
    testCategory = faker.createCategory();
    LocaleSettings.setLocale(AppLocale.ptBr);
  });

  Widget createTestWidget(CategoryViewController viewModel, Category category) {
    return MaterialApp(
      home: ChangeNotifierProvider<CategoryViewController>.value(
        value: viewModel,
        child: CategoryScreen(category: category),
      ),
    );
  }

  group('CategoryScreen', () {
    group('Loading', () {
      testWidgets('should display loading indicator when recipes are loading', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const CategoryState(recipes: [], isLoading: true, hasError: false),
        );
        when(() => mockViewModel.fetchRecipes(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testCategory));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.byType(CustomProgressIndicator), findsOneWidget);
      });
    });

    group('Success', () {
      testWidgets('should call fetchRecipes on init', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const CategoryState(recipes: [], isLoading: true, hasError: false),
        );
        when(() => mockViewModel.fetchRecipes(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testCategory));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        verify(() => mockViewModel.fetchRecipes(testCategory)).called(1);
      });

      testWidgets('should display recipes list when fetchRecipes succeeds', (tester) async {
        // Arrange
        final recipes = List.generate(
          3,
          (index) => faker.createRecipeSummary(),
        );

        when(() => mockViewModel.state).thenReturn(
          CategoryState(recipes: recipes, isLoading: false, hasError: false),
        );
        when(() => mockViewModel.fetchRecipes(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testCategory));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        // SliverList is lazy-loaded, so we check that RecipeCards exist and count text is displayed
        expect(find.byType(RecipeCard), findsWidgets);
        expect(find.text(t.category.recipesCount(count: 3)), findsOneWidget);
      });

      testWidgets('should display no recipes message when recipes list is empty', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const CategoryState(recipes: [], isLoading: false, hasError: false),
        );
        when(() => mockViewModel.fetchRecipes(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testCategory));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(t.category.noRecipesFound), findsOneWidget);
        expect(find.byType(RecipeCard), findsNothing);
      });

      testWidgets('should display recipes count when recipes are available', (tester) async {
        // Arrange
        final recipes = List.generate(
          5,
          (index) => faker.createRecipeSummary(),
        );

        when(() => mockViewModel.state).thenReturn(
          CategoryState(recipes: recipes, isLoading: false, hasError: false),
        );
        when(() => mockViewModel.fetchRecipes(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testCategory));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        // SliverList is lazy-loaded, so we check that RecipeCards exist and count text is displayed
        expect(find.text(t.category.recipesCount(count: 5)), findsOneWidget);
        expect(find.byType(RecipeCard), findsWidgets);
      });
    });

    group('Failure', () {
      testWidgets('should display error message box when fetchRecipes fails', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const CategoryState(recipes: [], isLoading: false, hasError: true),
        );
        when(() => mockViewModel.fetchRecipes(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testCategory));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.byType(ErrorMessageBox), findsOneWidget);
        expect(find.text(t.category.errorLoadingRecipes), findsOneWidget);
        expect(find.text(t.actions.retry), findsOneWidget);
      });

      testWidgets('should call fetchRecipes when retry button is tapped', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const CategoryState(recipes: [], isLoading: false, hasError: true),
        );
        when(() => mockViewModel.fetchRecipes(any())).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel, testCategory));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        final retryButton = find.text(t.actions.retry);
        expect(retryButton, findsOneWidget);
        await tester.tap(retryButton);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        verify(() => mockViewModel.fetchRecipes(testCategory)).called(2); // Once on init, once on retry
      });
    });
  });
}
