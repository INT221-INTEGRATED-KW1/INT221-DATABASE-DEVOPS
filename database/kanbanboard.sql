DROP DATABASE IF EXISTS kanbanboard;

CREATE DATABASE kanbanboard;

SET GLOBAL time_zone = '+00:00';

USE kanbanboard;

DROP TABLE IF exists status;
DROP TABLE IF exists tasks;
DROP TABLE IF exists boards;

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

CREATE TABLE IF NOT EXISTS `boards` (
  `board_id` VARCHAR(10) NOT NULL UNIQUE,
  `oid` VARCHAR(36) NOT NULL,
  `board_name` VARCHAR(120) NOT NULL,
  limitMaximumStatus BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (`board_id`)) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE status (
  status_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  description VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  color VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  board_id VARCHAR(10) NOT NULL,
 INDEX `fk_status_boards_idx` (`board_id` ASC) VISIBLE,
  CONSTRAINT `fk_status_boards`
    FOREIGN KEY (`board_id`)
    REFERENCES `boards` (`board_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CHECK (name <> ''),
  CHECK (description <> ''),
  CHECK (color <> '')
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE tasks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  description TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  assignees VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  status_id INT NOT NULL,
  createdOn DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updatedOn DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW() NOT NULL,
  board_id VARCHAR(10) NOT NULL,
  INDEX `fk_tasks_status_idx` (`status_id` ASC) VISIBLE,
  CONSTRAINT `fk_tasks_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `status` (`status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `fk_tasks_boards_idx` (`board_id` ASC) VISIBLE,
  CONSTRAINT `fk_tasks_boards`
    FOREIGN KEY (`board_id`)
    REFERENCES `boards` (`board_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CHECK (CHAR_LENGTH(description) <= 500),
  CHECK (title <> ''),
  CHECK (description <> ''),
  CHECK (assignees <> '')
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO boards (board_id, oid, board_name, limitMaximumStatus) VALUES
('JzTmVqCnyT', '2b2f94fd-68be-4ff2-8c67-cb35e139f6fb','job list', FALSE),
('9hZkPj2sBw', '995a830b-6c62-45e6-ab89-1077dff55a72','home work', FALSE);

INSERT INTO `status` (`name`, `description`,`color`, board_id) VALUES ('No Status', 'The default status','gray', 'JzTmVqCnyT');
INSERT INTO `status` (`name`, `description`,`color`, board_id) VALUES ('To Do', null, 'orange', 'JzTmVqCnyT');
INSERT INTO `status` (`name`, `description`, `color`, board_id) VALUES ('Doing', 'Being worked on','blue', '9hZkPj2sBw');
INSERT INTO `status` (`name`, `description`, `color`, board_id) VALUES ('Done', 'Finished','green', '9hZkPj2sBw');

INSERT INTO tasks (title, description, assignees, createdOn, updatedOn, status_id, board_id) VALUES
('TaskTitle1TaskTitle2TaskTitle3TaskTitle4TaskTitle5TaskTitle6TaskTitle7TaskTitle8TaskTitle9TaskTitle0',
 'Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti1Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti2Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti3Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti4Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti5',
 'Assignees1Assignees2Assignees3', 
 '2024-04-22 09:00:00', 
 '2024-04-22 09:00:00', 
 1, 
 'JzTmVqCnyT'),
('Repository', null, null, '2024-04-22 09:05:00', '2024-04-22 14:00:00', 2, 'JzTmVqCnyT'),
('ดาต้าเบส', 'ສ້າງຖານຂໍ້ມູນ', 'あなた、彼、彼女 (私ではありません)', '2024-04-22 09:10:00', '2024-04-25 00:00:00', 3, 'JzTmVqCnyT'),
(' _Infrastructure_ ', ' _Setup containers_ ', 'ไก่งวง กับ เพนกวิน', '2024-04-22 09:15:00', '2024-04-22 10:00:00', 4, '9hZkPj2sBw'),
('Test Application', 'Perform end-to-end testing of the application', 'Chris,White', '2024-08-05 14:00:00', '2024-08-05 20:00:00', 2, '9hZkPj2sBw');
