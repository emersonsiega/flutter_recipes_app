import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/data/data.dart';
import 'package:flutter_recipes_app/src/presentation/presentation.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipes/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../utils/faker_test_helpers.dart';

class MockRecipesScreenViewModel extends Mock implements RecipesScreenViewModel {}

void main() {
  late MockRecipesScreenViewModel mockViewModel;
  late Faker faker;

  setUp(() {
    mockViewModel = MockRecipesScreenViewModel();
    faker = Faker();
    LocaleSettings.setLocale(AppLocale.ptBr);
  });

  Widget createTestWidget(RecipesScreenViewModel viewModel) {
    return MaterialApp(
      home: ChangeNotifierProvider<RecipesScreenViewModel>.value(
        value: viewModel,
        child: const RecipesScreen(),
      ),
    );
  }

  group('RecipesScreen', () {
    group('Initial Load', () {
      testWidgets('should call fetchData on init', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipesScreenState(
            categories: AsyncData(data: [], isLoading: true),
            suggestions: AsyncData(data: [], isLoading: true),
          ),
        );
        when(() => mockViewModel.fetchData()).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        verify(() => mockViewModel.fetchData()).called(1);
      });

      group('Success', () {
        testWidgets('should display categories list when fetchCategories succeeds', (tester) async {
          // Arrange
          final categories = List.generate(3, (index) => faker.createCategory());

          when(() => mockViewModel.state).thenReturn(
            RecipesScreenState(
              categories: AsyncData(data: categories, isLoading: false),
              suggestions: AsyncData(data: [], isLoading: false),
            ),
          );
          when(() => mockViewModel.fetchData()).thenAnswer((_) async {});

          // Act
          await tester.pumpWidget(createTestWidget(mockViewModel));
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 100));

          // Assert
          expect(find.byType(GridView), findsOneWidget);
          expect(find.byType(CategoryCard), findsNWidgets(3));
        });

        testWidgets('should display no categories message when categories list is empty', (tester) async {
          // Arrange
          when(() => mockViewModel.state).thenReturn(
            const RecipesScreenState(
              categories: AsyncData(data: [], isLoading: false),
              suggestions: AsyncData(data: [], isLoading: false),
            ),
          );
          when(() => mockViewModel.fetchData()).thenAnswer((_) async {});

          // Act
          await tester.pumpWidget(createTestWidget(mockViewModel));
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 100));

          // Assert
          expect(find.text(t.recipes.noCategoriesFound), findsOneWidget);
        });
      });

      group('Failure', () {
        testWidgets('should display error message box when fetchCategories fails', (tester) async {
          // Arrange
          when(() => mockViewModel.state).thenReturn(
            const RecipesScreenState(
              categories: AsyncData(data: [], isLoading: false, hasError: true),
              suggestions: AsyncData(data: [], isLoading: false),
            ),
          );
          when(() => mockViewModel.fetchData()).thenAnswer((_) async {});
          when(() => mockViewModel.fetchCategories()).thenAnswer((_) async {});

          // Act
          await tester.pumpWidget(createTestWidget(mockViewModel));
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 100));

          // Assert
          expect(find.byType(ErrorMessageBox), findsOneWidget);
          expect(find.text(t.errorMessageBox.retry), findsOneWidget);
        });

        testWidgets('should call fetchCategories when retry button is tapped', (tester) async {
          // Arrange
          when(() => mockViewModel.state).thenReturn(
            const RecipesScreenState(
              categories: AsyncData(data: [], isLoading: false, hasError: true),
              suggestions: AsyncData(data: [], isLoading: false),
            ),
          );
          when(() => mockViewModel.fetchData()).thenAnswer((_) async {});
          when(() => mockViewModel.fetchCategories()).thenAnswer((_) async {});

          // Act
          await tester.pumpWidget(createTestWidget(mockViewModel));
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 100));

          final retryButton = find.text(t.errorMessageBox.retry);
          expect(retryButton, findsOneWidget);
          await tester.tap(retryButton);
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 100));

          // Assert
          verify(() => mockViewModel.fetchCategories()).called(1);
        });
      });
    });

    group('Loading States', () {
      testWidgets('should display loading card when categories are loading', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipesScreenState(
            categories: AsyncData(data: [], isLoading: true),
            suggestions: AsyncData(data: [], isLoading: false),
          ),
        );
        when(() => mockViewModel.fetchData()).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.byType(LoadingCard), findsOneWidget);
      });
    });
  });

  group('Suggestions', () {
    group('Success', () {
      testWidgets('should display suggestions list when fetchSuggestions succeeds', (tester) async {
        // Arrange
        final suggestions = List.generate(3, (index) => faker.createDetailedRecipeModel().toEntity());

        when(() => mockViewModel.state).thenReturn(
          RecipesScreenState(
            categories: AsyncData(data: [], isLoading: false),
            suggestions: AsyncData(data: suggestions, isLoading: false),
          ),
        );
        when(() => mockViewModel.fetchData()).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(t.recipes.suggestions), findsOneWidget);
        expect(find.byType(RecipeCard), findsNWidgets(3));
      });

      testWidgets('should display no suggestions message when suggestions list is empty', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipesScreenState(
            categories: AsyncData(data: [], isLoading: false),
            suggestions: AsyncData(data: [], isLoading: false),
          ),
        );
        when(() => mockViewModel.fetchData()).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(t.recipes.noSuggestionsFound), findsOneWidget);
      });
    });

    group('Failure', () {
      testWidgets('should display error message box when fetchSuggestions fails', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipesScreenState(
            categories: AsyncData(data: [], isLoading: false),
            suggestions: AsyncData(data: [], isLoading: false, hasError: true),
          ),
        );
        when(() => mockViewModel.fetchData()).thenAnswer((_) async {});
        when(() => mockViewModel.fetchSuggestions()).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.byType(ErrorMessageBox), findsOneWidget);
        expect(find.text(t.errorMessageBox.retry), findsOneWidget);
      });

      testWidgets('should call fetchSuggestions when retry button is tapped', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipesScreenState(
            categories: AsyncData(data: [], isLoading: false),
            suggestions: AsyncData(data: [], isLoading: false, hasError: true),
          ),
        );
        when(() => mockViewModel.fetchData()).thenAnswer((_) async {});
        when(() => mockViewModel.fetchSuggestions()).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        final retryButton = find.text(t.errorMessageBox.retry);
        expect(retryButton, findsOneWidget);
        await tester.tap(retryButton);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        verify(() => mockViewModel.fetchSuggestions()).called(1);
      });
    });

    group('Loading States', () {
      testWidgets('should display loading card when suggestions are loading', (tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(
          const RecipesScreenState(
            categories: AsyncData(data: [], isLoading: false),
            suggestions: AsyncData(data: [], isLoading: true),
          ),
        );
        when(() => mockViewModel.fetchData()).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.text(t.recipes.loadingSuggestions), findsOneWidget);
        expect(find.byType(LoadingCard), findsOneWidget);
      });
    });
  });
}
