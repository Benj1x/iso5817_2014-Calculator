//CHECK REMARKS VED ALLE
//Gå igennem alle formler, og sørg for at alle er der OG ingen mangler
/*I needed a way to recognize when one result start, and one ends, realistically the performance doesn't matter too much*/
import 'package:iso5817_2014/util/gradingStruct.dart';
class gradingB{
//**dawad */
Gradingstruct BGrading(double s, double a, double t, double b, bool isFilletWeld) {
    Gradingstruct grade = Gradingstruct(BCrack(t), BCraterCrack(t), BSurfacePore(), BEndCraterPipe(), BLackOfFusion(), BMicroLackOfFusion(), BIncompleteRootPenetration(),
        BIntermittenUndercut(t), BShrinkageGroove(t), BExcessWeldMetal(b), BExcessiveConvexity(b), 
        BExcessPenetration(b, t), BIncorrectWeldToe(isFilletWeld), BOverlap(), BNonFilledWeld(t),
        BBurnThrough(), BExcessiveAsymmetryFilletWeld(t, a), BRootConcavity(t), BRootPorosity(),
        BPoorStart(), BInsufficientThroatThickness(), BExcessiveThroatThickness(a, t), BStrayArc(),
        BSpatter(t), BTemperColour(t), BLinearMisalignment(t), BIncorrectRootGapOrFilletWelds(a, t));
    return grade;
}

/// Get Crack grade
/// Revne/Crack
/// @param {number} t Wall or plate thickness
/// @returns {String} Viable grade 
String? BCrack(double t) {
    if (t >= 0.5) {
        return "Not permitted / Ikke tilladt";
    }
    return "Out of range";
}

/// Get Crater Crack grade
/// Kraterrevne/Crater crack
/// @param {number} td Wall or plate thickness
/// @returns {String} Viable grade 
String? BCraterCrack(double t) {
    if (t >= 0.5) {
        return "Not permitted / Ikke tilladt";
    }
    return "Out of range";
}

/// Calculate Surface Pore
/// Overfladepore/Surface pore
/// @returns {String} First viable grade 
String? BSurfacePore() {
    return "Not allowed / Ikke tilladt";
}

/// Calculate End crater pipe 
/// Åben kraterpore/End crater pipe
/// @returns {String} First viable grade 
String? BEndCraterPipe() {
    return "Not allowed / Ikke tilladt";
}

/// Bindingsfejl /* lack of fusion
/// @returns {String} First viable grade 
String? BLackOfFusion() {
    return "Not permitted / Ikke tilladt";
}

/// MikroBindingsfejl /*Micro lack of fusion
/// @returns {string} First viable grade 
String? BMicroLackOfFusion() {
    return "Not permitted / Ikke tilladt";
    //Mikrobindingsfejl kun detekterbare ved mikroundersøglse / Only detected by micro examination
}
/// Calculate Incomplete root penetration 
/// Rodfejl/Incomplete root penetration
/// @returns {string} First viable grade 
String? BIncompleteRootPenetration() {
    return "Not Allowed / Ikke Tilladt";
}
 
/// Calculate Intermittent undercut
/// (Kontinueret) Lokal sidekærv / (Continuos) Intermittent undercut
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? BIntermittenUndercut(double t) {
    if (t > 3) {
        return "h <= ${(0.05 * t).toStringAsFixed(1)} (max 0,5mm)";
    }
    return "t out of range!";
}
 
/// Calculate Shrinkage Groove
/// Rodkærv/Shrinkage groove
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? BShrinkageGroove(double t) {
    if (t > 3) {
        return "h <= ${(0.05 * t).toStringAsFixed(1)} (max 0,5mm)";
    }

    return "Not allowed/Ikke tilladt";
}

/// MikroBindingsfejl /*Micro lack of fusion
/// @returns {String} First viable grade 
String? BExcessWeldMetal(double b) {
    //For a B
    return "h <= ${(1.0 + 0.1 * b).toStringAsFixed(1)} (max 5mm)";
}

/// Calculate Excessive Convexity
/// Konveks sømoverflade/Excessive convexity
/// @param {number} b Width of weld reinforcement
/// @returns {String} First viable grade 
String? BExcessiveConvexity(double b) {
    //For a B
    return "h <= ${(1.0 + 0.1 * b).toStringAsFixed(1)} (max 3 mm)*";
}

/// Calculate Excess penetration
/// Rodvulst/Excess penetration
/// @param {number} b Width of weld reinforcement
/// @param {number} t Wall or plate thickness
/// @returns {String} First viable grade 
String? BExcessPenetration(double b, double t) {
    if (t > 3) {
        return "h <= ${(1 + 0.2 * b).toStringAsFixed(1)} (max 3 mm)*";
    }
    if (t >= 0.5 && t <= 3) {
        return "h <= ${(1 + 0.1 * b).toStringAsFixed(1)}";
    }
    return "Out of range";
}

/// Gets the acceptable angle for the weld toe
/// Forkert overgang / Incorrect Weld toe
/// @param {boolean} isFilletWeld If it is a fillet weld or not
/// @returns {String} Acceptable angle (For D, alpha is the same for fillet and butt welds) 
String? BIncorrectWeldToe(bool isFilletWeld) {
    if (isFilletWeld) {
        return "α => 110°";
    }
    return "α => 150°";

}

/// Calculate Overlap
/// Overløbning/Overlap
/// @returns {String} First viable grade 
String? BOverlap() {
    return "Not allowed / Ikke tilladt";
}

/// Calculate Non filled weld
/// Mangelfuld Opfyldning / Non filled weld
/// @param {number} t Wall or plate thickness
/// @returns {String} First viable grade 
String? BNonFilledWeld(double t) {
    if (t > 3) {
        return "h <= ${(0.05 * t).toStringAsFixed(1)} (max 0,5 mm)";
    }
    return "Not permitted / Ikke tilladt";
}

///Gennembrænding/Burn through
String? BBurnThrough() {
    return "Not permitted / Ikke tilladt";
}

/// Calculate Excessive asymmetry of fillet weld
/// Ulige store ben/Excessive asymmetry of fillet weld
/// @param {number} t Height or width of imperfection
/// @param {number} a Nominal throat thickness of the fillet weld
/// @returns {String} First viable grade 
String? BExcessiveAsymmetryFilletWeld(double t, double a) {
    if (t >= 0.5) {
        return "h <= ${(1.5 + 0.15 * a).toStringAsFixed(1)}";
    }
    return "Out of range";
}

/// Calculate Root concavity
/// Indadvælving i roden / Root concavity
/// @param {number} t Wall or plate thickness
/// @returns {String} First viable grade 
String? BRootConcavity(double t) {
    if (t > 3) {
        return "h <= ${(0.05 * t).toStringAsFixed(1)} (max 0,5mm)*";
    }
    return "Not allowed / Ikke tilladt";
}

/// Calculate Root porosity
/// Porøsitet i rodvulst/Root porosity
/// @returns {String} First viable grade 
String? BRootPorosity() {
    return "Not allowed / Ikke tilladt";
}

/// Calculate Poor start
/// Fejl ved genstart/Poor start
/// @returns {String} First viable grade 
String? BPoorStart() {
    return "Not allowed / Ikke tilladt";
}

/// Calculate Insufficient throat thickness
/// Utilstrækkeligt A-mål / Insufficient throat thickness
/// @returns {String} First viable grade 
String? BInsufficientThroatThickness() {
    return "Not allowed / Ikke tilladt";
}

/// Calculate Excessive Throat Thickness
/// For stort a-mål / Excessive throat thickness
/// @param {number} a Nominal throat thickness of the fillet weld
/// @param {number} t Wall or plate thickness
/// @returns {String} First viable grade 
String? BExcessiveThroatThickness(double t, double a) {
    if (t <= 0.5) {
        return "h <= ${(1.0 + 0.15 * a)} (max 3 mm)";
    }
    return "t is in an unacceptable range! (t is greater than 0.5)";
}

/// Calculate Stray arc
/// Tændsår / Stray arc
/// @returns {String} First viable grade 
String? BStrayArc() {
    return "Not allowed / Ikke tilladt";
}

/// Calculate Spatter
/// Svejsesprøjt / Spatter
/// @param {number} t Wall or plate thickness
/// @returns {String} First viable grade 
String? BSpatter(double t) {
    if (t <= 0.5) {
        return "Accept afhænger af anvendelse, fx materiale, korrosionsbeskyttelse / Acceptance depends on application, e.g. material, corrosion protection";
    }
    return "t is in an unacceptable range! (t is greater than 0.5)";

}

/// Calculate Tempercolour
/// Anløbsfarve / Tempercolour
/// @param {number} t Wall or plate thickness
/// @returns {String} First viable grade 
String? BTemperColour(double t) {
    if (t <= 0.5) {
        return "Accept afhænger af anvendelse, fx materiale, korrosionsbeskyttelse / Acceptance depends on application, e.g. material, corrosion protection";
    }
    return "t is in an unacceptable range! (t is greater than 0.5)";
}

/// Calculate Linear misalignment
/// Forsætning / Linear misalignment
/// @param {number} t Wall or plate thickness (nominal size)
/// @returns {String} First viable grade 
String? BLinearMisalignment(double t) {
    if (t > 3) {
        return "h <= ${(0.1 * t).toStringAsFixed(1)} (max 3 mm)";
    }
    if (t <= 0.5) {//THIS ONE IS SOMETHING ELSE
        return "h <= ${(0.5 * t).toStringAsFixed(1)} (max 2 mm)";
    }
    if (t <= 0.5 && t > 3) {
        return "h <= ${(0.2 + 0.1 * t).toStringAsFixed(1)}";
    }

    return "Out of range";

}

/// Calculate Incorrect root gap or fillet welds.
/// Dårlig tilpasning af rodspalten for kantsømme. / Incorrect root gap or fillet welds.
/// @param {number} a Nominal throat thickness of the fillet weld
/// @param {number} t Wall or plate thickness
/// @returns {String} First viable grade 
String? BIncorrectRootGapOrFilletWelds(double t, double a) {
    if (t > 3) {
        return "h <= ${(0.5 + 0.1 * a).toStringAsFixed(1)} (max 2 mm)";
    }
    if (t <= 0.5 && t > 3) {
        return "h <= ${(0.2 + 0.1 * a).toStringAsFixed(1)}";
    }

    return "Out of range";
}


}