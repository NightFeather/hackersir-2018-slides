CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test_x7xr` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test_x7xr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(64) NOT NULL,
  `password` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_index` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `blah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `Users` VALUES  (1,'admin','0ef189449c087a9b1577db34a10b4fb010077ae8'),
                            (2,'root','ceaf14fdcd7a80564ecf19144c25a4bf6db57258'),
                            (3,'meow','a4a29b5575fdb0a1d7bbed5c93861849c2417db0'),
                            (4,'hax0r','6a4c0d00ffe971dd1ccea54e5c395f4271abd164'),
                            (5,'corgi','08ee497fad7c7ffd34678105c4827d8304bc52e4');

INSERT INTO `blah` (`data`) VALUES  ('hello'),
                                    ('goodbye'),
                                    ('somewhere'),
                                    ('in the world'),
                                    ('zawarudo');
