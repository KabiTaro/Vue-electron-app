SELECT t0.* from AppLog t0
inner join (select max(StartDateTime) max_startDateTime from AppLog
) t1
on t0.StartDateTime = t1.max_startDateTime