// CHECKDATE.JS javascript date validation functions library
// created by RN 25/1/2000

function date(iDay, iMonth, iYear) {
	this.Day = iDay
	this.Month = iMonth
	this.Year = iYear
}

var aiDaysInMonth = new Array(12)
aiDaysInMonth[1] = 31
aiDaysInMonth[2] = 29   
aiDaysInMonth[3] = 31
aiDaysInMonth[4] = 30
aiDaysInMonth[5] = 31
aiDaysInMonth[6] = 30
aiDaysInMonth[7] = 31
aiDaysInMonth[8] = 31
aiDaysInMonth[9] = 30
aiDaysInMonth[10] = 31
aiDaysInMonth[11] = 30
aiDaysInMonth[12] = 31

function Checkdate_fiDaysInFeb (iYear) {

    return (  ((iYear % 4 == 0) && ( (!(iYear % 100 == 0)) || (iYear % 400 == 0) ) ) ? 29 : 28 )
}

function Checkdate_fbIsYear (sYear) {

	if (Checkgen_fbIsStringEmpty(sYear)) {
		if (Checkdate_fbIsYear.arguments.length == 1) {
			return bDefaultEmptyOK
       		} else {
			return (Checkdate_fbIsYear.arguments[1] == true)
		}
	}
	if (!Checkgen_fbCheckInput(sYear, msDigits)) {
		return false
	}

	if (parseInt(sYear)<0) {
		return false
	}
	
    	return ((sYear.length == 2) || (sYear.length == 4))
}

function Checkdate_fbIsMonth (sMonth) {
	
	if (Checkgen_fbIsStringEmpty(sMonth)) {
		if (Checkdate_fbIsMonth.arguments.length == 1) {
			return bDefaultEmptyOK
       		} else {
			return (Checkdate_fbIsMonth.arguments[1] == true)
		}
	}
	
	if ((sMonth.charAt(0)=="0") && (sMonth.length > 1)) {
		sMonth=sMonth.substring(1)
	}

	if (!Checkgen_fbCheckInput(sMonth, msDigits)) {
		sMonth = Checkdate_fiMonthNameToNumber(sMonth)
	}
	
	if ((parseInt(sMonth)<1) || (parseInt(sMonth)>12)) {
		return false
	}
	
    	return true
}
	
function Checkdate_fbIsDay (sDay) {

	if (Checkgen_fbIsStringEmpty(sDay)) {
		if (Checkdate_fbIsDay.arguments.length == 1) {
			return bDefaultEmptyOK
       		} else {
			return (Checkdate_fbIsDay.arguments[1] == true)
		}
	}

	if ((sDay.charAt(0)=="0") && (sDay.length > 1)) {
		sDay=sDay.substring(1)
	}

	if (!Checkgen_fbCheckInput(sDay, msDigits)) {
		return false
	}

	if ((parseInt(sDay)<1) || (parseInt(sDay)>31)) {
		return false
	}
	
    	return true
}

function Checkdate_fbIsValidDate(sDay, sMonth, sYear) {

	
	if (!(Checkdate_fbIsYear(sYear, false) && Checkdate_fbIsMonth(sMonth, false) && Checkdate_fbIsDay(sDay, false))) {
		return false
	}
	
	var iYear = parseInt(sYear)
	if (isNaN(sMonth)) {
		sMonth = Checkdate_fiMonthNameToNumber(sMonth)
	}
	var iMonth = parseInt(sMonth)
	var iDay = parseInt(sDay)

	if (iDay > aiDaysInMonth[iMonth]) {
		return false
	}

    	if ((iMonth == 2) && (iDay > Checkdate_fiDaysInFeb(iYear))) {
		return false
	}

	return true
}

function Checkdate_fiMonthNameToNumber(sMonthName) {

	var iMonthNumber = 0
	sMonthName = sMonthName.substr(0,3)
	switch (sMonthName.toLowerCase()) {
		case 'jan' :
			iMonthNumber = 1
			break
		case 'feb' :
			iMonthNumber = 2
			break
		case 'mar' :
			iMonthNumber = 3
			break
		case 'apr' :
			iMonthNumber = 4
			break
		case 'may' :
			iMonthNumber = 5
			break
		case 'jun' :
			iMonthNumber = 6
			break
		case "jul" :
			iMonthNumber = 7
			break
		case 'aug' :
			iMonthNumber = 8
			break
		case 'sep' :
			iMonthNumber = 9
			break
		case 'oct' :
			iMonthNumber = 10
			break
		case 'nov' :
			iMonthNumber = 11
			break
		case 'dec' :
			iMonthNumber = 12
			break
		default:
			iMonthNumber = 0
	}
	
	return iMonthNumber
}

function Checkdate_fiMonthNumberToName(iMonthNumber) {

	var sMonthName = ""
	switch (iMonthNumber) {
		case 1 :
			sMonthName = 'January'
			break
		case 2 :
			sMonthName = 'February'
			break
		case 3 :
			sMonthName = 'March'
			break
		case 4 :
			sMonthName = 'April'
			break
		case 5 :
			sMonthName = 'May'
			break
		case 6 :
			sMonthName = 'June'
			break
		case 7 :
			sMonthName = 'July'
			break
		case 8 :
			sMonthName = 'August'
			break
		case 9 :
			sMonthName = 'September'
			break
		case 10 :
			sMonthName = 'October'
			break
		case 11 :
			sMonthName = 'November'
			break
		case 12 :
			sMonthName = 'December'
			break
		default:
			sMonthName = ''
	}
	
	return sMonthName
}

function Checkdate_fobjDateStringToObject(sDateString, lTwoDigitLBound) {
	
	var iDaySeparatorPos
	var iMonthSeparatorPos

	var sDay
	var sMonth
	var sYear
	
	var iDay
	var iMonth
	var iYear

	var sTwoDigitLBound = "" + lTwoDigitLBound
	var sFormattedDate
	var sFormattedYear
	
	var objDate

	iDaySeparatorPos=sDateString.indexOf("/")
	if (iDaySeparatorPos==-1) {
		iDaySeparatorPos=sDateString.indexOf(" ")
	}
	
	iMonthSeparatorPos=sDateString.indexOf("/",iDaySeparatorPos+1)
	if (iMonthSeparatorPos==-1) {
		iMonthSeparatorPos=sDateString.indexOf(" ",iDaySeparatorPos+1)
	}

	sDay=sDateString.substring(0, iDaySeparatorPos)
	sMonth=sDateString.substring(iDaySeparatorPos+1,iMonthSeparatorPos)
	sYear=sDateString.substring(iMonthSeparatorPos+1,sDateString.length)
	
	if (!(Checkdate_fbIsValidDate(sDay, sMonth, sYear))) {
		return null
	}
	
	if (sMonth.charAt(0)=="0") {
		sMonth=sMonth.charAt(1)
	}

	if (sDay.charAt(0)=="0") {
		sDay=sDay.charAt(1)
	}

	iDay=parseInt(sDay)
	if (isNaN(sMonth)) {
		sMonth = Checkdate_fiMonthNameToNumber(sMonth)
	}
	iMonth=parseInt(sMonth)
	
	if (sYear.charAt(0)=="0") {
		sYear=sYear.charAt(1)
	}
	
	iYear=parseInt(sYear)

	if (iYear < 100) {
		var iCentury = parseInt(sTwoDigitLBound.substring(0,2) + "00")
		if (iYear < parseInt(sTwoDigitLBound.substring(2,4))) {
			iYear = (iYear + iCentury + 100)
		} else {
			iYear = (iYear + iCentury)
		}
	}

	objDate = new date (iDay, iMonth, iYear)
	
	return objDate
}

function Checkdate_fsDateObjectToString(objDate, bNumeric) {
	
	var sFormattedDate
	var sSeparator
	
	if (bNumeric) {
		sSeparator = "/"
	} else {
		sSeparator = " "
	}
	sFormattedDate=objDate.Day + sSeparator
	if (bNumeric) {
		sFormattedDate += objDate.Month + sSeparator
	} else {
		sFormattedDate += Checkdate_fiMonthNumberToName(objDate.Month) + sSeparator
	}
	sFormattedDate += objDate.Year

	return sFormattedDate
}

function Checkdate_fiCalcAge(objDate) {

	var objTodayDate = Checkdate_fobjCurrentDate()
	var iAge
	
	if ((objTodayDate.Month < objDate.Month)||(objTodayDate.Month == objDate.Month)&&(objTodayDate.Day < objDate.Day)) {
		iAge=((objTodayDate.Year-objDate.Year)-1)
	}

	if ((objTodayDate.Month > objDate.Month)||((objTodayDate.Month == objDate.Month)&&(objTodayDate.Day > objDate.Day))||((objTodayDate.Month == objDate.Month)&&(objTodayDate.Day == objDate.Day))) {
		iAge=(objTodayDate.Year - objDate.Year)
	}
	
	return iAge
}


function Checkdate_fbIsAboveMinDate(objDate, objMinDate) {

	if (objDate.Year < objMinDate.Year) {
		return false
	}

	if ((objDate.Year == objMinDate.Year) && (objDate.Month < objMinDate.Month)) {
		return false
	}

	if ((objDate.Year == objMinDate.Year) && (objDate.Month == objMinDate.Month) && (objDate.Day < objMinDate.Day)) {
		return false
	}
	return true
}

function Checkdate_fbIsBelowMaxDate(objDate, objMaxDate) {

	if (objDate.Year > objMaxDate.Year) {
		return false
	}

	if ((objDate.Year == objMaxDate.Year) && (objDate.Month > objMaxDate.Month)) {
		return false
	}

	if ((objDate.Year == objMaxDate.Year) && (objDate.Month == objMaxDate.Month) && (objDate.Day > objMaxDate.Day)) {
		return false
	}
	return true
}

function Checkdate_fsCheckDate(txtDate, sTitle, lTwoDigitLBound, objMinDate, objMaxDate, bRequired, bSubmit) {

	var sFormattedDate
	var objDate
	
	txtDate.value=Checkgen_fsStripLeadingWhitespace(txtDate.value)
	
	
	if (txtDate.value=="") {
		if (bRequired && bSubmit) {
			return("Please enter " + sTitle)
		} else {
			return ""
		}
	}
 	
	objDate=Checkdate_fobjDateStringToObject(txtDate.value, lTwoDigitLBound)

	if (objDate==null) {
		return ("Please enter a valid date for " + sTitle)
	}

	txtDate.value=Checkdate_fsDateObjectToString(objDate, false)

	if (!(objMinDate.Day)) {
		objMinDate=Checkdate_fobjDateStringToObject(objMinDate, lTwoDigitLBound)
	}
		
	if (!(objMaxDate.Day)) {
		objMaxDate=Checkdate_fobjDateStringToObject(objMaxDate, lTwoDigitLBound)
	}

	if (!(Checkdate_fbIsAboveMinDate(objDate, objMinDate))) {
		return("The date you have entered for " + sTitle + " is earlier than allowed")
	}

	if (!(Checkdate_fbIsBelowMaxDate(objDate, objMaxDate))) {
		return("The date you have entered for " + sTitle + " is later than allowed")
	}
	
	return ""
}


function DateValidatorEvaluateSmall(val)
{

    var control = document.getElementById(val.controltovalidate);    
    var result = Checkdate_fsCheckDate(control, "DateValidation", 2000, '1 january 1900', '6 june 2079',false,true);

    if (result=="") 
        return true;
    else
        return false;    
}

function DateValidatorEvaluateLarge(val)
{

    var control = document.getElementById(val.controltovalidate);    
    var result = Checkdate_fsCheckDate(control, "DateValidation", 2000, '1 january 1753', '31 december 9999',false,true);

    if (result=="") 
        return true;
    else
        return false;    
}