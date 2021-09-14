			--PIVOT

-- �������� ������ ��� ����� OrderQty ��� ������� ���� � ������ ������� �� Production.WorkOrder � ���� ����������������� �������
SELECT  Year, [1] AS [January], [2] AS [February], [12] AS [December]
FROM 
	(SELECT Year = YEAR([ModifiedDate]), 
		    Month = MONTH([ModifiedDate]),
		    [OrderQty]
	 FROM [Production].[WorkOrder]
) AS SourceTable 
PIVOT
( SUM([OrderQty])
FOR Month IN ([1], [2], [12])
) AS PivotTable
ORDER BY Year