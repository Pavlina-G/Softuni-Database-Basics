ALTER TABLE minions
ADD COLUMN town_id INT NOT NULL ;

ALTER TABLE minions
ADD CONSTRAINT `town_fk`
FOREIGN KEY (`town_id`)
REFERENCES `towns` (`id`)