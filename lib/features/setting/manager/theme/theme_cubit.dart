import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool _isDark = true;
  bool _isLight = false;

  bool get isDark => _isDark;

  bool get isLight => _isLight;

  void toggleDarkTheme() {
    _isDark = !_isDark;
    _isLight = !_isDark; // Ensure that only one theme is active at a time
    emit(ThemeChanged());
  }

  void toggleLightTheme() {
    _isLight = !_isLight;
    _isDark = !_isLight; // Ensure that only one theme is active at a time
    emit(ThemeChanged());
  }
}