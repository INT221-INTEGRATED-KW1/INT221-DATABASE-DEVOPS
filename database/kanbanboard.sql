CREATE DATABASE kanbanboard;

USE kanbanboard;

DROP TABLE IF exists tasks;

CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    description TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    assignees VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    status ENUM('NO_STATUS', 'TODO', 'DOING', 'DONE') NOT NULL DEFAULT 'NO_STATUS',
    createdOn DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedOn DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW(),
    CHECK (CHAR_LENGTH(description) <= 500),
    CHECK (title <> ''),
    CHECK (description <> ''),
    CHECK (assignees <> '')
);

insert into tasks (title, description, assignees, status)
values ("TaskTitle1TaskTitle2TaskTitle3TaskTitle4TaskTitle5TaskTitle6TaskTitle7TaskTitle8TaskTitle9TaskTitle0", 
'Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti1Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti2Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti3Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti4Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti5', 
'Assignees1Assignees2Assignees3', "NO_STATUS");

insert into tasks (title, description, assignees, status)
values ("Repository", null, null, 'TODO');

insert into tasks (title, description, assignees, status)
values ("ดาต้าเบส", 'ສ້າງຖານຂໍ້ມູນ', 'あなた、彼、彼女 (私ではありません)', "DOING");

insert into tasks (title, description, assignees, status)
values ("_Infrastructure_", '_Setup containers_', 'ไก่งวง กับ เพนกวิน', "DONE");

grant all privileges on *.* to 'root'@'%';
