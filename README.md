# quest-app

## Intro
This application is a simple web application using spring boot to capture and store individual`s demographic details. It has only three pages:
 - A main page with buttons to two other pages
 - Add a new record page
 - List all records page

## Prerequisites
Make sure you have installed all of the following prerequisites on your machine:
 - Java 11
 - Maven 3.8.6
 
## Running the Application
1) Download and unzip the project 
2) Using a terminal, go to the project directory. Ex: cd directoryPath/quest-app-main/quest
3) Run the command:
```
mvn spring-boot:run
```
The application will start running

![running](https://user-images.githubusercontent.com/10590715/175511247-ca9a3573-207a-42ca-b05e-3fec5d899d8d.PNG)

## How to Use
Once the application is running, you can access it through:
```
http://localhost:8080/
```
![main-page](https://user-images.githubusercontent.com/10590715/175512098-c34392ab-fc26-461c-b346-a895eee9c2dc.png)

And to check the in-memory database:
```
http://localhost:8080/h2
```

![bd-page](https://user-images.githubusercontent.com/10590715/175512127-3c76fc48-827e-4cca-ad1b-5ff57d465011.png)

**JDBC URL:** jdbc:h2:mem:questdb

**User Name:** sa

No password needed
