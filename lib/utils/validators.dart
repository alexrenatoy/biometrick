

String? validateTXT(String? value) {
  if (value == null || value.isEmpty) {
    return 'El campo es requerido';
  }
  final RegExp usernameRegex = RegExp(r'^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$');
  if (!usernameRegex.hasMatch(value)) {
    return 'Este campo solo admite letras';
  }
  if (value.length > 20) {
    return 'No debes exceder el límite de carácteres';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'El correo es requerido';
  }
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );
  if (!emailRegex.hasMatch(value)) {
    return 'Ingrese un correo válido';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Contraseña requerida';
  }
  if (value.length < 6 || value.length > 20) {
    return 'La contraseña debe tener entre 6 y 20 carácteres';
  }
  return null;
}

String? validateNumericField(String? value) {
  if (value == null || value.isEmpty) {
    return 'El campo es requerido';
  }
  final RegExp numericRegex = RegExp(r'^[0-9]+$');
  if (!numericRegex.hasMatch(value)) {
    return 'Este campo solo admite números';
  }
  return null;
}
