DROP DATABASE IF EXISTS kanbanboard;

CREATE DATABASE kanbanboard;

SET GLOBAL time_zone = '+00:00';

USE kanbanboard;

DROP TABLE IF exists status;
DROP TABLE IF exists tasks;

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

CREATE TABLE status (
  status_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL UNIQUE,
  description VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  limitMaximumTask boolean default false,
  color VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  CHECK (name <> ''),
  CHECK (description <> ''),
  CHECK (color <> '')
);

CREATE TABLE tasks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  description TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  assignees VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  status_id INT NOT NULL,
  createdOn DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updatedOn DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW() NOT NULL,
  INDEX `fk_tasks_status_idx` (`status_id` ASC) VISIBLE,
  CONSTRAINT `fk_tasks_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `status` (`status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CHECK (CHAR_LENGTH(description) <= 500),
  CHECK (title <> ''),
  CHECK (description <> ''),
  CHECK (assignees <> '')
);

INSERT INTO `status` (`status_id`, `name`, `description`,`limitMaximumTask`,`color`) VALUES (1, 'No Status', 'The default status', false,'gray');
INSERT INTO `status` (`status_id`, `name`, `description`,`limitMaximumTask`,`color`) VALUES (2, 'To Do', null, false,'orange');
INSERT INTO `status` (`status_id`, `name`, `description`,`limitMaximumTask`, `color`) VALUES (3, 'Doing', 'Being worked on', false,'blue');
INSERT INTO `status` (`status_id`, `name`, `description`,`limitMaximumTask`, `color`) VALUES (4, 'Done', 'Finished', false,'green');


INSERT INTO tasks (title, description, assignees, status_id, createdOn, updatedOn)
VALUES (
    'TaskTitle1TaskTitle2TaskTitle3TaskTitle4TaskTitle5TaskTitle6TaskTitle7TaskTitle8TaskTitle9TaskTitle0', 
    'Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti1Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti2Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti3Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti4Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti5', 
    'Assignees1Assignees2Assignees3', 
    1, 
    '2024-04-22 09:00:00', 
    '2024-04-22 09:00:00'
);

INSERT INTO tasks (title, description, assignees, status_id, createdOn, updatedOn)
VALUES (
    'Repository', 
    NULL, 
    NULL, 
    2,
    '2024-04-22 09:05:00', 
    '2024-04-22 14:00:00'
);

INSERT INTO tasks (title, description, assignees, status_id, createdOn, updatedOn)
VALUES (
    'ดาต้าเบส', 
    'ສ້າງຖານຂໍ້ມູນ', 
    'あなた、彼、彼女 (私ではありません)', 
    3, 
    '2024-04-22 09:10:00', 
    '2024-04-25 00:00:00'
);

INSERT INTO tasks (title, description, assignees, status_id, createdOn, updatedOn)
VALUES (
    '_Infrastructure_ ', 
    ' _Setup containers_', 
    'ไก่งวง กับ เพนกวิน', 
    4, 
    '2024-04-22 09:15:00', 
    '2024-04-22 10:00:00'
);