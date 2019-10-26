libname datas "/folders/myfolders/Datas";



/* FORECASTING */



proc arima data=datas.forecast;
identify var=sales nlag=23;

run;



/* CONVERTING TO STATIONARY */



proc arima data=datas.forecast;

identify var=sales(1) nlag=23;
run;



/* diagnostic */



proc arima data=datas.forecast;

identify var=sales(1) nlag=23;

estimate p=1 q=1;
run;



/*FINAL FORECASTING ( NEXT UPCOMING 12 MONTHS)  */



proc arima data = datas.FORECAST;

identify var = Sales(1) nlag = 23 ;

estimate p = 1  q = 1;

forecast lead = 12 interval = month id = Period out=final_forecast;

run;