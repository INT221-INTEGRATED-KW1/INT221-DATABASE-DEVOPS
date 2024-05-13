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
  color VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `status` (`status_id`, `name`, `description`,`color`) VALUES (1, 'No Status', 'The default status','gray');
INSERT INTO `status` (`status_id`, `name`, `description`,`color`) VALUES (2, 'To Do', null,'orange');
INSERT INTO `status` (`status_id`, `name`, `description`, `color`) VALUES (3, 'Doing', 'Being worked on', 'blue');
INSERT INTO `status` (`status_id`, `name`, `description`, `color`) VALUES (4, 'Done', 'Finished','green');
