# Student Management System

A web-based student management system built with Java, JSP, Servlets, JDBC, Maven, and Oracle Database.

![Java](https://img.shields.io/badge/Java-17-orange)
![JSP](https://img.shields.io/badge/JSP-Servlets-blue)
![Maven](https://img.shields.io/badge/Maven-Build-red)
![Oracle](https://img.shields.io/badge/Oracle-Database-red)
![Tomcat](https://img.shields.io/badge/Apache%20Tomcat-9-yellow)

---

## 📖 Project Description

Student Management System is a web-based application designed to simplify and manage student records through a centralized platform. The application provides secure authentication, and efficient student record management with CRUD operations.

The system allows authorized users to add, view, update, delete, and search student records. Session management, input validation, exception handling, and centralized logging are implemented to improve application security, reliability, and maintainability.

The application follows the MVC architecture and uses the DAO design pattern to separate presentation, business, and data-access responsibilities.

### Project Highlights

- Secure user authentication and session management
- Complete student CRUD operations
- Student search
- Oracle database integration using JDBC
- MVC architecture with DAO design pattern
- Input validation and exception handling
- Centralized application logging
- Maven-based project management
- Responsive and user-friendly interface

## ✨ Features

### 🔐 Authentication & Authorization

- Secure user login and logout
- Session-based authentication
- Protected application pages using authentication filters

### 👨‍🎓 Student Management

- Add new student records
- View student details
- Update existing student records
- Delete student records
- Search students by relevant information

### 📊 Dashboard

- Centralized application dashboard
- Quick access to major student management operations

### 🛡️ Security & Reliability

- Input validation
- PreparedStatement-based database operations
- Exception handling
- Centralized application logging
- Externalized database configuration

### 🎨 User Interface

- Responsive JSP-based interface
- Consistent navigation and layouts
- User-friendly forms
- Confirmation messages for important actions
- Clean and consistent UI design

## 🛠️ Technology Stack

| Technology | Purpose |
|------------|---------|
| **Java 17** | Core application development and backend logic |
| **JSP** | Dynamic web page development |
| **Servlets** | Request handling and controller logic |
| **JDBC** | Database connectivity and SQL operations |
| **Oracle Database** | Relational database for storing application data |
| **Maven** | Dependency management and project build automation |
| **Apache Tomcat 9** | Servlet container and web application server |
| **HTML5** | Web page structure |
| **CSS3** | User interface styling and responsive layouts |
| **JavaScript** | Client-side interactions and validations |
| **Git** | Version control |
| **GitHub** | Source code management and project collaboration |

## 🏗️ Architecture Diagram

The following diagram shows the high-level architecture of the Student Management System.

![Student Management System Architecture](docs/architecture.png)

## 🗄️ Database Schema

The application uses Oracle Database to store user authentication details and student records. JDBC is used to establish the database connection and execute SQL operations through the DAO layer.

### USERS Table

| Column | Data Type | Description |
|--------|-----------|-------------|
| `USERNAME` | VARCHAR2 | User login name |
| `PASSWORD` | VARCHAR2 | Stored user password |
| `ROLE` | VARCHAR2 | User authorization role |

### STUDENT Table

| Column | Data Type | Description |
|--------|-----------|-------------|
| `ROLL_NO` | VARCHAR2 | Unique student roll number |
| `FIRST_NAME` | VARCHAR2 | Student first name |
| `LAST_NAME` | VARCHAR2 | Student last name |
| `PHONE` | NUMBER | Student phone number |
| `EMAIL` | VARCHAR2 | Student email address |
| `GENDER` | VARCHAR2 | Student gender |
| `BRANCH` | VARCHAR2 | Student branch |
| `YEAR` | NUMBER | Student academic year |
| `SECTION` | VARCHAR2 | Student section |

### Database Structure

```text
Oracle Database
├── USERS
│   ├── USER_ID
│   ├── USERNAME
│   ├── PASSWORD
│   └── ROLE
│
└── STUDENT
    ├── ROLL_NO
    ├── FIRST_NAME
    ├── LAST_NAME
    ├── PHONE
    ├── EMAIL
    ├── GENDER
    ├── BRANCH
    ├── YEAR
    └── SECTION
```


## 🚀 Installation Guide

### Prerequisites

Make sure the following are installed before running the application:

- Java 17 or later
- Apache Maven
- Oracle Database
- Apache Tomcat 9
- Git
- A web browser

### 1. Clone the Repository

```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd student-management-system
```

### 2. Configure the Oracle Database

1. Start your Oracle Database instance.
2. Create the required database user/schema.
3. Open the SQL script located in:

```text
database/student_management.sql
```

## Step 5 — Configure Database Credentials

### 3. Configure Database Credentials

Configure the database connection using your local configuration file.

## Step 6 — Build the Maven Project

### 4. Build the Application

From the project root, run:

```bash
mvn clean package
```

## Step 7 — Deploy to Tomcat

### 5. Deploy to Apache Tomcat

Copy the generated WAR file into the Tomcat `webapps` directory:

```text
apache-tomcat-9.x.x/webapps/
```

## Step 8 — Open the Application

### 6. Run the Application

Open your browser and navigate to:

```text
http://localhost:8080/<APPLICATION_CONTEXT_PATH>/
```

## Step 9 — Login

### 7. Login

Use the demo account configured for the application.

### Troubleshooting

**Maven build fails**

Verify that Java 17 and Maven are installed and configured correctly.

```bash
java -version
mvn -version
```