USE airplanebooking;

CREATE TABLE `user`
(
	id INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL comment 'Tên người dùng',
	`email` VARCHAR(20) not null comment 'Email người dùng',
	`password` VARCHAR(20) not null comment 'Mật khẩu người	 dùng',
    
	PRIMARY KEY(id)
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Người dùng';

