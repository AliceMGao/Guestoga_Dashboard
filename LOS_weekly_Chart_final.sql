-* File: IBFS:/BI2020/WFC/Repository/BI_W2020_G4/DB_Reports/Chart1.fex Created by WebFOCUS AppStudio
ENGINE MSODBC SET DEFAULT_CONNECTION Local_Connection

/*=====================================IF structured & SQL tables that I coded================================*/
-IF &CTAS_ID = _FOC_NULL AND &ARRIVAL_METHOD_ID = _FOC_NULL
-THEN GOTO Q1;
-IF  &ARRIVAL_METHOD_ID = _FOC_NULL
-THEN GOTO Q2;
-IF &CTAS_ID = _FOC_NULL
-THEN GOTO Q3 ELSE Q4;

-Q1
SQL MSODBC PREPARE SQLOUT FOR
Select
CASE
When This_wk._date is NULL then DATEADD(week,1,Last_wk._date)
else This_wk._date
end as 'Dates',
Last_wk._weekdy_name as 'Name of Day of Week',
This_wk.AVG_LOS  AS 'Average LOS',
Last_wk.AVG_LOS as 'Average LOS Last Week'
From (select
	DISTINCT Cast(registration_date as date) as _date,
	datename(weekday,registration_date) _weekdy_name,
	AVG(LOS_MINS) as AVG_LOS
	from [GUESTOGA].[dbo].[F_VISIT]
	where lwbs = 0
	and registration_date between '&REGISTRATION_DATE_FROM' and '&REGISTRATION_DATE_TO'
	group by
	Cast(registration_date as date),
	datename(weekday,registration_date)) AS This_wk
RIGHT Join
	(select DISTINCT
	Cast(registration_date as date) as _date,
	datename(weekday,registration_date) _weekdy_name,
	AVG(LOS_MINS) as AVG_LOS
	from [GUESTOGA].[dbo].[F_VISIT]
	where lwbs = 0
	and registration_date between Dateadd(week,-1,'&REGISTRATION_DATE_FROM') and Dateadd(week,-1,'&REGISTRATION_DATE_TO')
group by
Cast(registration_date as date),
datename(weekday,registration_date)) AS Last_wk
on This_wk._date = Dateadd(week,1,Last_wk._date)
Order by 'Dates';
END
-GOTO FINISH

-Q2
SQL MSODBC PREPARE SQLOUT FOR
Select
CASE
When This_wk._date is NULL then DATEADD(week,1,Last_wk._date)
else This_wk._date
end as 'Dates',
Last_wk._weekdy_name as 'Name of Day of Week',
This_wk.AVG_LOS  AS 'Average LOS',
Last_wk.AVG_LOS as 'Average LOS Last Week'
From (select
	DISTINCT Cast(registration_date as date) as _date,
	datename(weekday,registration_date) _weekdy_name,
	AVG(LOS_MINS) as AVG_LOS
	from [GUESTOGA].[dbo].[F_VISIT]
	where lwbs = 0
	and CTAS_ID = &CTAS_ID
	and registration_date between '&REGISTRATION_DATE_FROM' and '&REGISTRATION_DATE_TO'
	group by
	Cast(registration_date as date),
	datename(weekday,registration_date)) AS This_wk
RIGHT Join
	(select DISTINCT
	Cast(registration_date as date) as _date,
	datename(weekday,registration_date) _weekdy_name,
	AVG(LOS_MINS) as AVG_LOS
	from [GUESTOGA].[dbo].[F_VISIT]
	where lwbs = 0
	and CTAS_ID = &CTAS_ID
	and registration_date between Dateadd(week,-1,'&REGISTRATION_DATE_FROM') and Dateadd(week,-1,'&REGISTRATION_DATE_TO')
group by
Cast(registration_date as date),
datename(weekday,registration_date)) AS Last_wk
on This_wk._date = Dateadd(week,1,Last_wk._date)
Order by 'Dates';
END
-GOTO FINISH

-Q3
SQL MSODBC PREPARE SQLOUT FOR
Select
CASE
When This_wk._date is NULL then DATEADD(week,1,Last_wk._date)
else This_wk._date
end as 'Dates',
Last_wk._weekdy_name as 'Name of Day of Week',
This_wk.AVG_LOS  AS 'Average LOS',
Last_wk.AVG_LOS as 'Average LOS Last Week'
From (select
	DISTINCT Cast(registration_date as date) as _date,
	datename(weekday,registration_date) _weekdy_name,
	AVG(LOS_MINS) as AVG_LOS
	from [GUESTOGA].[dbo].[F_VISIT]
	where lwbs = 0
	and arrival_method_ID = &ARRIVAL_METHOD_ID
	and registration_date between '&REGISTRATION_DATE_FROM' and '&REGISTRATION_DATE_TO'
	group by
	Cast(registration_date as date),
	datename(weekday,registration_date)) AS This_wk
RIGHT Join
	(select DISTINCT
	Cast(registration_date as date) as _date,
	datename(weekday,registration_date) _weekdy_name,
	AVG(LOS_MINS) as AVG_LOS
	from [GUESTOGA].[dbo].[F_VISIT]
	where lwbs = 0
	and arrival_method_ID = &ARRIVAL_METHOD_ID
	and registration_date between Dateadd(week,-1,'&REGISTRATION_DATE_FROM') and Dateadd(week,-1,'&REGISTRATION_DATE_TO')
group by
Cast(registration_date as date),
datename(weekday,registration_date)) AS Last_wk
on This_wk._date = Dateadd(week,1,Last_wk._date)
Order by 'Dates';
END
-GOTO FINISH

-Q4
SQL MSODBC PREPARE SQLOUT FOR
Select
CASE
When This_wk._date is NULL then DATEADD(week,1,Last_wk._date)
else This_wk._date
end as 'Dates',
Last_wk._weekdy_name as 'Name of Day of Week',
This_wk.AVG_LOS  AS 'Average LOS',
Last_wk.AVG_LOS as 'Average LOS Last Week'
From (select
	DISTINCT Cast(registration_date as date) as _date,
	datename(weekday,registration_date) _weekdy_name,
	AVG(LOS_MINS) as AVG_LOS
	from [GUESTOGA].[dbo].[F_VISIT]
	where lwbs = 0
	and CTAS_ID = &CTAS_ID
	and arrival_method_ID = &ARRIVAL_METHOD_ID
	and registration_date between '&REGISTRATION_DATE_FROM' and '&REGISTRATION_DATE_TO'
	group by
	Cast(registration_date as date),
	datename(weekday,registration_date)) AS This_wk
RIGHT Join
	(select DISTINCT
	Cast(registration_date as date) as _date,
	datename(weekday,registration_date) _weekdy_name,
	AVG(LOS_MINS) as AVG_LOS
	from [GUESTOGA].[dbo].[F_VISIT]
	where lwbs = 0
	and CTAS_ID = &CTAS_ID
	and arrival_method_ID = &ARRIVAL_METHOD_ID
	and registration_date between Dateadd(week,-1,'&REGISTRATION_DATE_FROM') and Dateadd(week,-1,'&REGISTRATION_DATE_TO')
group by
Cast(registration_date as date),
datename(weekday,registration_date)) AS Last_wk
on This_wk._date = Dateadd(week,1,Last_wk._date)
Order by 'Dates';
END
-GOTO FINISH

-FINISH
END

/*============================AppStudio Generated code for graph based my inputs into the program====================================*/
-*IA_GRAPH_BEGIN
-*Do not delete or modify the comments below
*-INTERNAL_COMMENT LINE#0$PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+DQo8IS0tMS4wLS0+PFJvb3QgcmVsZWFzZT0iOC4yLjAuNiIgdmVyc2lvbj0iMS40Ij4NCiAgICA8T2JqZWN0IG9iamVjdElkPSJUYWJsZUNoYXJ0XzEiPg0KICAgICAgICA8UHJvcGVydHkgbmFtZT0iTGlua2VkU29ydHMiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciLz4NCiAgICAgICAgPFByb3BlcnR5IG5hbWU9ImhlYWRlckh0bWwiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPiZhbXA7bHQ7aGVhZCZhbXA7Z3Q7JmFtcDtsdDtzdHlsZSBpZD0mYW1wO3F1b3Q7YmktcnRmLXN0eWxlLXNoZWV0JmFtcDtxdW90OyB0eXBlPSZhbXA7cXVvdDt0ZXh0L2NzcyZhbXA7cXVvdDsmYW1wO2d0OyZhbXA7bHQ7L3N0eWxlJmFtcDtndDsmYW1wO2x0Oy9oZWFkJmFtcDtndDsmYW1wO2x0O2hlYWQmYW1wO2d0OyZhbXA7bHQ7L2hlYWQmYW1wO2d0OyZhbXA7bHQ7Ym9keSBzdHlsZT0mYW1wO3F1b3Q7YmFja2dyb3VuZDogcmdiKDI1NSwgMjU1LCAyNTUpOyZhbXA7cXVvdDsgYmdjb2xvcj0mYW1wO3F1b3Q7cmdiKDI1NSwyNTUsMjU1KSZhbXA7cXVvdDsmYW1wO2d0OyZhbXA7bHQ7Zm9udCBjb2xvcj0mYW1wO3F1b3Q7cmdiKDMyLDAsMzIpJmFtcDtxdW90OyBmYWNlPSZhbXA7cXVvdDtBUklBTCZhbXA7cXVvdDsgc2l6ZT0mYW1wO3F1b3Q7MyZhbXA7cXVvdDsmYW1wO2d0O0F2ZXJhZ2UmYW1wO2FtcDtuYnNwO0xPUyBieSBXZWVrZGF5JmFtcDtsdDsvZm9udCZhbXA7Z3Q7JmFtcDtsdDsvYm9keSZhbXA7Z3Q7PC9Qcm9wZXJ0eT4NCiAgICA8L09iamVjdD4NCiAgICA8T2JqZWN0IG9iamVjdElkPSJHTE9CQUwiPg0KICAgICAgICA8UHJvcGVydHkgbmFtZT0iU2FtcGxlRGF0YSIgdHlwZT0iamF2YS5sYW5nLkJvb2xlYW4iPmZhbHNlPC9Qcm9wZXJ0eT4NCiAgICAgICAgPFByb3BlcnR5IG5hbWU9Ikdsb2JhbFJlY29yZExpbWl0IiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj41MDA8L1Byb3BlcnR5Pg0KICAgICAgICA8UHJvcGVydHkgbmFtZT0iR2xvYmFsUnVuUmVjb3JkTGltaXQiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPjA8L1Byb3BlcnR5Pg0KICAgICAgICA8UHJvcGVydHkgbmFtZT0iR2xvYmFsT3B0aW1pemF0aW9uIiB0eXBlPSJqYXZhLmxhbmcuQm9vbGVhbiI+dHJ1ZTwvUHJvcGVydHk+DQogICAgICAgIDxQcm9wZXJ0eSBuYW1lPSJmaWVsZERpc3BsYXlNb2RlIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj5sYWJlbDwvUHJvcGVydHk+DQogICAgICAgIDxQcm9wZXJ0eSBuYW1lPSJwcmVmaXhEaXNwbGF5TW9kZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyIvPg0KICAgICAgICA8UHJvcGVydHkgbmFtZT0iQWN0aXZlX1N0eWxlX1VzZXJfdHlwZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+cG93ZXI8L1Byb3BlcnR5Pg0KICAgICAgICA8UHJvcGVydHkgbmFtZT0iR2xvYmFsVmFsdWVzUGFnaW5nIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj40PC9Qcm9wZXJ0eT4NCiAgICAgICAgPFByb3BlcnR5IG5hbWU9IkZvY2V4ZWNQcmVmZXJlbmNlcyIgdHlwZT0iTWFwIj4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9ImRpc3BsYXlTbGljZXJzVGFiRWRpdEluZm9NaW5pUHJlZmVyZW5jZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+ZmFsc2U8L0VudHJ5Pg0KICAgICAgICAgICAgPEVudHJ5IGtleT0iZGlzcGxheVNlcmllc1RhYkluZm9NaW5pUHJlZmVyZW5jZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+ZmFsc2U8L0VudHJ5Pg0KICAgICAgICAgICAgPEVudHJ5IGtleT0iYXV0b0RyaWxsU2NyaXB0IiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIi8+DQogICAgICAgICAgICA8RW50cnkga2V5PSJydW5PblN0YXJ0dXBEZWZlcnJlZEluZm9NaW5pUHJlZmVyZW5jZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+ZmFsc2U8L0VudHJ5Pg0KICAgICAgICAgICAgPEVudHJ5IGtleT0iZGlzcGxheUVkaXRNb2RlSW5mb01pbmlQcmVmZXJlbmNlIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj5mYWxzZTwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJkaXNwbGF5SG9tZVRhYkluZm9NaW5pUHJlZmVyZW5jZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+ZmFsc2U8L0VudHJ5Pg0KICAgICAgICAgICAgPEVudHJ5IGtleT0idGFyZ2V0QXV0b0xpbmtJbmZvTWluaVByZWZlcmVuY2UiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPmZhbHNlPC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9Im1ldGFkYXRhX3ZpZXdzIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj5NZXRhRGF0YVRyZWUuVklFV19ESU1TPC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9ImRpc3BsYXlEYXRhVGFiSW5mb01pbmlQcmVmZXJlbmNlIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj5mYWxzZTwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJpbmZvQXNzaXN0TW9kZUFsbG93ZWRJbmZvTWluaVByZWZlcmVuY2UiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPmZhbHNlPC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9ImVuYWJsZUF1dG9MaW5rSW5mb01pbmlQcmVmZXJlbmNlIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj5mYWxzZTwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJkZWZhdWx0X3ByZXZpZXdfcGFnZWxpbWl0IiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj41PC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9ImRpc3BsYXlJbnNlcnRUYWJJbmZvTWluaVByZWZlcmVuY2UiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPmZhbHNlPC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9InJ1bk9uU3RhcnR1cEluZm9NaW5pUHJlZmVyZW5jZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+dHJ1ZTwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJk
*-INTERNAL_COMMENT LINE#1$aXNwbGF5TGF5b3V0VGFiSW5mb01pbmlQcmVmZXJlbmNlIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj5mYWxzZTwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJkaXNwbGF5SW50ZXJhY3RpdmVNb2RlSW5mb01pbmlQcmVmZXJlbmNlIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj50cnVlPC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9ImVuYWJsZUluZm9NaW5pX1NhdmUiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPnRydWU8L0VudHJ5Pg0KICAgICAgICAgICAgPEVudHJ5IGtleT0iZGVmYXVsdF9wcmV2aWV3X3BhZ2VsaW1pdF9sYXlvdXQiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPjE8L0VudHJ5Pg0KICAgICAgICAgICAgPEVudHJ5IGtleT0iZGlzcGxheVNsaWNlcnNUYWJJbnRlcmFjdGl2ZUluZm9NaW5pUHJlZmVyZW5jZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+dHJ1ZTwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJkZWZhdWx0X2NvbXBvc2VfZm9ybWF0IiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj5BSFRNTDwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJkaXNwbGF5UmVzb3VyY2VzRmllbGRUYWJJbmZvTWluaVByZWZlcmVuY2UiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPmZhbHNlPC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9ImRpc3BsYXlGb3JtYXRUYWJJbmZvTWluaVByZWZlcmVuY2UiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPnRydWU8L0VudHJ5Pg0KICAgICAgICAgICAgPEVudHJ5IGtleT0iSXNHcmF5T3V0RmllbGRzTW9kZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+ZmFsc2U8L0VudHJ5Pg0KICAgICAgICA8L1Byb3BlcnR5Pg0KICAgICAgICA8UHJvcGVydHkgbmFtZT0iY2FzY2FkZU5hbWVzIiB0eXBlPSJNYXAiLz4NCiAgICAgICAgPFByb3BlcnR5IG5hbWU9Ik1hc3Rlcl9GaWxlcyIgdHlwZT0iU2V0Ij4NCiAgICAgICAgICAgIDxFbnRyeSB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj5TUUxPVVQ8L0VudHJ5Pg0KICAgICAgICA8L1Byb3BlcnR5Pg0KICAgICAgICA8UHJvcGVydHkgbmFtZT0ibWV0YWRhdGFWaWV3QXMiIHR5cGU9Ik1hcCI+DQogICAgICAgICAgICA8RW50cnkga2V5PSJTUUxPVVQiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPk1ldGFEYXRhVHJlZS5WSUVXX0RJTVM8L0VudHJ5Pg0KICAgICAgICA8L1Byb3BlcnR5Pg0KICAgICAgICA8UHJvcGVydHkgbmFtZT0iZW5hYmxlUHJldmlldyIgdHlwZT0iamF2YS5sYW5nLkJvb2xlYW4iPnRydWU8L1Byb3BlcnR5Pg0KICAgIDwvT2JqZWN0Pg0KPC9Sb290Pg0K
-*Do not delete or modify the comments above
ENGINE INT CACHE SET ON
SET PAGE-NUM=NOLEAD
SET ARGRAPHENGINE=JSCHART
SET EMBEDHEADING=ON
SET GRAPHDEFAULT=OFF
-DEFAULTH &WF_STYLE_UNITS='PIXELS';
-DEFAULTH &WF_STYLE_HEIGHT='405.0';
-DEFAULTH &WF_STYLE_WIDTH='770.0';
-DEFAULTH &WF_TITLE='WebFOCUS Report';
GRAPH FILE SQLOUT
-* Created by Info Assist for Graph
SUM SQLOUT.SQLOUT.Average_LOS AS 'Current Week '
SQLOUT.SQLOUT.Average_LOS_Last_Week AS 'Previous Week'
BY SQLOUT.SQLOUT.Dates NOPRINT
BY SQLOUT.SQLOUT.Name_of_Day_of_Week
HEADING
"Average LOS by Weekday"
ON GRAPH PCHOLD FORMAT JSCHART
ON GRAPH SET VZERO OFF
ON GRAPH SET GRWIDTH 1
ON GRAPH SET UNITS &WF_STYLE_UNITS
ON GRAPH SET HAXIS &WF_STYLE_WIDTH
ON GRAPH SET VAXIS &WF_STYLE_HEIGHT
ON GRAPH SET LOOKGRAPH BAR
ON GRAPH SET AUTOFIT ON
ON GRAPH SET STYLE *
*GRAPH_SCRIPT
setPieDepth(0);
setPieTilt(0);
setDepthRadius(0);
setPlace(true);
setCurveFitEquationDisplay(false);
*END
INCLUDE=IBFS:/FILE/IBI_HTML_DIR/ibi_themes/Warm.sty,$
TYPE=REPORT, TITLETEXT=&WF_TITLE.QUOTEDSTRING, $
TYPE=HEADING, JUSTIFY=LEFT, $
TYPE=HEADING, LINE=1, ITEM=1, OBJECT=TEXT, FONT='ARIAL', SIZE=12, COLOR=RGB(32 0 32), STYLE=NORMAL, $
TYPE=DATA, COLUMN=N1, BUCKET=x-axis, $
TYPE=DATA, COLUMN=N2, BUCKET=x-axis, $
TYPE=DATA, COLUMN=N3, BUCKET=y-axis, $
TYPE=DATA, COLUMN=N4, BUCKET=y-axis, $
*GRAPH_SCRIPT
setReportParsingErrors(false);
setSelectionEnableMove(false);
setSeriesType(1,2);
setDataTextDisplay(true);
setDisplay(getDataText(0), false);
setLegendPosition(1);
setFillColor(getSeries(1),new Color(255,128,128));
setTextRotation(getO1Label(),0);
setDisplay(getY1Title(),true);
setTextString(getY1Title(),"Minutes");
setTextString(getO1Title(),"Day of the Week");
setDisplay(getO1Title(),true);
*GRAPH_JS_FINAL
"xaxis": {
    "title": {
        "text": "Day of the Week"
    }
},
"yaxis": {
    "title": {
        "text": "Minutes"
    }
}
*END
ENDSTYLE
END
-RUN

-*IA_GRAPH_FINISH
