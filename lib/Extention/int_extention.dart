import '/YZScreenSizeFit.dart';

extension IntFit on int {
  double px() {
    return YZScreenSizefit.setPx(this.toDouble());
  }

  // 使用get方法。用的时候，不需要写()
  double get getPx {
    return YZScreenSizefit.setPx(this.toDouble());
  }
}