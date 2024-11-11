import 'package:iso5817_2014/util/gradingStruct.dart';

//CHECK REMARKS VED ALLE
//Gå igennem alle formler, og sørg for at alle er der OG ingen mangler
/*I needed a way to recognize when one result start, and one ends, realistically the performance doesn't matter too much*/
Gradingstruct CGrading(double s, double a, double t, double b, bool isFilletWeld) {
    Gradingstruct grade = Gradingstruct(CCrack(t), CCraterCrack(t), CSurfacePore(s, t), CEndCraterPipe(t),
        CLackOfFusion(), CMicroLackOfFusion(), CIncompleteRootPenetration(),
        CIntermittenUndercut(t), CShrinkageGroove(t), CExcessWeldMetal(b, t), CExcessiveConvexity(b, t), 
        CExcessPenetration(b, t), CIncorrectWeldToe(isFilletWeld), COverlap(), CNonFilledWeld(t),
        CBurnThrough(), CExcessiveAsymmetryFilletWeld(a, t), CRootConcavity(t), CRootPorosity(t),
        CPoorStart(t), CInsufficientThroatThickness(a, t), CExcessiveThroatThickness(a, t), CStrayArc(),
       CSpatter(t), CTempercolour(t), CLinearMisalignment(t), CIncorrectRootGapOrFilletWelds(a, t));
       
    return grade;
}

/// Get Crack grade
/// Revne/Crack
/// @param {number} t Wall or plate thickness
/// @returns {string} Viable grade 
String? CCrack(double t) {
    if (t >= 0.5) {
        return "Not permitted/Ikke tilladt";
    }
}

/// Get Crater Crack grade
/// Kraterrevne/Crater crack
/// @param {number} t Wall or plate thickness
/// @returns {string} Viable grade 
String? CCraterCrack(double t) {
    if (t >= 0.5) {
        return "Not permitted/Ikke tilladt";
    }
}

/// Calculate Surface Pore
/// Overfladepore/Surface pore
/// @param {number} s weld thickness 
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CSurfacePore(double s, double t) {
    if (t >= 0.5) {
        return "t Not permitted/Ikke tilladt";
    }
    return "d <= ${0.2 * s} (max 2 mm)";
}

/// Calculate End crater pipe 
/// Åben kraterpore/End crater pipe
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CEndCraterPipe(double t) {
    if (t > 3) {
        return "h <= ${0.1 * t} (max 1 mm)";
    }
    return "t Not permitted/Ikke tilladt";
}
 
/// Bindingsfejl /* lack of fusion
/// @returns {string} First viable grade 
String? CLackOfFusion() {
    return "Not permitted/Ikke tilladt";
}
 
/// MikroBindingsfejl /*Micro lack of fusion
/// @returns {string} First viable grade 
String? CMicroLackOfFusion() {
    return "Not permitted/Ikke tilladt";
    //Mikrobindingsfejl kun detekterbare ved mikroundersøglse / Only detected by micro examination
}

/// Calculate Incomplete root penetration 
/// Rodfejl/Incomplete root penetration
/// @returns {string} First viable grade 
String? CIncompleteRootPenetration() {
    return "Not permitted/Ikke tilladt";
}

/// Calculate Intermittent undercut
/// (Kontinueret) Lokal sidekærv / (Continuos) Intermittent undercut
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CIntermittenUndercut(double t) {
    if (t > 3) {
        return "h <= ${0.1 * t} (max 0.5mm)";
    }
    if (t >= 0.5 && t <= 3) {
        return "h <= ${0.1 * t} (max 0.5mm)*";
    }
    return "t out of range!";
}

/// Calculate Shrinkage Groove
/// Rodkærv/Shrinkage groove
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CShrinkageGroove(double t) {
    if (t > 3) {
        return "h <= ${0.1 * t} (max 1 mm)";
    }
    if (t >= 0.5 && t <= 3) {
        return "h <= ${0.1 * t} (max 1 mm)";
    }
    return "h <= ${0.1 * t}*";
}

/// Calculate Excess weld metal
/// Overvulst/Excess weld metal
/// @param {number} b Width of weld reinforcement
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CExcessWeldMetal(double b, double t) {
    if (t >= 0.5) {
        return "h <= ${1.0 + 0.15 * b} (max 7 mm)";
    }
}

/// Calculate Excessive Convexity
/// Konveks sømoverflade/Excessive convexity
/// @param {number} b Width of weld reinforcement
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CExcessiveConvexity(double b, double t) {
    if (t >= 0.5) {
        return "h <= ${1.0 + 0.15 * b} (max 4 mm)";
    }
}

/// Calculate Excess penetration
/// Rodvulst/Excess penetration
/// @param {number} b Width of weld reinforcement
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CExcessPenetration(double b, double t) {
    if (t > 3) {
        return "h <= ${1.0 + 0.6 * b} (max 4 mm)";
    }
    if (t >= 0.5 && t <= 3) {
        return "h <= ${1.0 + 0.3 * b}";
    }
}

/// Gets the acceptable angle for the weld toe
/// Forkert overgang / Incorrect Weld toe
/// @param {boolean} isFilletWeld If it is a fillet weld or not
/// @returns {string} Acceptable angle (For D, alpha is the same for fillet and butt welds) 
String? CIncorrectWeldToe(bool isFilletWeld) {
    if (isFilletWeld) {
        return "α => 100°";
    }
    return "α => 110°";
}

/// Calculate Overlap
/// Overløbning/Overlap
/// @returns {string} First viable grade 
String? COverlap() {
    return "Not permitted/Ikke tilladt";
}

/// Calculate Non filled weld
/// Mangelfuld Opfyldning / Non filled weld
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CNonFilledWeld(double t) {
    if (t > 3) {
        return "h <= ${0.1 * t} (max 1 mm)";
    }
    if (t >= 0.5 && t <= 3) {
        return "*h <= ${0.1 * t}*";
    }
}

///Gennembrænding/Burn through
String? CBurnThrough() {
    return "Not permitted/Ikke tilladt";
}

/// Calculate Excessive asymmetry of fillet weld
/// Ulige store ben/Excessive asymmetry of fillet weld
/// @param {number} a Nominal throat thickness of the fillet weld
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CExcessiveAsymmetryFilletWeld(double a, double t) {
    if (t >= 0.5) {
        return "h <= ${2 + 0.15 * a}";
    }
}

/// Calculate Root concavity
/// Indadvælving i roden / Root concavity
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CRootConcavity(double t) {
    if (t > 3) {
        return "h <= ${0.1 * t} (max 1mm)*";
    }
    if (t >= 0.5 && t <= 3) {
        return "h <= ${0.1 * t}*";
    }
}

/// Calculate Root porosity
/// Porøsitet i rodvulst/Root porosity
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CRootPorosity(double t) {
    if (t <= 0.5) {
        return "Not permitted/Ikke tilladt";
    }
    return "t is outside of the acceptable range";
}

/// Calculate Poor start
/// Fejl ved genstart/Poor start
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CPoorStart(double t) {
    if (t <= 0.5) {
        return "Not permitted/Ikke tilladt";
    }
    return "t is outside of the acceptable range";
}

/// Calculate Insufficient throat thickness
/// Utilstrækkeligt A-mål / Insufficient throat thickness
/// @param {number} a Nominal throat thickness of the fillet weld
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CInsufficientThroatThickness(double a, double t) {
    if (t > 3) {
        return "h <= ${0.3 + 0.1 * a} (max 1mm)*";
    }
    if (t <= 0.5 && t > 3) {
        return "h <= 0.2mm*";
    }
}

/// Calculate Excessive Throat Thickness
/// For stort a-mål / Excessive throat thickness
/// @param {number} a Nominal throat thickness of the fillet weld
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CExcessiveThroatThickness(double a, double t) {
    if (t <= 0.5) {
        return "h <= ${1 + 0.2 * a} (max 4 mm)";
    }
}

/// Calculate Stray arc
/// Tændsår / Stray arc
/// @returns {string} First viable grade 
String? CStrayArc() {
    return "Not permitted/Ikke tilladt";
}

/// Calculate Spatter
/// Svejsesprøjt / Spatter
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CSpatter(double t) {
    if (t <= 0.5) {
        return "Accept afhænger af anvendelse, fx materiale, korrosionsbeskyttelse/Acceptance depends on application, e.g. material, corrosion protection";
    }
}

/// Calculate Tempercolour
/// Anløbsfarve / Tempercolour
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CTempercolour(double t) {
    if (t <= 0.5) {
        return "Accept afhænger af anvendelse, fx materiale, korrosionsbeskyttelse/Acceptance depends on application, e.g. material, corrosion protection";
    }
    return "t is in an unacceptable range! (t is greater than 0.5)";
}

/// Calculate Linear misalignment
/// Forsætning / Linear misalignment
/// @param {number} t Wall or plate thickness (nominal size)
/// @returns {string} First viable grade 
String? CLinearMisalignment(double t) {
    if (t > 3) {
        return "h <= ${0.15 * t} (max 4 mm)";
    }
    if (t <= 0.5) {//THIS ONE IS SOMETHING ELSE
        return "h <= ${0.5 * t} (max 3 mm)";
    }
    if (t <= 0.5 && t > 3) {
        return "h <= ${0.2 + 0.15 * t}";
    }

}

/// Calculate Incorrect root gap or fillet welds.
/// Dårlig tilpasning af rodspalten for kantsømme. / Incorrect root gap or fillet welds.
/// @param {number} a Nominal throat thickness of the fillet weld
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String? CIncorrectRootGapOrFilletWelds(double a, double t) {
    if (t > 3) {
        return "h <= ${0.5 + 0.2 * a} (max 3 mm)";
    }
    if (t <= 0.5 && t > 3) {
        return "h <= ${0.3 + 0.1 * a}";
    }
}