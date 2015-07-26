--
-- Permission type 'user'
--
INSERT INTO `namedmanager`.`permissions` (`id`, `value`, `description`) VALUES ('4', 'user', 'Edit records only for allowed domains.'); 

--
-- Menu for user 'user'
--
INSERT INTO `namedmanager`.`menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`, `config`) VALUES (NULL, '300', 'top', 'menu_domains', 'domains/domains.php', '4', ''); 
INSERT INTO `namedmanager`.`menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`, `config`) VALUES (NULL, '301', 'menu_domains', 'menu_domains_view', 'domains/domains.php', '4', ''); 
INSERT INTO `namedmanager`.`menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`, `config`) VALUES (NULL, '310', 'menu_domains_view', '', 'domains/view.php', '4', ''); 
INSERT INTO `namedmanager`.`menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`, `config`) VALUES (NULL, '310', 'menu_domains_view', '', 'domains/records.php', '4', ''); 

--
-- User assigned domains. Table `users_domains`
--

CREATE TABLE IF NOT EXISTS `users_domains` (
  `user` int(11) NOT NULL,
  `domain` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `users_domains`
  ADD PRIMARY KEY (`user`,`domain`),
  ADD KEY `domain` (`domain`);
ALTER TABLE `users_domains`
  ADD CONSTRAINT `users_domains_ibfk_2` FOREIGN KEY (`domain`) REFERENCES `dns_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_domains_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Set Schema Version
--

UPDATE `config` SET `value` = '20150727' WHERE name='SCHEMA_VERSION' LIMIT 1;
