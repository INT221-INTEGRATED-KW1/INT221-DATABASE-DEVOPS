CREATE DATABASE kanbanboard;

SET GLOBAL time_zone = '+00:00';

USE kanbanboard;

DROP TABLE IF exists tasks;

CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    description TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    assignees varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    status ENUM('NO_STATUS', 'TODO', 'DOING', 'DONE') NOT NULL DEFAULT 'NO_STATUS',
    createdOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW(),
    CHECK (CHAR_LENGTH(description) <= 500),
    CHECK (title <> ''),
    CHECK (description <> ''),
    CHECK (assignees <> '')
);

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

INSERT INTO tasks (title, description, assignees, status, createdOn, updatedOn)
VALUES (
    'TaskTitle1TaskTitle2TaskTitle3TaskTitle4TaskTitle5TaskTitle6TaskTitle7TaskTitle8TaskTitle9TaskTitle0', 
    'Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti1Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti2Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti3Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti4Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti5', 
    'Assignees1Assignees2Assignees3', 
    'NO_STATUS', 
    '2024-04-22 09:00:00', 
    '2024-04-22 09:00:00'
);

INSERT INTO tasks (title, description, assignees, status, createdOn, updatedOn)
VALUES (
    'Repository', 
    NULL, 
    NULL, 
    'TODO', 
    '2024-04-22 09:05:00', 
    '2024-04-22 14:00:00'
);

INSERT INTO tasks (title, description, assignees, status, createdOn, updatedOn)
VALUES (
    'ดาต้าเบส', 
    'ສ້າງຖານຂໍ້ມູນ', 
    'あなた、彼、彼女 (私ではありません)', 
    'DOING', 
    '2024-04-22 09:10:00', 
    '2024-04-25 00:00:00'
);

INSERT INTO tasks (title, description, assignees, status, createdOn, updatedOn)
VALUES (
    '     _Infrastructure_     ', 
    '     _Setup containers_     ', 
    'ไก่งวง กับ เพนกวิน', 
    'DONE', 
    '2024-04-22 09:15:00', 
    '2024-04-22 10:00:00'
);