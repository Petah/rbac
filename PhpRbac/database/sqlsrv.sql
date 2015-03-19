
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
