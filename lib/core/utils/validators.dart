import '../constants/app_strings.dart';

/// Validadores reutilizables para TextFormField en toda la app.
class Validators {
  Validators._();

  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.campoRequerido;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.campoRequerido;
    }
    final regex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$');
    if (!regex.hasMatch(value.trim())) {
      return AppStrings.correoInvalido;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.campoRequerido;
    }
    if (value.length < 6) {
      return AppStrings.contrasenaCorta;
    }
    return null;
  }

  static String? Function(String?) confirmPassword(String originalPassword) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return AppStrings.campoRequerido;
      }
      if (value != originalPassword) {
        return AppStrings.contrasenasNoCoinciden;
      }
      return null;
    };
  }

  static String? positiveNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.campoRequerido;
    }
    final parsed = double.tryParse(value.replaceAll(',', '.'));
    if (parsed == null) return 'Ingresa un número válido';
    if (parsed <= 0) return 'Debe ser mayor a 0';
    return null;
  }

  static String? nonNegativeNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.campoRequerido;
    }
    final parsed = double.tryParse(value.replaceAll(',', '.'));
    if (parsed == null) return 'Ingresa un número válido';
    if (parsed < 0) return 'No puede ser negativo';
    return null;
  }
}
