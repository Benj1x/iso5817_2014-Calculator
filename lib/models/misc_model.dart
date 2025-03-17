import 'dart:math';
class MiscModel
{
  final double _a = 0.0;
  final double _z = 0.0;
  final double _ZToA = 0.0;
  final double _AToZ = 0.0;

  double get a => _a;
  double get z => _z;
  double get ZToA => _ZToA;
  double get AToZ => _ZToA;

  void CalculateZToA(){
    double deg = 45;
    double rads = deg * (pi/180);

    _ZToA = rads*z as String;
  }


  void CalculateAToZ(){
    _AToZ = sqrt(2*a) as String;
  }

}
