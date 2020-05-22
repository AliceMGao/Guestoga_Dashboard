-* File: IBFS:/BI2020/WFC/Repository/BI_W2020_G4/~aliceg/Dashboard_Master/Chart1.fex Created by WebFOCUS AppStudio
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
This_wk.AVG_PIA  AS 'Average PIA',
Last_wk.AVG_PIA as 'Average PIA Last Week'
From (select
	DISTINCT Cast(registration_date as date) as _date,
	datename(weekday,registration_date) _weekdy_name,
	AVG(PIA_MINS) as AVG_PIA
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
	AVG(PIA_MINS) as AVG_PIA
	from [GUESTOGA].[dbo].[F_VISIT]
	where lwbs = 0
	and registration_date between Dateadd(week,-1,'&REGISTRATION_DATE_FROM') and Dateadd(week,-1,'&REGISTRATION_DATE_TO')
group by
Cast(registration_date as date),
datename(weekday,registration_date)) AS Last_wk
on This_wk._date =dateadd(week,1,Last_wk._date)
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
This_wk.AVG_PIA  AS 'Average PIA',
Last_wk.AVG_PIA as 'Average PIA Last Week'
From (select
	DISTINCT Cast(registration_date as date) as _date,
	datename(weekday,registration_date) _weekdy_name,
	AVG(PIA_MINS) as AVG_PIA
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
	AVG(PIA_MINS) as AVG_PIA
	from [GUESTOGA].[dbo].[F_VISIT]
	where lwbs = 0
	and CTAS_ID = &CTAS_ID
	and registration_date between Dateadd(week,-1,'&REGISTRATION_DATE_FROM') and Dateadd(week,-1,'&REGISTRATION_DATE_TO')
group by
Cast(registration_date as date),
datename(weekday,registration_date)) AS Last_wk
on This_wk._date =dateadd(week,1,Last_wk._date)
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
This_wk.AVG_PIA  AS 'Average PIA',
Last_wk.AVG_PIA as 'Average PIA Last Week'
From (select
	DISTINCT Cast(registration_date as date) as _date,
	datename(weekday,registration_date) _weekdy_name,
	AVG(PIA_MINS) as AVG_PIA
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
	AVG(PIA_MINS) as AVG_PIA
	from [GUESTOGA].[dbo].[F_VISIT]
	where lwbs = 0
	and arrival_method_ID = &ARRIVAL_METHOD_ID
	and registration_date between Dateadd(week,-1,'&REGISTRATION_DATE_FROM') and Dateadd(week,-1,'&REGISTRATION_DATE_TO')
group by
Cast(registration_date as date),
datename(weekday,registration_date)) AS Last_wk
on This_wk._date =dateadd(week,1,Last_wk._date)
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
This_wk.AVG_PIA  AS 'Average PIA',
Last_wk.AVG_PIA as 'Average PIA Last Week'
From (select
	DISTINCT Cast(registration_date as date) as _date,
	datename(weekday,registration_date) _weekdy_name,
	AVG(PIA_MINS) as AVG_PIA
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
	AVG(PIA_MINS) as AVG_PIA
	from [GUESTOGA].[dbo].[F_VISIT]
	where lwbs = 0
	and CTAS_ID = &CTAS_ID
	and arrival_method_ID = &ARRIVAL_METHOD_ID
	and registration_date between Dateadd(week,-1,'&REGISTRATION_DATE_FROM') and Dateadd(week,-1,'&REGISTRATION_DATE_TO')
group by
Cast(registration_date as date),
datename(weekday,registration_date)) AS Last_wk
on This_wk._date =dateadd(week,1,Last_wk._date)
Order by 'Dates';
END
-GOTO FINISH


-FINISH
END

/*============================AppStudio Generated code for graph based my inputs into the program====================================*/
-*IA_GRAPH_BEGIN
-*Do not delete or modify the comments below
*-INTERNAL_COMMENT LINE#0$PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+DQo8IS0tMS4wLS0+PFJvb3QgcmVsZWFzZT0iOC4yLjAuNiIgdmVyc2lvbj0iMS40Ij4NCiAgICA8T2JqZWN0IG9iamVjdElkPSJUYWJsZUNoYXJ0XzEiPg0KICAgICAgICA8UHJvcGVydHkgbmFtZT0iTGlua2VkU29ydHMiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciLz4NCiAgICAgICAgPFByb3BlcnR5IG5hbWU9ImhlYWRlckh0bWwiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPiZhbXA7bHQ7aGVhZCZhbXA7Z3Q7JmFtcDtsdDtzdHlsZSBpZD0mYW1wO3F1b3Q7YmktcnRmLXN0eWxlLXNoZWV0JmFtcDtxdW90OyB0eXBlPSZhbXA7cXVvdDt0ZXh0L2NzcyZhbXA7cXVvdDsmYW1wO2d0OyZhbXA7bHQ7L3N0eWxlJmFtcDtndDsmYW1wO2x0Oy9oZWFkJmFtcDtndDsmYW1wO2x0O2hlYWQmYW1wO2d0OyZhbXA7bHQ7L2hlYWQmYW1wO2d0OyZhbXA7bHQ7Ym9keSBzdHlsZT0mYW1wO3F1b3Q7YmFja2dyb3VuZDogcmdiKDI1NSwgMjU1LCAyNTUpOyZhbXA7cXVvdDsgYmdjb2xvcj0mYW1wO3F1b3Q7cmdiKDI1NSwyNTUsMjU1KSZhbXA7cXVvdDsmYW1wO2d0OyZhbXA7bHQ7Zm9udCBjb2xvcj0mYW1wO3F1b3Q7cmdiKDMyLDAsMzIpJmFtcDtxdW90OyBmYWNlPSZhbXA7cXVvdDtBUklBTCZhbXA7cXVvdDsgc2l6ZT0mYW1wO3F1b3Q7MyZhbXA7cXVvdDsmYW1wO2d0O0F2ZXJhZ2UmYW1wO2FtcDtuYnNwO1BJQSZhbXA7YW1wO25ic3A7YnkgV2Vla2RheSZhbXA7bHQ7L2ZvbnQmYW1wO2d0OyZhbXA7bHQ7L2JvZHkmYW1wO2d0OzwvUHJvcGVydHk+DQogICAgPC9PYmplY3Q+DQogICAgPE9iamVjdCBvYmplY3RJZD0iR0xPQkFMIj4NCiAgICAgICAgPFByb3BlcnR5IG5hbWU9IlNhbXBsZURhdGEiIHR5cGU9ImphdmEubGFuZy5Cb29sZWFuIj5mYWxzZTwvUHJvcGVydHk+DQogICAgICAgIDxQcm9wZXJ0eSBuYW1lPSJHbG9iYWxSZWNvcmRMaW1pdCIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+NTAwPC9Qcm9wZXJ0eT4NCiAgICAgICAgPFByb3BlcnR5IG5hbWU9Ikdsb2JhbFJ1blJlY29yZExpbWl0IiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj4wPC9Qcm9wZXJ0eT4NCiAgICAgICAgPFByb3BlcnR5IG5hbWU9Ikdsb2JhbE9wdGltaXphdGlvbiIgdHlwZT0iamF2YS5sYW5nLkJvb2xlYW4iPnRydWU8L1Byb3BlcnR5Pg0KICAgICAgICA8UHJvcGVydHkgbmFtZT0iZmllbGREaXNwbGF5TW9kZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+bGFiZWw8L1Byb3BlcnR5Pg0KICAgICAgICA8UHJvcGVydHkgbmFtZT0icHJlZml4RGlzcGxheU1vZGUiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciLz4NCiAgICAgICAgPFByb3BlcnR5IG5hbWU9IkFjdGl2ZV9TdHlsZV9Vc2VyX3R5cGUiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPnBvd2VyPC9Qcm9wZXJ0eT4NCiAgICAgICAgPFByb3BlcnR5IG5hbWU9Ikdsb2JhbFZhbHVlc1BhZ2luZyIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+NDwvUHJvcGVydHk+DQogICAgICAgIDxQcm9wZXJ0eSBuYW1lPSJGb2NleGVjUHJlZmVyZW5jZXMiIHR5cGU9Ik1hcCI+DQogICAgICAgICAgICA8RW50cnkga2V5PSJkaXNwbGF5U2xpY2Vyc1RhYkVkaXRJbmZvTWluaVByZWZlcmVuY2UiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPmZhbHNlPC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9ImRpc3BsYXlTZXJpZXNUYWJJbmZvTWluaVByZWZlcmVuY2UiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPmZhbHNlPC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9ImF1dG9EcmlsbFNjcmlwdCIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyIvPg0KICAgICAgICAgICAgPEVudHJ5IGtleT0icnVuT25TdGFydHVwRGVmZXJyZWRJbmZvTWluaVByZWZlcmVuY2UiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPmZhbHNlPC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9ImRpc3BsYXlFZGl0TW9kZUluZm9NaW5pUHJlZmVyZW5jZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+ZmFsc2U8L0VudHJ5Pg0KICAgICAgICAgICAgPEVudHJ5IGtleT0iZGlzcGxheUhvbWVUYWJJbmZvTWluaVByZWZlcmVuY2UiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPmZhbHNlPC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9InRhcmdldEF1dG9MaW5rSW5mb01pbmlQcmVmZXJlbmNlIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj5mYWxzZTwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJtZXRhZGF0YV92aWV3cyIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+TWV0YURhdGFUcmVlLlZJRVdfRElNUzwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJkaXNwbGF5RGF0YVRhYkluZm9NaW5pUHJlZmVyZW5jZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+ZmFsc2U8L0VudHJ5Pg0KICAgICAgICAgICAgPEVudHJ5IGtleT0iaW5mb0Fzc2lzdE1vZGVBbGxvd2VkSW5mb01pbmlQcmVmZXJlbmNlIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj5mYWxzZTwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJlbmFibGVBdXRvTGlua0luZm9NaW5pUHJlZmVyZW5jZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+ZmFsc2U8L0VudHJ5Pg0KICAgICAgICAgICAgPEVudHJ5IGtleT0iZGVmYXVsdF9wcmV2aWV3X3BhZ2VsaW1pdCIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+NTwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJkaXNwbGF5SW5zZXJ0VGFiSW5mb01pbmlQcmVmZXJlbmNlIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj5mYWxzZTwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJydW5PblN0YXJ0dXBJbmZvTWluaVByZWZlcmVuY2UiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPnRydWU8L0VudHJ5Pg0KICAgICAgICAgICAg
*-INTERNAL_COMMENT LINE#1$PEVudHJ5IGtleT0iZGlzcGxheUxheW91dFRhYkluZm9NaW5pUHJlZmVyZW5jZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+ZmFsc2U8L0VudHJ5Pg0KICAgICAgICAgICAgPEVudHJ5IGtleT0iZGlzcGxheUludGVyYWN0aXZlTW9kZUluZm9NaW5pUHJlZmVyZW5jZSIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+dHJ1ZTwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJlbmFibGVJbmZvTWluaV9TYXZlIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj50cnVlPC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9ImRlZmF1bHRfcHJldmlld19wYWdlbGltaXRfbGF5b3V0IiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj4xPC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9ImRpc3BsYXlTbGljZXJzVGFiSW50ZXJhY3RpdmVJbmZvTWluaVByZWZlcmVuY2UiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPnRydWU8L0VudHJ5Pg0KICAgICAgICAgICAgPEVudHJ5IGtleT0iZGVmYXVsdF9jb21wb3NlX2Zvcm1hdCIgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+QUhUTUw8L0VudHJ5Pg0KICAgICAgICAgICAgPEVudHJ5IGtleT0iZGlzcGxheVJlc291cmNlc0ZpZWxkVGFiSW5mb01pbmlQcmVmZXJlbmNlIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj5mYWxzZTwvRW50cnk+DQogICAgICAgICAgICA8RW50cnkga2V5PSJkaXNwbGF5Rm9ybWF0VGFiSW5mb01pbmlQcmVmZXJlbmNlIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj50cnVlPC9FbnRyeT4NCiAgICAgICAgICAgIDxFbnRyeSBrZXk9IklzR3JheU91dEZpZWxkc01vZGUiIHR5cGU9ImphdmEubGFuZy5TdHJpbmciPmZhbHNlPC9FbnRyeT4NCiAgICAgICAgPC9Qcm9wZXJ0eT4NCiAgICAgICAgPFByb3BlcnR5IG5hbWU9ImNhc2NhZGVOYW1lcyIgdHlwZT0iTWFwIi8+DQogICAgICAgIDxQcm9wZXJ0eSBuYW1lPSJNYXN0ZXJfRmlsZXMiIHR5cGU9IlNldCI+DQogICAgICAgICAgICA8RW50cnkgdHlwZT0iamF2YS5sYW5nLlN0cmluZyI+U1FMT1VUPC9FbnRyeT4NCiAgICAgICAgPC9Qcm9wZXJ0eT4NCiAgICAgICAgPFByb3BlcnR5IG5hbWU9Im1ldGFkYXRhVmlld0FzIiB0eXBlPSJNYXAiPg0KICAgICAgICAgICAgPEVudHJ5IGtleT0iU1FMT1VUIiB0eXBlPSJqYXZhLmxhbmcuU3RyaW5nIj5NZXRhRGF0YVRyZWUuVklFV19ESU1TPC9FbnRyeT4NCiAgICAgICAgPC9Qcm9wZXJ0eT4NCiAgICAgICAgPFByb3BlcnR5IG5hbWU9ImVuYWJsZVByZXZpZXciIHR5cGU9ImphdmEubGFuZy5Cb29sZWFuIj50cnVlPC9Qcm9wZXJ0eT4NCiAgICA8L09iamVjdD4NCjwvUm9vdD4NCg==
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
SUM SQLOUT.SQLOUT.Average_PIA AS 'Current Week'
SQLOUT.SQLOUT.Average_PIA_Last_Week AS 'Previous Week'
BY SQLOUT.SQLOUT.Dates NOPRINT
BY SQLOUT.SQLOUT.Name_of_Day_of_Week
HEADING
"Average PIA by Weekday"
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
TYPE=DATA, COLUMN=N1, BUCKET=x-axis, $
TYPE=DATA, COLUMN=N2, BUCKET=x-axis, $
TYPE=DATA, COLUMN=N3, BUCKET=y-axis, $
TYPE=DATA, COLUMN=N4, BUCKET=y-axis, $
TYPE=HEADING, JUSTIFY=LEFT, $
TYPE=HEADING, LINE=1, ITEM=1, OBJECT=TEXT, FONT='ARIAL', SIZE=12, COLOR=RGB(32 0 32), STYLE=NORMAL, $
*GRAPH_SCRIPT
setReportParsingErrors(false);
setSelectionEnableMove(false);
setSeriesType(1,2);
setFillColor(getSeries(1),new Color(255,128,128));
setLegendPosition(1);
setDisplay(getDataText(1), true);
setDataTextDisplay(true);
setDisplay(getDataText(0), false);
setTextRotation(getO1Label(),0);
setTextString(getO1Title(),"Day of the Week");
setDisplay(getO1Title(),true);
setDisplay(getY1Title(),true);
setTextString(getY1Title(),"Minutes");
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
