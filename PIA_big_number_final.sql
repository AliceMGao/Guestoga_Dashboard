-* File: IBFS:/BI2020/WFC/Repository/BI_W2020_G4/~aliceg/Dashboard_Master/Report1.fex Created by WebFOCUS AppStudio
ENGINE MSODBC SET DEFAULT_CONNECTION Local_Connection

/*=====================================IF structured  & SQL tables that I coded================================*/
-IF &CTAS_ID = _FOC_NULL AND &ARRIVAL_METHOD_ID = _FOC_NULL
-THEN GOTO Q1;
-IF  &ARRIVAL_METHOD_ID = _FOC_NULL
-THEN GOTO Q2;
-IF &CTAS_ID = _FOC_NULL
-THEN GOTO Q3 ELSE Q4;

-Q1
SQL MSODBC PREPARE SQLOUT FOR
Select '46' as PIA_target_mins, Avg(PIA_MINS) as Average_PIA
from [GUESTOGA].[dbo].[F_VISIT]
where lwbs = 0
AND registration_date between '&REGISTRATION_DATE_FROM' and '&REGISTRATION_DATE_TO';
END
- GOTO FINISH

-Q2
SQL MSODBC PREPARE SQLOUT FOR
Select '46' as PIA_target_mins, Avg(PIA_MINS) as Average_PIA
from [GUESTOGA].[dbo].[F_VISIT]
where lwbs = 0
AND CTAS_ID = &CTAS_ID
AND registration_date between '&REGISTRATION_DATE_FROM' and '&REGISTRATION_DATE_TO';
END
- GOTO FINISH

-Q3
SQL MSODBC PREPARE SQLOUT FOR
Select '46' as PIA_target_mins, Avg(PIA_MINS) as Average_PIA
from [GUESTOGA].[dbo].[F_VISIT]
where lwbs = 0
AND arrival_method_ID = &ARRIVAL_METHOD_ID
AND registration_date between '&REGISTRATION_DATE_FROM' and '&REGISTRATION_DATE_TO';
END
- GOTO FINISH


-Q4
SQL MSODBC PREPARE SQLOUT FOR
Select ID, PIA_target_mins, Avg(PIA_MINS) as Average_PIA
from [GUESTOGA].[dbo].[F_VISIT]
join [GUESTOGA].[dbo].[D_CTAS]
on CTAS_ID = ID
where lwbs = 0
AND CTAS_ID = &CTAS_ID
AND arrival_method_ID = &ARRIVAL_METHOD_ID
AND registration_date between '&REGISTRATION_DATE_FROM' and '&REGISTRATION_DATE_TO'
group by ID, PIA_target_mins;
END
-GOTO FINISH

-FINISH
END


/*============================AppStudio Generated code for graph based my inputs into the program====================================*/
TABLE FILE SQLOUT
SUM
     AVE.Average_PIA AS 'Average_PIA_in_Mins'
BY  PIA_target_mins NOPRINT
ON TABLE SET PAGE-NUM NOLEAD
ON TABLE SET ASNAMES ON
ON TABLE NOTOTAL
ON TABLE PCHOLD FORMAT HTML
ON TABLE SET HTMLEMBEDIMG ON
ON TABLE SET HTMLCSS ON
ON TABLE SET STYLE *
     INCLUDE = IBFS:/EDA/EDASERVE/_EDAHOME/ETC/warm.sty,
$
     DEFMACRO=CONDLESS_THAN,
     MACTYPE=RULE,
     WHEN=N2 LE N1,
$
     DEFMACRO=CONDGREATER_THAN,
     MACTYPE=RULE,
     WHEN=N2 GT N1,
$
TYPE=DATA,
     COLUMN=N2,
     SIZE=24,
$
TYPE=DATA,
     COLUMN=N2,
     SIZE=24,
     COLOR=RGB(51 153 102),
     MACRO=CONDLESS_THAN,
$
TYPE=DATA,
     COLUMN=N2,
     SIZE=24,
     COLOR='RED',
     MACRO=CONDGREATER_THAN,
$
TYPE=TITLE,
     COLUMN=N2,
     SIZE=11,
$
ENDSTYLE
END
