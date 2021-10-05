CREATE SCHEMA IF NOT EXISTS `taxi` DEFAULT CHARACTER SET utf8;
USE `taxi`;

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE `manufacturers` (
                                        `id` BIGINT(11) NOT NULL AUTO_INCREMENT,
                                        `name` VARCHAR(225) NOT NULL,
                                        `country` VARCHAR(225) NOT NULL,
                                        `is_deleted` TINYINT NOT NULL DEFAULT 0,
                                        PRIMARY KEY (`id`));

DROP TABLE IF EXISTS `drivers`;
CREATE TABLE `drivers` (
                                  `id` BIGINT(11) NOT NULL AUTO_INCREMENT,
                                  `name` VARCHAR(225) NOT NULL,
                                  `license_number` VARCHAR(225) NOT NULL,
                                  `is_deleted` TINYINT NOT NULL DEFAULT 0,
                                  PRIMARY KEY (`id`),
                                  UNIQUE INDEX `id_UNIQUE` (id ASC) VISIBLE,
                                  UNIQUE INDEX `license_number_UNIQUE` (`license_number` ASC) VISIBLE);

CREATE TABLE cars (
                      id BIGINT NOT NULL AUTO_INCREMENT,
                      model VARCHAR(255) NULL,
                      manufacturer_id BIGINT NOT NULL,
                      is_deleted tinyint NOT NULL DEFAULT '0',
                      PRIMARY KEY(id),
                      CONSTRAINT manufacturers_fk FOREIGN KEY(manufacturer_id) REFERENCES manufacturers(id)
);

CREATE TABLE cars_drivers (
                              driver_id BIGINT NOT NULL,
                              car_id BIGINT NOT NULL,
                              CONSTRAINT drivers_fk FOREIGN KEY(driver_id) REFERENCES drivers(id),
                              CONSTRAINT cars_fk FOREIGN KEY(car_id) REFERENCES cars(id)
);
