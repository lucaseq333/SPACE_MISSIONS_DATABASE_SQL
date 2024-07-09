# Space missions (database-SQL) 🚀

* The database stores information about space missions
* I chose this topic because I have always been interested in space

# Selects (examples)

#### 1.Select all crewed missions completed by SpaceX
```
SELECT Mission.Name, Mission.Type, Mission.Descritpion, Organization.Acronym, Status.Name AS "STATUS"
FROM Mission
FULL JOIN
Organization_Mission
ON
Mission.Id=Organization_Mission.Mission_Id
FULL JOIN
Organization
ON
Organization.Id=Organization_Mission.Organization_Id
FULL JOIN
Status
ON
Status.Id=Mission.Status_Id
WHERE
Status.Nazwa="udana" AND Organization.Acronym="SpaceX";
```
#### Output: 

#### 2.Select all missions organized by more than one organization
```
SELECT
FROM
WHERE
```
#### Output: 

#### 3.Select all people who took part in more than one mission - display their number
```

```
#### Output: 

#### 4.Select all failed drone missions
```
SELECT *
FROM Mission
JOIN
Status
ON
Status.Id=Mission.Status_Id
WHERE Status.Id = 2;
```
#### Output: 

![select4](https://github.com/lucaseq333/Space-missions---database-SQL/assets/116523351/b4622e7f-65d8-4853-8f96-01c8280924b4)

#### 5.Choose the largest vehicle from each category (among Satellites, Rockets and Rovers)
```
SELECT
FROM
WHERE
```
#### Output: 

#### 6.Select all vehicles that participated in more than one mission
```
SELECT Vehicle.Id, Vehicle.Nazwa, Mission.Id, Mission.Nazwa, Mission.Opis, COUNT(Mission_Id)
FROM Vehicle
JOIN
Vehicle_Mission
ON
Vehicle.Id=Vehicle_Mission.Vehicle_Id
JOIN
Mission
ON
Mission.Id=Vehicle_Mission.Mission_Id
WHERE COUNT(Mission_Id)>1
```
#### Output: 

#### 7.Select all missions that involved non-US participants
```
SELECT Mission.Name, Person.Name, Person.Surname, Person.Country_of_origin
FROM Mission
JOIN Person_Mission
ON
Mission.Id=Person_Mission.Mission_Id
JOIN
Person
ON
Person.Id=Person_Mission.Person_Id
WHERE Country_of_origin NOT LIKE 'USA'
ORDER BY Mission.Name;
```
#### Output: 

![select7](https://github.com/lucaseq333/Space-missions---database-SQL/assets/116523351/8c3fdc13-32e3-43a2-8e09-92cce7fa5309)

#### 8.List the number of times each vehicle appeared in a given mission
```
SELECT
FROM
WHERE
```
#### Output: 

![select8](https://github.com/lucaseq333/Space-missions---database-SQL/assets/116523351/6a43e5f7-dd7e-4f59-b2e5-015c496c57ab)

#### 9.List the number of all missions and sort them by status (which status appears most often? - count it and display it)
```
SELECT Status.Nazwa AS "STATUS NAME", COUNT(Status.Nazwa) AS "STATUS AMOUNT"
FROM Mission
JOIN
Status
ON
Mission.Status_Id=Status.Id
GROUP BY(Status.Nazwa)
ORDER BY COUNT(Status.Nazwa) DESC;
```
#### Output: 

![select9](https://github.com/lucaseq333/Space-missions---database-SQL/assets/116523351/50334ae0-d969-47f4-87aa-01609d7a2c38)

#### 10.List which company/organization organized the most missions
```
SELECT
FROM
WHERE
```
#### Output: 

#### 11.Display in the view the number of: all people, how many times they took part in how many missions, which and how many vehicles were used in which mission
```
SELECT
FROM
WHERE
```
#### Output: 

# Sources
* I used materials from classes and lectures from my college and my
