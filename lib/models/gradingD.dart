import 'package:iso5817_2014/util/gradingStruct.dart';

//CHECK REMARKS VED ALLE
//Gå igennem alle formler, og sørg for at alle er der OG ingen mangler
/*I needed a way to recognize when one result start, and one ends, realistically the performance doesn't matter too much*/
Gradingstruct DGrading(s, a, t,  b,  isFilletWeld) {
    Gradingstruct grade = Gradingstruct(DCrack(t), DCraterCrack(t), DSurfacePore(s, t), DEndCraterPipe(t),
        DLackOfFusion(), DMicroLackOfFusion(), DIncompleteRootPenetration(t),
        DIntermittenUndercut(t), DShrinkageGroove(t), DExcessWeldMetal(b), DExcessiveConvexity(b), 
        DExcessPenetration(b, t), DIncorrectWeldToe(), DOverlap(b), DNonFilledWeld(t),
        DBurnThrough(), DExcessiveAsymmetryFilletWeld(a), DRootConcavity(t), DRootPorosity(t),
        DPoorStart(t), DInsufficientThroatThickness(a, t), DExcessiveThroatThickness(), DStrayArc(t),
        DSpatter(t), DTempercolour(t), DLinearMisalignment(t), DIncorrectRootGapOrFilletWelds(a, t));
    
    return grade;

}

/// Get Crack grade
/// Revne/Crack
/// @param {number} t Wall or plate thickness
/// @returns {string} Viable grade 
String DCrack(t) {
    if (t >= 0.5) {
        return "Not permitted/Ikke tilladt";
    }
}

/// Get Crater Crack grade
/// Kraterrevne/Crater crack
/// @param {number} t Wall or plate thickness
/// @returns {string} Viable grade 
String DCraterCrack(t) {
    if (t >= 0.5) {
        return "Not permitted/Ikke tilladt";
    }
}

/// Calculate Surface Pore
/// Overfladepore/Surface pore
/// @param {number} s weld thickness 
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DSurfacePore(s, t) {
    if (t >= 0.5) {
        return "d <= ${(0.3 * s).toStringAsFixed(1)}";
    }
    return "d <= ${(0.3 * s).toStringAsFixed(1)} (max 3mm)";

}

/// Calculate End crater pipe 
/// Åben kraterpore/End crater pipe
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DEndCraterPipe(t) {
    if (t >= 0.5 && t < 3 && t != 2) {
        return "*h <= ${(0.2 * t).toStringAsFixed(1)}";
    }
    if (t > 3) {
        return "*h <= ${(0.2 * t).toStringAsFixed(1)}";
    }

}

/// Bindingsfejl / lack of fusion
/// @returns {string} First viable grade 
String DLackOfFusion() {
    return "Not permitted/Ikke tilladt";
}

/// MikroBindingsfejl /*Micro lack of fusion
/// @returns {string} First viable grade 
String DMicroLackOfFusion() {
    return "Not permitted/Ikke tilladt";
    //Mikrobindingsfejl kun detekterbare ved mikroundersøglse / Only detected by micro examination
}

/// Calculate Incomplete root penetration 
/// Rodfejl/Incomplete root penetration
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DIncompleteRootPenetration(t) {
    return "*h <= ${(0.2 * t).toStringAsFixed(1)}";
}

/// Calculate Intermittent undercut
/// (Kontinueret) Lokal sidekærv / (Continuos) Intermittent undercut
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DIntermittenUndercut(t) {
    if (t > 3) {
        return "h <= ${(0.2 * t).toStringAsFixed(1)} (max 1mm)";
    }
    if (t >= 0.5 && t <= 3) {
        return "h <= ${(0.2 * t).toStringAsFixed(1)} (max 1mm)*";
    }
    return "t out of range!";
}

/// Calculate Shrinkage Groove
/// Rodkærv/Shrinkage groove
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DShrinkageGroove(t) {
    if (t > 3) {
        return "h <= ${(0.2 + 0.1 * t).toStringAsFixed(1)}";
    }
    if (t >= 0.5 && t <= 3) {
        return "h <= ${(0.2 * t).toStringAsFixed(1)} (max 2 mm)";
    }
}

/// Calculate Excess weld metal
/// Overvulst/Excess weld metal
/// @param {number} b Width of weld reinforcement
/// @returns {string} First viable grade 
String DExcessWeldMetal(b) {
    return "h <= ${(1.0 + 0.25 * b).toStringAsFixed(1)} (max 10mm)";
}

/// Calculate Excessive Convexity
/// Konveks sømoverflade/Excessive convexity
/// @param {number} b Width of weld reinforcement
/// @returns {string} First viable grade 
String DExcessiveConvexity(b) {
    return "h <= ${(1.0 + 0.25 * b).toStringAsFixed(1)} (max 5mm)"; //(max 5 mm)
}

/// Calculate Excess penetration
/// Rodvulst/Excess penetration
/// @param {number} b Width of weld reinforcement
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DExcessPenetration(b, t) {
    if (t > 3) {
        return "h <= ${(1.0 + 1.6 * b).toStringAsFixed(1)} (max 5 mm)";

    }
    if (t >= 0.5 && t <= 3) {
        return "h <= ${(1.0 + 0.6 * b).toStringAsFixed(1)}";
    }
}

/// Gets the acceptable angle for the weld toe
/// Forkert overgang / Incorrect Weld toe
/// @returns {string} Acceptable angle (For D, alpha is the same for fillet and butt welds) 
String DIncorrectWeldToe() {
    return "α => 90°";
}

/// Calculate Overlap
/// Overløbning/Overlap
/// @param {number} b Width of weld reinforcement
/// @returns {string} First viable grade 
String DOverlap(b) {
    return "h <= ${(0.2 * b).toStringAsFixed(1)}";
}

/// Calculate Non filled weld
/// Mangelfuld Opfyldning / Non filled weld
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DNonFilledWeld(t) {
    if (t > 3) {
        return "h <= ${(0.25 * t).toStringAsFixed(1)} (max 2 mm)";
    }
    if (t >= 0.5 && t <= 3) {
        return "h <= ${(0.25 * t).toStringAsFixed(1)}*";
    }
}

///Gennembrænding/Burn through
String DBurnThrough() {
    return "Not permitted/Ikke tilladt";
}

/// Calculate Excessive asymmetry of fillet weld
/// Ulige store ben/Excessive asymmetry of fillet weld
/// @param {number} a Nominal throat thickness of the fillet weld
/// @returns {string} First viable grade 
String DExcessiveAsymmetryFilletWeld(a) {
    return "h <= ${(2 + 0.2 * a).toStringAsFixed(1)}";
}

/// Calculate Root concavity
/// Indadvælving i roden / Root concavity
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DRootConcavity(t) {
    if (t > 3) {
        return "h <= ${(0.2 * t).toStringAsFixed(1)} (max 2 mm)*";
    }
    if (t >= 0.5 && t <= 3) {
        return "h <= ${(0.2 + 0.1 * t).toStringAsFixed(1)}";
    }
}

/// Calculate Root porosity
/// Porøsitet i rodvulst/Root porosity
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DRootPorosity(t) {
    if (t <= 0.5) {
        return "Locally permitted/Tilladt lokalt";
    }
    return "Not allowed";
}

/// Calculate Poor start
/// Fejl ved genstart/Poor start
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DPoorStart(t) {
    if (t <= 0.5) {
        return "Tilladt Grænsen afhænger af fejltypen opstået ved genstart./The limit depends on the type of Imperfection occurred due to restart.";
    }
    return "Not allowed";
}

/// Calculate Insufficient throat thickness
/// Utilstrækkeligt A-mål / Insufficient throat thickness
/// @param {number} a Nominal throat thickness of the fillet weld
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DInsufficientThroatThickness(a, t) {
    if (t > 3) {
        return "h <= ${(0.3 + 0.1 * a).toStringAsFixed(1)} (max 2mm)*";
    }
    if (t <= 0.5 && t > 3) {
        return "h <= ${(0.2 + 0.1 * a).toStringAsFixed(1)}*";
    }
}

/// Calculate Excessive Throat Thickness
/// For stort a-mål / Excessive throat thickness
/// @returns {string} First viable grade 
String DExcessiveThroatThickness() {
    return "Unlimited/Ubegænset";
}

/// Calculate Stray arc
/// Tændsår / Stray arc
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DStrayArc(t) {
    if (t <= 0.5) {
        return "Tilladt, hvis egenskaberne I grundmaterialet ikke påvirkes. / Permitted if the properties of the parent metal are not affected";
    }
}

/// Calculate Spatter
/// Svejsesprøjt / Spatter
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DSpatter(t) {
    if (t <= 0.5) {
        return "Accept afhænger af anvendelse, fx materiale, korrosionsbeskyttelse / Acceptance depends on application, e.g. material, corrosion protection";
    }
}

/// Calculate Tempercolour
/// Anløbsfarve / Tempercolour
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DTempercolour(t) {
    if (t <= 0.5) {
        return "Accept afhænger af anvendelse, fx materiale, korrosionsbeskyttelse / Acceptance depends on application, e.g. material, corrosion protection";
    }
    return "t is in an unacceptable range! (t is greater than 0.5)";
}

/// Calculate Linear misalignment
/// Forsætning / Linear misalignment
/// @param {number} t Wall or plate thickness (nominal size)
/// @returns {string} First viable grade 
String DLinearMisalignment(t) {
    if (t > 3) {
        return "h <= ${(0.25 * t).toStringAsFixed(1)} (max 5mm)";
    }
    if (t <= 0.5) {//THIS ONE IS SOMETHING ELSE
        return "h <= ${(0.5 * t).toStringAsFixed(1)} (max 4 mm)";
    }
    if (t <= 0.5 && t > 3) {
        return "h <= ${(0.2 + 0.25 * t).toStringAsFixed(1)}";
    }
}

/// Calculate Incorrect root gap or fillet welds.
/// Dårlig tilpasning af rodspalten for kantsømme. / Incorrect root gap or fillet welds.
/// @param {number} a Nominal throat thickness of the fillet weld
/// @param {number} t Wall or plate thickness
/// @returns {string} First viable grade 
String DIncorrectRootGapOrFilletWelds(a, t) {
    if (t > 3) {
        return "h <= ${(0.5 + 0.1 * a).toStringAsFixed(1)}";
    }
    if (t <= 0.5 && t > 3) {
        return "h <= ${(1 + 0.3 * a).toStringAsFixed(1)} (max 4 mm)";
    }
}