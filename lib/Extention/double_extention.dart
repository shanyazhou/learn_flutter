import '/YZScreenSizeFit.dart';

extension DoubleFit on double {
  double px() {
    return YZScreenSizefit.setPx(this);
  }

  // 使用get方法。用的时候，不需要写()
  double get getPx {
    return YZScreenSizefit.setPx(this);
  }
}