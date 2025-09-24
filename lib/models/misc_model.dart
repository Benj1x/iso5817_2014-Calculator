import 'dart:math';

class MiscModel {
  double a;
  double z;

  MiscModel({this.a = 0, this.z = 0});

  // Mutating “calculations”
  // a -> z  (z = sqrt(2 * a))
  void calculateAToZ() {
    z = sqrt(2 * a);
  }

  // z -> a  (a = z * sin(45°))
  void calculateZToA() {
    final rads = 45 * (pi / 180); // π/4
    a = sin(rads) * z;            // ≈ 0.7071 * z
  }
}
