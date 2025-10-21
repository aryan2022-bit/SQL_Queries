SELECT
uq.unique_id,
em.name
FROM Employees em
LEFT JOIN EmployeeUNI uq
ON em.id = uq.id
