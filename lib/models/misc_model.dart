class MiscModel
{
  final double _a = 0.0;
  final double _z = 0.0;

  double get a => _a;
  double get z => _z;

  String CalculateZToA(){
    //z = document.getElementById("ZValue").value;
    return cos45*z as String;
  }


String CalculateAToZ(double a){
    //a = document.getElementById("AValue").value;
    return sqrt(2*a) as String;
  }

}
