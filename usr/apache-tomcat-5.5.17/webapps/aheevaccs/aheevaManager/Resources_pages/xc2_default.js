// date format
// -----------
xcDateFormat="mm/dd/yyyy";



// css conf
// --------
xcCSSPanel="panel";

xcCSSHeadBlock="row_head";
xcCSSHead="head";

xcCSSArrowMonthPrev=["arrow_prev", "arrow_prev_over", "arrow_prev_down"];
xcCSSArrowMonthNext=["arrow_next", "arrow_next_over", "arrow_next_down"];

xcCSSArrowYearPrev=["arrow_prev", "arrow_prev_over", "arrow_prev_down"];
xcCSSArrowYearNext=["arrow_next", "arrow_next_over", "arrow_next_down"];

xcCSSWeekdayBlock="row_week";
xcCSSWeekday="weekday";

xcCSSDayBlock="row_day";
xcCSSDay=["day", "day_over", "day_down", "day_disabled"];
xcCSSDayCurrent=["day_current", "", ""];
xcCSSDaySpecial=["day_special", "day_disabled"];
xcCSSDayEmpty="day_empty";

xcCSSFootBlock="row_foot";
xcCSSFootToday=["foot", "foot_over", "foot_down"];
xcCSSFootClear=["foot", "foot_over", "foot_down"];
xcCSSFootBack=["foot", "foot_over", "foot_down"];
xcCSSFootClose=["foot", "foot_over", "foot_down"];
xcCSSFootReset=["foot", "foot_over", "foot_down"];


// layout conf
// -----------
//xcMonthNames=["Janvier", "F&eacute;vrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "D&eacute;cembre"];
xcMonthNames=[""+phrase[0]+"",""+phrase[1]+"",""+phrase[2]+"",""+phrase[3]+"",""+phrase[4]+"",""+phrase[5]+"",""+phrase[6]+"",""+phrase[7]+"",""+phrase[8]+"",""+phrase[9]+"",""+phrase[10]+"",""+phrase[11]+""];
//xcMonthShortNames=["Jan", "Fév", "Mar", "Avr", "Mai", "Jun", "Jul", "Aou", "Sep", "Oct", "Nov", "Déc"];
xcMonthShortNames=[""+phrase[12]+"",""+phrase[13]+"",""+phrase[14]+"",""+phrase[15]+"",""+phrase[16]+"",""+phrase[17]+"",""+phrase[18]+"",""+phrase[19]+"",""+phrase[20]+"",""+phrase[21]+"",""+phrase[22]+"",""+phrase[23]+""];
xcMonthPrefix="";
xcMonthSuffix="";

xcYearDigits=["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
xcYearPrefix="";
xcYearSuffix="";

xcHeadSeparator=" "; // separator string between year and month
xcHeadTagOrder=1; // 1: month/year, 0: year/month
xcHeadTagAdjustment=1; // 1: 100% width, 0: actual width

xcArrowMonth=["&#139;", "&#155;"];
xcArrowYear=["&#171;", "&#187;"];
xcArrowSwitch=[1, 1]; // [year, month] 1:on, 0:off
xcArrowPosition=0; // 0:in head block, 1:in foot block

// names for days
xcWeekdayNames=[""+phrase[24]+"",""+phrase[25]+"",""+phrase[26]+"",""+phrase[27]+"",""+phrase[28]+"",""+phrase[29]+"",""+phrase[30]+""];
xcWeekdayShortNames=[""+phrase[31]+"",""+phrase[32]+"",""+phrase[33]+"",""+phrase[34]+"",""+phrase[35]+"",""+phrase[36]+"",""+phrase[37]+""];
//xcWeekdayDisplay=["D", "L", "M", "M", "J", "V", "S", "D"];
xcWeekdayDisplay=[""+phrase[38]+"",""+phrase[39]+"",""+phrase[40]+"",""+phrase[41]+"",""+phrase[42]+"",""+phrase[43]+"",""+phrase[44]+""];

// foot links
xcFootTags=[""+phrase[45]+"", ""+phrase[46]+"", ""+phrase[47]+"", ""+phrase[48]+"", ""+phrase[49]+"", "_Today_", "_Back_", "_Reset_"];
xcFootTagSwitch=[1, 0, 0, 2, 0, 0, 0, 0]; // [today, clear, back, close, reset, _today_, _back_, _reset_] non-zero:display order, 0:off
xcFootTagAdjustment=0; // 1: % width, 0: actual width

// easy workaround for grid style
var xcGridWidth=0; // used as cellspacing

// others
xcBaseZIndex=100; // z-index for calendar layers
xcMultiCalendar=0; // 1:multi-calendar, 0:single-calendar
xcShowCurrentDate=1; // 1:highlight current date/today, 0:no highlight
xcWeekStart=0; // 0:Sunday, 1:Monday
xcAutoHide=0; // 0: no auto hide, non-zero:auto hide interval in ms
xcStickyMode=0; // 0:non-sticky, 1:sticky

// day contents
xcDayContents=["&nbsp;", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"];
xcDayContentsDisabled=xcDayContents;
xcDayContentsCurrent=xcDayContents;


// mod conf
// --------
xcModPath="../script/";
 xcMods=[{"order": 0,  "mod": "Month/Year List",   "script": "mod_list.js"},
        {"order": 0,  "mod": "Date Range",        "script": "mod_date.js"},
        {"order": 0,  "mod": "Special Days",      "script": "mod_days.js"},
        {"order": 0,  "mod": "Date Info",         "script": "mod_info.js"},
        {"order": 0,  "mod": "Journal",           "script": "mod_journal.js"},
        {"order": 0,  "mod": "Date Link",         "script": "mod_link.js"},
        {"order": 0,  "mod": "Long Date Format",  "script": "mod_long.js"},
        {"order": 0,  "mod": "Tiles",             "script": "mod_tiles.js"},
        {"order": 0,  "mod": "Date Tips",         "script": "mod_tips.js"}];

// Month/Year List Mod
xcCSSMonthYearList="list";

xcMonthListFormat="Month"; // Month, MONTH, Mon, Mon, mm
xcYearListRange=5;
xcYearListPrevRange="&#171;&nbsp;";
xcYearListNextRange="&nbsp;&#187;"

// Date Link Mod & Journal Mod
xcLinkBasePath="";
xcLinkTargetWindow="_blank";
xcLinkTargetWindowPara="location=1,menubar=1,resizable=1,scrollbars=1,status=1,titlebar=1,toolbar=1";

// Journal Mod
xcLinkPrefix="";
xcLinkSuffix=".html";
xcLinkDateFormat="yyyymmdd";

// Date Tips Mod
xcDateTipTiming=1000;
xcDateTipBoxTitleSwitch=1; // 1: show title, 0:don't show
xcDateTipBoxPosition=6; // 0:date top, 3:date right, 6:date bottom, 9:date left
xcDateTipBoxAlign=1; // 0:left, 1:center, 2:right, for position of 0 and 6
xcDateTipBoxValign=0; // 0:top, 1:middle, 2:bottom, for position of 3 and 9
xcDateTipBoxOffsetX=0;
xcDateTipBoxOffsetY=6;
xcCSSDateTipBoxTitle="tip_title";
xcCSSDateTipBox="tip_box";

// Popup-Window Version
xcWindowWidth=215;
xcWindowHeight=195;
xcWindowTemplate="../script/xc2_template.html"
