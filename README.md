# Space missions (database-SQL) 🚀

* The database stores information about space missions
* I chose this topic because I have always been interested in space

# Selects (examples)

1.Select all crewed missions completed by SpaceX
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
Output: 

2.Select all missions organized by more than one organization
```
SELECT
FROM
WHERE
```
Output: 

3.Select all people who took part in more than one mission - display their number
```
SELECT
FROM
WHERE
```
Output: 

4.Select all failed drone missions
```
SELECT *
FROM Mission
JOIN
Status
ON
Status.Id=Mission.Status_Id
WHERE Status.Id = 2;
```
Output: 

5.Choose the largest vehicle from each category (among Satellites, Rockets and Rovers)
```
SELECT
FROM
WHERE
```
Output: 

6.Select all vehicles that participated in more than one mission
```
SELECT
FROM
WHERE
```
Output: 

7.Select all missions that involved non-US participants
```
SELECT
FROM
WHERE
```
Output: 

8.List the number of times each vehicle appeared in a given mission
```
SELECT
FROM
WHERE
```
Output: 

9.List the number of all missions and sort them by status (which status appears most often? - count it and display it)
```
SELECT
FROM
WHERE
```
Output: 

10.List which company/organization organized the most missions
```
SELECT
FROM
WHERE
```
Output: 

11.Display in the view the number of: all people, how many times they took part in how many missions - manned/unmanned.
```
SELECT
FROM
WHERE
```
Output: 

# Sources
* I used materials from classes and lectures from my college
