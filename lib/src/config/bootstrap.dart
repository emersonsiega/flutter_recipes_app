import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/config/constants.dart';
import 'package:flutter_recipes_app/src/data/data.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/presentation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final providers = _setupProviders();

  runApp(
    MultiProvider(
      providers: providers,
      child: const MainApp(),
    ),
  );
}

List<InheritedProvider> _setupProviders() {
  return [
    Provider<Constants>(create: (_) => Constants()),
    Provider<http.Client>(create: (_) => http.Client()),
    Provider<IRecipeRemoteDatasource>(
      create: (context) {
        final constants = context.read<Constants>();
        final baseUrl = '${constants.baseUrl}/api/json/v1/${constants.apiKey}';
        return RecipeRemoteDatasource(httpClient: context.read<http.Client>(), baseUrl: baseUrl);
      },
    ),
    Provider<IRecipeRepository>(
      create: (context) => RecipeRepository(
        remoteDatasource: context.read<IRecipeRemoteDatasource>(),
      ),
    ),
    ChangeNotifierProvider<RecipesScreenViewModel>(
      create: (context) => RecipesScreenViewModel(),
    ),
  ];
}
