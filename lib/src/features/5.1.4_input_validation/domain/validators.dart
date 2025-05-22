String abc = 'abcdefghijklmnopqrstuvwxyz';
String abcUpperCase = abc.toUpperCase();
String abcLowerUpperCase = abc + abcUpperCase;
String umlauts = 'ßöäüÖÄÜ';
String emailAt = '@';
String emailPoint = '.';
String passwordStringUpperCase = 'Password';
String passwordStringLowerCase = 'password';
String allNumbers = '0123456789';



String? userNameValidation(String? userInput) {
  if (userInput == null || userInput.length < 3) {
    return 'User Name must have at least 3 characters';
  }
  if (userInput.length >= 21) {
    return 'User Name can only be 20 characters long';
  }
  if (userInput.contains(' ')) {
    return 'Empty spaces are not allowed in the User Name';
  }
  if (!abcLowerUpperCase.contains(userInput[0])) {
    return 'User Name must begin with a letter';
  }
  for (int i = 0; i < userInput.length; i++) {
    final String letter = userInput[i];
    if (umlauts.contains(letter)) {
      return 'Amtliche Sprache dieser App is Englisch';
    }
  }

  return null;
}

String? userEmailValitation(String? userInput) {
  if (userInput == null || userInput.length < 6) {
    return 'An E-Mail must have at least 6 characters';
  }
  if (userInput.contains(' ')) {
    return 'Empty spaces are not allowed in the password';
  }
  for (int i = 0; i < userInput.length; i++) {
    if (!userInput.contains(emailAt)) {
      return 'Not a valid E-Mail address';
    }
  }
  for (int i = 0; i < userInput.length; i++) {
    if (!userInput.contains(emailPoint)) {
      return 'Not a valid E-Mail address';
    }
  }
  if (userInput[0] == '@') {
    return 'Not a valid E-Mail Address';
  }
  return null;
}

String? userPasswordValidation(String? userInput) {
  bool hasNumber = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;

  if (userInput == null || userInput.length < 8) {
    return 'Password must have at least 8 characters';
  }
  if (userInput.length >= 66) {
    return 'Password can only be 66 characters long';
  }
  if (userInput.contains(' ')) {
    return 'Empty spaces are not allowed in the password';
  }

  for (int i = 0; i < userInput.length; i++) {
    final String letter = userInput[i];
    if (abcUpperCase.contains(letter)) {
      hasUpperCase = true;
    }
  }
  if (!hasUpperCase) {
    return 'Password must have at least 1 uppercase letter';
  }

  for (int i = 0; i < userInput.length; i++) {
    final String letter = userInput[i];
    if (abc.contains(letter)) {
      hasLowerCase = true;
    }
  }
  if (!hasLowerCase) {
    return 'Password must have at least 1 lowercase letter';
  }

  for (int i = 0; i < userInput.length; i++) {
    final String letter = userInput[i];
    if (allNumbers.contains(letter)) {
      hasNumber = true;
    }
  }
  if (!hasNumber) {
    return 'Password must have at least 1 number';
  }

  if (userInput.contains(passwordStringLowerCase)) {
    return '"password" is not a password';
  }
  if (userInput.contains(passwordStringUpperCase)) {
    return '"Password" is not a password';
  }

  return null;
}
