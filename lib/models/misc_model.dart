
class MiscModel
{
  double _plateThickness = 0.0;
  double _weldTThickness = 0.0;
  double _weldWidth = 0.0;

  bool gradeB = false;
  bool gradeC = false;
  bool gradeD = false;

  double get plateThickness => _plateThickness;
  double get weldTThickness => _weldTThickness;
  double get weldWidth => _weldWidth;
  double setCounter() {
    return _weldTThickness;
  }
}
