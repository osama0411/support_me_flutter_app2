import 'package:flutter_test/flutter_test.dart';

//import 'package:grad_project/controller/SigninScreen.dart';
bool isValidEmail(String email) {
  // Replace with a more robust email validation regex
  // This is a simplified example for demonstration purposes
  return email.isNotEmpty && email.contains('@');
}


String passwordRegex = r"(?=^.{8,}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)";
bool isValidPassword(String password) {
  RegExp regex = RegExp(passwordRegex);
  return regex.hasMatch(password);
}


String firstNameRegex = r"^[a-zA-Z]+(?: [a-zA-Z]+)*$"; // Allows one or more words with spaces
String lastNameRegex = r"^[a-zA-Z]+(?: [a-zA-Z]+|-|'.)*$"; // Allows spaces, hyphens, and apostrophes
bool isValidFirstName(String firstName) {
  // Consider using a more robust validation logic, e.g., minimum length
  // You can choose between using a regular expression or a simpler check
  // return firstName.isNotEmpty && firstName.length >= 2; // Minimum 2 characters
  return RegExp(firstNameRegex).hasMatch(firstName); // Using regular expression
}

bool isValidLastName(String lastName) {
  // Similar logic as for first name
  // return lastName.isNotEmpty && lastName.length >= 2;
  return RegExp(lastNameRegex).hasMatch(lastName);
}

bool isValidTargetPrice(double targetPrice) {
  return targetPrice >= 0.0 && targetPrice <= 50000.0; // Minimum 0, maximum 50000
}
String bankname = r"^[a-zA-Z]+(?: [a-zA-Z]+|-|'.)*$";
bool isValidBankAccountName(String name) {
  // Replace with your desired validation logic
  // This example checks for non-empty name and allows basic alphanumeric characters, spaces, hyphens, and periods
  RegExp nameRegex = RegExp(bankname);
  return name.isNotEmpty && nameRegex.hasMatch(name);
}

// Function to check if the length is within the specified range
bool isValidLength(String number, int minLength, int maxLength) {
  return number.length >= minLength && number.length <= maxLength;
}


String numeric = r'^[0-9]+(-[0-9]+)*$';
// Function to check if the string contains only digits
bool isNumeric(String number) {
  return RegExp(numeric).hasMatch(number);
}

bool isValidBankAccountNumber(String number, int minLength, int maxLength) {
  // Replace with your desired validation logic (e.g., specific format checks)
  return isValidLength(number, minLength, maxLength) && isNumeric(number);
}





void main() {

// ValidEmail Test cases
  test('isValidEmail returns true for valid email formats', () {
    expect(isValidEmail('osama@email.com'), true);

  });
  test('isValidEmail returns true for valid email formats', () {

    expect(isValidEmail('osama@namedomain.co.uk'), true);

  });
  test('isValidEmail returns true for valid email formats', () {

    expect(isValidEmail('osama123@gmail.com'), true);
  });




// InValidEmail Test cases
  test('isValidEmail returns false for invalid email formats', () {
    expect(isValidEmail('moemen.com'), false);

  });
  test('isValidEmail returns false for invalid email formats', () {

    expect(isValidEmail(''), false);

  });
  test('isValidEmail returns false for invalid email formats', () {

    expect(isValidEmail('12345'), false);
  });





  //ValidPassword test cases
  test('isValidPassword returns true for strong passwords', () {
    expect(isValidPassword('OsamaAndMO123!'), true);

  });
  test('isValidPassword returns true for strong passwords', () {

    expect(isValidPassword('Momen@Osama1212'), true);
  });




//InValidPassword test cases
  test('isValidPassword returns false', () {
    expect(isValidPassword(''), false); // Empty password

  });
  test('isValidPassword returns false', () {

    expect(isValidPassword('osama'), false); // Less than minimum length

  });
  test('isValidPassword returns false', () {

    expect(isValidPassword('12345678'), false); // Only numbers

  });
  test('isValidPassword returns false', () {

    expect(isValidPassword('momen123'), false); // No special characters

  });
  test('isValidPassword returns false', () {

    expect(isValidPassword('osamamomen'), false); // No numbers or special characters
  });











//Validfirst & last name test cases
  test('isValidFirstName returns true for valid names', () {
    expect(isValidFirstName('osama'), true);

  });
  test('isValidFirstName returns true for valid names', () {

    expect(isValidFirstName('momen osama'), true);

  });
  test('isValidFirstName returns true for valid names', () {

    expect(isValidFirstName('O''osama'), true); // Allow apostrophe
  });






//InValidfirst & last name test cases
  test('isValidFirstName returns false for invalid names', () {
    expect(isValidFirstName(''), false);

  });
  test('isValidFirstName returns false for invalid names', () {

    expect(isValidFirstName('123'), false); // Only numbers

  });
  test('isValidFirstName returns false for invalid names', () {

    expect(isValidFirstName('osama@mm'), false); // Special characters not allowed
  });







  //ValidTarget price test cases
  test('isValidTargetPrice returns true for valid target prices', () {
    expect(isValidTargetPrice(0.0), true);  // Include 0 as valid

  });
  test('isValidTargetPrice returns true for valid target prices', () {

    expect(isValidTargetPrice(10.50), true);

  });
  test('isValidTargetPrice returns true for valid target prices', () {

    expect(isValidTargetPrice(50000.0), true); // Include 50000 as valid
  });






//InValidTarget price test cases
  test('isValidTargetPrice returns false for invalid target prices', () {
    expect(isValidTargetPrice(-10.0), false); // Negative value

  });
  test('isValidTargetPrice returns false for invalid target prices', () {

    expect(isValidTargetPrice(double.nan), false); // Not a number (NaN)

  });
  test('isValidTargetPrice returns false for invalid target prices', () {

    expect(isValidTargetPrice(50000.01), false); // Exceeds maximum
  });










  //ValidBank name tests cases
  test('isValidBankAccountName returns true for valid names', () {
    expect(isValidBankAccountName('Osama Nasser'), true);


  });
  test('isValidBankAccountName returns true for valid names', () {

    expect(isValidBankAccountName('Mo''men'), true); // Allow apostrophe

  });




//InValidBank name tests cases
  test('isValidBankAccountName returns false for invalid names', () {
    expect(isValidBankAccountName(''), false); // Empty name

  });
  test('isValidBankAccountName returns false for invalid names', () {

    expect(isValidBankAccountName('123456'), false); // Only numbers

  });
  test('isValidBankAccountName returns false for invalid names', () {

    expect(isValidBankAccountName('osama@Doe'), false); // Special characters not allowed (adjust regex if needed)
  });






  //ValidBank number tests cases
  test('isValidBankAccountNumber returns true for valid account numbers', () {
    expect(isValidBankAccountNumber('1234567890', 10, 10), true); // Example: 10 digits

  });
  test('isValidBankAccountNumber returns true for valid account numbers', () {

    expect(isValidBankAccountNumber('123-456-7890', 12, 12), true); // Example: with hyphens
  });




  //InValidBank number tests cases
  test('isValidBankAccountNumber returns false for invalid account numbers', () {
    expect(isValidBankAccountNumber('', 10, 10), false); // Empty string

  });
  test('isValidBankAccountNumber returns false for invalid account numbers', () {

    expect(isValidBankAccountNumber('ABC123', 10, 10), false); // Contains letters

  });
  test('isValidBankAccountNumber returns false for invalid account numbers', () {

    expect(isValidBankAccountNumber('12345678901', 10, 10), false); // Exceeds maximum length

  });
  test('isValidBankAccountNumber returns false for invalid account numbers', () {

    expect(isValidBankAccountNumber('123456789', 10, 10), false); // Below minimum length
  });

}