// CHECKGEN.JS javascript general validation functions library
// created by RN 28/1/2000

var bDefaultEmptyOK = false;

var msLowercaseLetters = "abcdefghijklmnopqrstuvwxyz";

var msUppercaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

var msDigits = "0123456789";

var msWhitespace = " \t\n\r";

function Checkgen_fbIsCharInString (sChar, sCheckString) {   

	if (Checkgen_fbIsStringEmpty(sChar)) {
		return false
	}
	return (sCheckString.indexOf(sChar)!=-1);
}

function Checkgen_fsStripCharsFromString (sInput, sCheckString) {

	var iCurrentPos;
	var sReturn = "";

	for (iCurrentPos = 0; iCurrentPos < sInput.length; iCurrentPos++) {   
		var sCurrentChar = sInput.charAt(iCurrentPos);
        	if (!Checkgen_fbIsCharInString(sCurrentChar, sCheckString)) {
			sReturn += sCurrentChar;
		}
	}

	return sReturn;
}

function Checkgen_fsStripLeadingCharsFromString (sInput, sCheckString) {

	var iCurrentPos = 0;

    	while ((iCurrentPos < sInput.length) && (Checkgen_fbIsCharInString (sInput.charAt(iCurrentPos), sCheckString))) {
		iCurrentPos++;
	}
    
	return sInput.substring (iCurrentPos, sInput.length);
}

function Checkgen_fiCountChar(sInput,sCountChar) {

	var iCharInString=0;
	var iInputPos=0;
	
	for (iInputPos=0; iInputPos < sInput.length; iInputPos++) {	
		var sCurrentChar=sInput.charAt(iInputPos);
		if (sCurrentChar==sCountChar) iCharInString++;
	}
	return iCharInString;
}

function Checkgen_fbCheckInput(sInput,sCheckString) {

	var bValid = true;
	var iInputPos = 0;
	
	while ((iInputPos < sInput.length) && (bValid==true)) {
		var sCurrentChar=sInput.charAt(iInputPos);
		bValid=Checkgen_fbIsCharInString (sCurrentChar, sCheckString);
		iInputPos++;
	}
	return bValid;
}

function Checkgen_fbIsLetter (sChar) {

	return Checkgen_fbIsCharInString (sChar, msLowercaseLetters + msUppercaseLetters);

}

function Checkgen_fbIsDigit (sChar) {

	return Checkgen_fbIsCharInString (sChar, msDigits);

}

function Checkgen_fbIsStringEmpty (sInput) {

	return ((sInput == null) || (sInput.length == 0));

}

function Checkgen_fsStripLeadingWhitespace (sInput) {

	return Checkgen_fsStripLeadingCharsFromString (sInput, msWhitespace);

}

function Checkgen_fbBrowserCanBlur() {

	var bValid = true;
	
	if(navigator.appName == "Netscape"){
		if(parseInt(navigator.appVersion) < 5.0){
			bValid = false;
		}
	}
	
	return (bValid);
}