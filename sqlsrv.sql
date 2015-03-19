/*
 * Create Tables
 */
CREATE TABLE auth_permissions (
  ID INT IDENTITY(1, 1) PRIMARY KEY,
  Lft INT NOT NULL,
  Rght INT NOT NULL,
  Title CHAR(64) NOT NULL,
  Description TEXT NOT NULL
);

CREATE INDEX Lft ON auth_permissions (Lft);
CREATE INDEX Rght ON auth_permissions (Rght);
CREATE INDEX Title ON auth_permissions (Title);


CREATE TABLE auth_rolepermissions (
  RoleID INT NOT NULL,
  PermissionID INT NOT NULL,
  AssignmentDate INT NOT NULL,
  CONSTRAINT auth_rolepermissions_pk PRIMARY KEY (RoleID, PermissionID)
);


CREATE TABLE auth_roles (
  ID INT IDENTITY(1, 1) PRIMARY KEY,
  Lft INT NOT NULL,
  Rght INT NOT NULL,
  Title VARCHAR(128) NOT NULL,
  Description text NOT NULL
);

CREATE INDEX Lft ON auth_roles (Lft);
CREATE INDEX Rght ON auth_roles (Rght);
CREATE INDEX Title ON auth_roles (Title);


CREATE TABLE auth_userroles (
  UserID INT NOT NULL,
  RoleID INT NOT NULL,
  AssignmentDate INT NOT NULL,
  CONSTRAINT auth_userroles_pk PRIMARY KEY (UserID, RoleID)
);


/*
 * Insert Initial Table Data
 */
INSERT INTO auth_permissions (Lft, Rght, Title, Description)
VALUES (0, 1, 'root', 'root');

DECLARE @PermissionId AS INT;
SET @PermissionId = @@IDENTITY

INSERT INTO auth_roles (Lft, Rght, Title, Description)
VALUES (0, 1, 'root', 'root');

DECLARE @RoleId AS INT;
SET @RoleId = @@IDENTITY

INSERT INTO auth_rolepermissions (RoleID, PermissionID, AssignmentDate)
VALUES (@RoleId, @PermissionId, DATEDIFF(s, '1970-01-01 00:00:00', GETUTCDATE()));

INSERT INTO auth_userroles (UserID, RoleID, AssignmentDate)
VALUES (1, @RoleId, DATEDIFF(s, '1970-01-01 00:00:00', GETUTCDATE()));
