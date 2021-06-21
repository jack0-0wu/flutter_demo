// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_demo/page/demo/test_demo/favorites.dart';
// import 'package:flutter_demo/page/demo/test_demo/test_home.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:provider/provider.dart';
//
// /// @author wu chao
// /// @project flutter_demo
// /// @date 2021/6/21
// Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
//   create: (context) => Favorites(),
//   child: MaterialApp(
//     home: HomePage(),
//   ),
// );
//
// void main() {
//   group('Home Page Widget Tests', () {
//     testWidgets('Testing Scrolling', (tester) async {
//       await tester.pumpWidget(createHomeScreen());
//       expect(find.text('Item 0'), findsOneWidget);
//       await tester.fling(find.byType(ListView), Offset(0, -200), 3000);
//       await tester.pumpAndSettle();
//       expect(find.text('Item 0'), findsNothing);
//     });
//   });
//   group('Home Page Widget Tests', () {
//
//     // BEGINNING OF NEW CONTENT
//     testWidgets('Testing if ListView shows up', (tester) async {
//       await tester.pumpWidget(createHomeScreen());
//       expect(find.byType(ListView), findsOneWidget);
//     });
//     // END OF NEW CONTENT
//
//     testWidgets('Testing Scrolling', (tester) async {
//       await tester.pumpWidget(createHomeScreen());
//       expect(find.text('Item 0'), findsOneWidget);
//       await tester.fling(find.byType(ListView), Offset(0, -200), 3000);
//       await tester.pumpAndSettle();
//       expect(find.text('Item 0'), findsNothing);
//     });
//
//     testWidgets('Testing IconButtons', (tester) async {
//       await tester.pumpWidget(createHomeScreen());
//       expect(find.byIcon(Icons.favorite), findsNothing);
//       await tester.tap(find.byIcon(Icons.favorite_border).first);
//       await tester.pumpAndSettle(Duration(seconds: 1));
//       expect(find.text('Added to favorites.'), findsOneWidget);
//       expect(find.byIcon(Icons.favorite), findsWidgets);
//       await tester.tap(find.byIcon(Icons.favorite).first);
//       await tester.pumpAndSettle(Duration(seconds: 1));
//       expect(find.text('Removed from favorites.'), findsOneWidget);
//       expect(find.byIcon(Icons.favorite), findsNothing);
//     });
//   });
// }