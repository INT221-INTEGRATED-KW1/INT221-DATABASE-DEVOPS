DROP DATABASE IF EXISTS kanbanboard;

CREATE DATABASE kanbanboard;

SET GLOBAL time_zone = '+00:00';

USE kanbanboard;

DROP TABLE IF exists status;
DROP TABLE IF exists tasks;
DROP TABLE IF exists statusLimit;

CREATE TABLE status (
  status_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL UNIQUE,
  description VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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

CREATE TABLE statusLimit (
  id INT AUTO_INCREMENT PRIMARY KEY,
  statusLimit BOOLEAN DEFAULT FALSE
);

INSERT INTO `statusLimit` (`statusLimit`) VALUES (false);

INSERT INTO status (status_id, name, color, description)
VALUES
  (1, 'No Status', 'lime', 'A status has not been assigned'),
  (2, 'To Do', 'red', 'The task is included in the project'),
  (3, 'In Progress', 'yellow', 'The task is being worked on'),
  (4, 'Reviewing', 'orange', 'The task is being reviewed'),
  (5, 'Testing', 'amber', 'The task is being tested'),
  (6, 'Waiting', 'amber', 'The task is waiting for a resource'),
  (7, 'Done', 'amber', 'The task has been completed');

INSERT INTO tasks (title, description, assignees, status_id, createdOn, updatedOn)
VALUES
  ('NS01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Joe Done', 1, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('NS02', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'John Doe', 1, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('NS03', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Alice Smith', 1, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('NS04', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Bob Johnson', 1, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('NS05', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Emily Brown', 1, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('NS06', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'David Wilson', 1, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('NS07', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Sophia Miller', 1, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('NS08', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Michael Davis', 1, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('NS09', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Emma Wilson', 1, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('NS010', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'James Brown', 1, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('DO01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Joe Done', 1, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('DO02', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Olivia Taylor', 7, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('DO03', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Noah Martinez', 7, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('DO04', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Isabella Johnson', 7, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('DO05', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Ethan Anderson', 7, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('DO06', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Mia Martinez', 7, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('DO07', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Aiden Smith', 7, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('DO08', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Amelia Davis', 7, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('DO09', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'William Brown', 7, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('DO10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Ella Wilson', 7, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('IP01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Alexander Joesen', 3, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('IP02', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Alexander Xi', 3, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('IP03', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Alexander Johnson', 3, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('IP04', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Samantha Brown', 3, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('IP05', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Matthew Wilson', 3, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('IP06', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Madison Miller', 3, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('IP07', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Liam Taylor', 3, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('IP08', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Charlotte Brown', 3, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('IP09', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Daniel Martinez', 3, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('IP010', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Grace Wilson', 3, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('TD01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Jackson Wong', 2, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('TD02', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Jackson Johnson', 2, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('TD03', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Chloe Martinez', 2, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('TD04', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Benjamin Wilson', 2, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('TD05', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Zoe Taylor', 2, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('TD06', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Gabriel Brown', 2, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('TD07', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Avery Davis', 2, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('TD08', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Lily Martinez', 2, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('TD09', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Ryan Johnson', 2, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('RE01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Natalie Wilson', 4, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('TE01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Christopher Taylor', 5, '2024-05-12 12:00:00', '2024-05-12 12:00:00'),
  ('WA01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Evelyn Brown', 6, '2024-05-12 12:00:00', '2024-05-12 12:00:00');