import 'package:assignment/Screen/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("String should be encrypted", (WidgetTester tester) async{
    await tester.pumpWidget(HomeView());
    var textField=find.byType(TextField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, "hello");
    expect(find.text("hello"), findsOneWidget);
    var button=find.text("Encryption");
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pump();
    expect(find.text("EncryptText : MP22VhPM35WlJ0mTSdtitA=="), findsOneWidget);

  });
}