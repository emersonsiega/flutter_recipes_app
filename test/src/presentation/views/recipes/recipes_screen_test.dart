import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/presentation.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipes/widgets/category_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

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
      testWidgets('should call fetchCategories on init', (WidgetTester tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(const RecipesScreenState.idle());
        when(() => mockViewModel.fetchCategories()).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        verify(() => mockViewModel.fetchCategories()).called(1);
      });

      group('Success', () {
        testWidgets('should display categories list when fetchCategories succeeds', (WidgetTester tester) async {
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

          when(() => mockViewModel.state).thenReturn(
            RecipesScreenState.success(categories: categories),
          );
          when(() => mockViewModel.fetchCategories()).thenAnswer((_) async {});

          // Act
          await tester.pumpWidget(createTestWidget(mockViewModel));
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 100));

          // Assert
          expect(find.byType(ListView), findsOneWidget);
          expect(find.byType(CategoryListTile), findsNWidgets(3));
        });

        testWidgets('should display no categories message when categories list is empty', (WidgetTester tester) async {
          // Arrange
          when(() => mockViewModel.state).thenReturn(
            const RecipesScreenState.success(categories: []),
          );
          when(() => mockViewModel.fetchCategories()).thenAnswer((_) async {});

          // Act
          await tester.pumpWidget(createTestWidget(mockViewModel));
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 100));

          // Assert
          expect(find.text(t.recipes.noCategoriesFound), findsOneWidget);
        });
      });

      group('Failure', () {
        testWidgets('should display error message box when fetchCategories fails', (WidgetTester tester) async {
          // Arrange
          when(() => mockViewModel.state).thenReturn(const RecipesScreenState.error());
          when(() => mockViewModel.fetchCategories()).thenAnswer((_) async {});

          // Act
          await tester.pumpWidget(createTestWidget(mockViewModel));
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 100));

          // Assert
          expect(find.byType(ErrorMessageBox), findsOneWidget);
          expect(find.text(t.recipes.retry), findsOneWidget);
        });

        testWidgets('should call fetchCategories when retry button is tapped', (WidgetTester tester) async {
          // Arrange
          when(() => mockViewModel.state).thenReturn(const RecipesScreenState.error());
          when(() => mockViewModel.fetchCategories()).thenAnswer((_) async {});

          // Act
          await tester.pumpWidget(createTestWidget(mockViewModel));
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 100));

          final retryButton = find.text(t.recipes.retry);
          expect(retryButton, findsOneWidget);
          await tester.tap(retryButton);
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 100));

          // Assert
          verify(() => mockViewModel.fetchCategories()).called(greaterThan(1));
        });
      });
    });

    group('Loading States', () {
      testWidgets('should display progress indicator when state is loading', (WidgetTester tester) async {
        // Arrange
        when(() => mockViewModel.state).thenReturn(const RecipesScreenState.loading());
        when(() => mockViewModel.fetchCategories()).thenAnswer((_) async {});

        // Act
        await tester.pumpWidget(createTestWidget(mockViewModel));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Assert
        expect(find.byType(CustomProgressIndicator), findsOneWidget);
      });
    });
  });
}
