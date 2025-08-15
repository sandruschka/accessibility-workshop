import 'dart:ui';

enum TestingDevice {
  // Android
  pixel3a(Size(393, 808), 2.75),
  pixel4XL(Size(412, 869), 3.5),

  // iOS
  iPhone3rdGen(Size(375, 667), 2),
  iPadPro(Size(834.0, 1194.0), 3),
  ;

  final Size size;
  final double pixelRatio;

  const TestingDevice(this.size, this.pixelRatio);
}
