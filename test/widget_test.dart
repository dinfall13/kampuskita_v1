import 'package:flutter_test/flutter_test.dart';
import 'package:kampuskita_v1/main.dart';

void main() {
  testWidgets('Uji tampilan awal KampusKita', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('KampusKita'), findsOneWidget);
    expect(find.text('Selamat Datang di KampusKita'), findsOneWidget);
  });
}