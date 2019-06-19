use SalesOrders
go


---[1]------
SELECT DISTINCT CustCity 
FROM Customers;

---[2]------
SELECT EmpFirstName, EmpLastName, EmpPhoneNumber
FROM Employees;

---[3]------
SELECT DISTINCT CategoryDescription
FROM Categories AS c
INNER JOIN Products AS p
ON c.CategoryID = p.CategoryID; ---Join ��� ����, ��� �������� ���� �������, ��'���� � ����������

---[4]------
SELECT p.ProductName, p.RetailPrice, c.CategoryDescription
FROM Products AS p
INNER JOIN Categories AS c
ON p.CategoryID = c.CategoryID; ---���� ����� ����� �� ���������� - � ��� ����� ���� ������� � ��� �������� ��� ����������� �� �� ����� ��������

---[5]------
SELECT VendName
FROM Vendors
ORDER BY VendZipCode; ---� ������� ���� ������ "� ������� �������� �������", �������: ��������� �� ��������. ���� ������� ���

---[6]------
SELECT EmpFirstName, EmpLastName, EmpPhoneNumber, EmployeeID
FROM Employees
ORDER BY EmpLastName, EmpFirstName;

---[7]------
SELECT DISTINCT VendName
FROM Vendors; ---DISTINCT �� �������, ���� ���� � ��� ����� ������ � ������ ��������,��������, �������� � ��

---[8]------
SELECT DISTINCT CustState
FROM Customers;

---[9]------
SELECT ProductName, RetailPrice
FROM Products;

---[10]------
SELECT *
FROM Employees;

---[11]------
SELECT DISTINCT VendCity, VendName
FROM Vendors
ORDER BY VendCity; ---����� ������ ��������, ���� � ������ ��� ������ ���� ���� ������

---[12]------
SELECT od.OrderNumber, MAX(pv.DaysToDeliver) AS DaysToDeliver
FROM Order_Details AS od
INNER JOIN Product_Vendors AS pv
ON od.ProductNumber = pv.ProductNumber
GROUP BY od.OrderNumber
ORDER BY od.OrderNumber ---��� �� ������ �'������� ���������� - ������ ����, ������� ����� �������. � ������ ��� ���� ������� ������ ��������� ������� �������. � ����� ������� ����� ����������� �-��� ��� ��� ��������

---[13]------
SELECT ProductName, (QuantityOnHand * RetailPrice) As TotalPrice
FROM Products

---[14]------
SELECT OrderNumber, (DATEDIFF(DD, OrderDate, ShipDate)) AS DaysToShip
FROM Orders

---------

---[1]------
;WITH nat_ETC AS(
SELECT 1 AS frst
UNION ALL
SELECT frst + 1 FROM nat_ETC
WHERE frst < 10000
)
SELECT * FROM nat_ETC
OPTION (MAXRECURSION 10000);

---[2]------
;WITH weekends_CTE AS(
SELECT CAST('20190101' AS Date) AS [DATE]
UNION ALL
SELECT DATEADD(dd, 1, [DATE])
FROM weekends_CTE
WHERE DATEADD(dd, 1, [DATE]) < cast('20200101' as Date)
)
SELECT COUNT([DATE]) AS weekends FROM weekends_CTE
WHERE DATENAME(dw, date) = 'Saturday' OR DATENAME(dw, date) = 'Sunday'
OPTION(MAXRECURSION 370);
