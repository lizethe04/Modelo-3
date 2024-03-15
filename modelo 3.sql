CREATE TABLE Category (
    CategoryId INTEGER PRIMARY KEY,
    Name VARCHAR(70)
);

CREATE TABLE Test (
    TestId INTEGER PRIMARY KEY,
    Name VARCHAR(50),
    CategoryId INTEGER,
    FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
);

CREATE TABLE Question (
    QuestionId INTEGER PRIMARY KEY,
    Text VARCHAR(255),
    Active BOOLEAN,
    TestId INTEGER,
    FOREIGN KEY (TestId) REFERENCES Test(TestId)
);

CREATE TABLE Answer (
    AnswerId INTEGER PRIMARY KEY,
    AnswerText VARCHAR(200),
    IsRight BOOLEAN,
    Active BOOLEAN,
    QuestionId INTEGER,
    FOREIGN KEY (QuestionId) REFERENCES Question(QuestionId)
);

CREATE TABLE Student (
    StudentId INTEGER PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE TestStudent (
    TestStudentId INTEGER PRIMARY KEY,
    TestId INTEGER,
    StudentId INTEGER,
    FOREIGN KEY (TestId) REFERENCES Test(TestId),
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId)
);

CREATE TABLE AnswerTestStudent (
    AnswerTestStudentId INTEGER PRIMARY KEY,
    AnswerId INTEGER,
    StudentResponse BOOLEAN,
    TestStudentId INTEGER,
    FOREIGN KEY (AnswerId) REFERENCES Answer(AnswerId),
    FOREIGN KEY (TestStudentId) REFERENCES TestStudent(TestStudentId)
);

CREATE TABLE Useruc (
    UserucId INTEGER PRIMARY KEY,
    Nickname VARCHAR(32),
    Password VARCHAR(32),
    LastAccess DATETIME,
    CreatedDate DATETIME,
    Active BOOLEAN
);

CREATE TABLE Supervisor (
    SupervisorId INTEGER PRIMARY KEY,
    Name VARCHAR(60),
    Active BOOLEAN
);

CREATE TABLE UserucSupervisor (
    UserucSupervisorId INTEGER PRIMARY KEY,
    UserucId INTEGER,
    SupervisorId INTEGER,
    FOREIGN KEY (UserucId) REFERENCES Useruc(UserucId),
    FOREIGN KEY (SupervisorId) REFERENCES Supervisor(SupervisorId)
);

CREATE TABLE UserucStudent (
    UserucStudentId INTEGER PRIMARY KEY,
    UserucId INTEGER,
    StudentId INTEGER,
    FOREIGN KEY (UserucId) REFERENCES Useruc(UserucId),
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId)
);

