import 'adaptive_size_util.dart';

extension getSize on num {
  num get s => SizeAdaptiveUtil().size(this);
  num get sp => SizeAdaptiveUtil().fontSize(this);
}
