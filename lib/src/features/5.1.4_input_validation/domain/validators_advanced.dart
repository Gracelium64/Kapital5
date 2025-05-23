String abc = 'abcdefghijklmnopqrstuvwxyz';
String abcUpperCase = abc.toUpperCase();
String abcLowerUpperCase = abc + abcUpperCase;
String umlauts = 'ßöäüÖÄÜ';
String emailAt = '@';
String emailPoint = '.';
String passwordStringUpperCase = 'Password';
String passwordStringLowerCase = 'password';
String allNumbers = '0123456789';

bool isUserLengthMin = false;
bool isUserLengthMax = false;
bool isUserSpace = false;
bool isUserCharacter = false;
bool isUserEnglish = false;
bool isPasswordLengthMin = false;
bool isPasswordLengthMax = false;
bool isPasswordSpace = false;
bool isPasswordUpperCase = false;
bool isPasswordLowerCase = false;
bool isPasswordNumber = false;
bool isPasswordStupid1 = false;
bool isPasswordStupid2 = false;
bool isEmailLengthMin = false;
bool isEmailSpace = false;
bool isEmailAt = false;
bool isEmailPoint = false;
bool isEmailStart = false;

bool? getUserNameValidation(String? userInput) {
  if (userInput == null || userInput.length < 3) {
    return isUserLengthMin = true;
  }
  if (userInput.length >= 21) {
    return isUserLengthMax = true;
  }
  if (userInput.contains(' ')) {
    return isUserSpace = true;
  }
  if (!abcLowerUpperCase.contains(userInput[0])) {
    return isUserCharacter = true;
  }
  for (int i = 0; i < userInput.length; i++) {
    final String letter = userInput[i];
    if (umlauts.contains(letter)) {
      return isUserEnglish = true;
    }
  }
  return null;
}

bool? getUserEmailValitation(String? userInput) {
  if (userInput == null || userInput.length < 6) {
    // return 'An E-Mail must have at least 6 characters';
    return isEmailLengthMin = true;
  }
  if (userInput.contains(' ')) {
    // return 'Empty spaces are not allowed in the password';
    return isEmailSpace = true;
  }
  for (int i = 0; i < userInput.length; i++) {
    if (!userInput.contains(emailAt)) {
      // return 'Not a valid E-Mail address';
      return isEmailAt = true;
    }
  }
  for (int i = 0; i < userInput.length; i++) {
    if (!userInput.contains(emailPoint)) {
      // return 'Not a valid E-Mail address';
      return isEmailPoint = true;
    }
  }
  if (userInput[0] == '@') {
    // return 'Not a valid E-Mail Address';
    return isEmailStart = true;
  }
  return null;
}

bool? getUserPasswordValidation(String? userInput) {
  bool hasNumber = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;

  if (userInput == null || userInput.length < 8) {
    // return 'Password must have at least 8 characters';
    return isPasswordLengthMin = true;
  }
  if (userInput.length >= 66) {
    // return 'Password can only be 66 characters long';
    return isPasswordLengthMax = true;
  }
  if (userInput.contains(' ')) {
    // return 'Empty spaces are not allowed in the password';
    return isPasswordSpace = true;
  }

  for (int i = 0; i < userInput.length; i++) {
    final String letter = userInput[i];
    if (abcUpperCase.contains(letter)) {
      hasUpperCase = true;
    }
  }
  if (!hasUpperCase) {
    // return 'Password must have at least 1 uppercase letter';
    return isPasswordUpperCase = true;
  }

  for (int i = 0; i < userInput.length; i++) {
    final String letter = userInput[i];
    if (abc.contains(letter)) {
      hasLowerCase = true;
    }
  }
  if (!hasLowerCase) {
    // return 'Password must have at least 1 lowercase letter';
    return isPasswordLowerCase = true;
  }

  for (int i = 0; i < userInput.length; i++) {
    final String letter = userInput[i];
    if (allNumbers.contains(letter)) {
      hasNumber = true;
    }
  }
  if (!hasNumber) {
    // return 'Password must have at least 1 number';
    return isPasswordNumber = true;
  }

  if (userInput.contains(passwordStringLowerCase)) {
    // return '"password" is not a password';
    return isPasswordStupid1 = true;
  }
  if (userInput.contains(passwordStringUpperCase)) {
    // return '"Password" is not a password';
    return isPasswordStupid2 = true;
  }

  return null;
}
