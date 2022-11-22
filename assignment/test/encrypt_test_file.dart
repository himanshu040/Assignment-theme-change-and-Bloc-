import 'package:assignment/EncryptionHandel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("String should be encrypted", () {
    String intial = "Hello";
    String encrypted = EncryptData.encryptAES(intial);
  //  String decrypt = EncryptData.decryptAES("G2eec8weKLvvzllCtH36Jw==");
    expect(encrypted, "G2eec8weKLvvzllCtH36Jw==");
  //  expect(decrypt, "Hello");
  });
}
