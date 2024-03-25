SELECT 
    EXTRACT(YEAR FROM p."Application_Date") AS Year,
    EXTRACT(MONTH FROM p."Application_Date") AS Month,
    d."Permit_Key",
    d."Ward_ID",
    COUNT(p."Permit_Key") AS Permit_Count
FROM 
    "BuildingPermitsDimension" p
JOIN
    "development_fact_table" d ON p."Permit_Key" = d."Permit_Key"
WHERE
    p."Completed_Date" IS NOT NULL
GROUP BY 
    EXTRACT(YEAR FROM p."Application_Date"), EXTRACT(MONTH FROM p."Application_Date"), d."Permit_Key", d."Ward_ID"
ORDER BY 
    Year, Month;