# ALTER TABLE `products` 
# ADD INDEX `cat_fk_idx` (`category_id` ASC) VISIBLE;
# ;
ALTER TABLE `products` 
ADD CONSTRAINT `cat_fk`
  FOREIGN KEY (`category_id`)
  REFERENCES `categories` (`id`)
  # ON DELETE NO ACTION
  # ON UPDATE NO ACTION;