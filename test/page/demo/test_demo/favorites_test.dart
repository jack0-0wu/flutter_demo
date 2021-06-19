import 'package:flutter_demo/page/demo/test_demo/favorites.dart';
import 'package:flutter_test/flutter_test.dart';

/// @author wu chao
/// @project flutter_demo
/// @date 2021/6/19
//test 目录下的目录结构与 lib 目录下的一致 Dart 文件的名称相同，但以 _test 结尾
void main() {
  group('App Provider Tests', () {
    var favorites = Favorites();

    test('A new item should be added', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });
    test('An item should be removed', () {
      var number = 45;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}
