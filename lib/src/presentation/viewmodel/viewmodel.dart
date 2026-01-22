import 'package:flutter/foundation.dart';
import 'package:flutter_recipes_app/src/infra/logger/logger.dart';

abstract class ViewModel<T> extends ChangeNotifier {
  late T _state;
  T get state => _state;

  ViewModel(this._state) {
    logger.d('$runtimeType initialized');
  }

  @override
  @mustCallSuper
  void dispose() {
    logger.d('$runtimeType disposed');
    super.dispose();
  }

  void emit(T newState) {
    _state = newState;
    notifyListeners();
  }
}
