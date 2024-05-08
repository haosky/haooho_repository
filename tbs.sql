-- depo.materials definition

CREATE TABLE `materials` (
  `materialId` bigint NOT NULL AUTO_INCREMENT,
  `addedAt` datetime(6) DEFAULT NULL,
  `bindType` tinyint DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `unitPurchasePrice` float DEFAULT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`materialId`),
  CONSTRAINT `materials_chk_1` CHECK ((`bindType` between 0 and 1))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- depo.materialsstore definition

CREATE TABLE `materialsstore` (
  `materialId` bigint NOT NULL AUTO_INCREMENT,
  `addedAt` datetime(6) DEFAULT NULL,
  `currentNum` bigint NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`materialId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- depo.productcategory definition

CREATE TABLE `productcategory` (
  `categoryId` bigint NOT NULL AUTO_INCREMENT,
  `addedAt` datetime(6) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- depo.`user` definition

CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- depo.article definition

CREATE TABLE `article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `addedAt` datetime(6) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `headline` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKph7j3r94s5t048fu5bhh8v1su` (`author_id`),
  CONSTRAINT `FKph7j3r94s5t048fu5bhh8v1su` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- depo.materialsinout definition

CREATE TABLE `materialsinout` (
  `recordId` bigint NOT NULL AUTO_INCREMENT,
  `addedAt` datetime(6) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `materialId` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `num` bigint DEFAULT NULL,
  `recordAt` datetime(6) DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `unitPurchasePrice` float DEFAULT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `finishOrderId` bigint DEFAULT NULL,
  PRIMARY KEY (`recordId`),
  KEY `FK8tob8h51wf33wvt5lij3sh8q8` (`materialId`),
  CONSTRAINT `FK8tob8h51wf33wvt5lij3sh8q8` FOREIGN KEY (`materialId`) REFERENCES `materials` (`materialId`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- depo.product definition

CREATE TABLE `product` (
  `productId` bigint NOT NULL AUTO_INCREMENT,
  `addedAt` datetime(6) DEFAULT NULL,
  `categoryId` bigint DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `skuId` bigint DEFAULT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `FK86s6pp3wbd6tpqi5x133upmrm` (`categoryId`),
  CONSTRAINT `FK86s6pp3wbd6tpqi5x133upmrm` FOREIGN KEY (`categoryId`) REFERENCES `productcategory` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- depo.productfinishorder definition

CREATE TABLE `productfinishorder` (
  `finishOrderId` bigint NOT NULL AUTO_INCREMENT,
  `addedAt` datetime(6) DEFAULT NULL,
  `cancelStatus` tinyint DEFAULT NULL,
  `finishNum` bigint NOT NULL,
  `productId` bigint NOT NULL,
  `recordAt` datetime(6) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `skuId` bigint NOT NULL,
  `skuItemId` bigint NOT NULL,
  PRIMARY KEY (`finishOrderId`),
  KEY `FK8tjwm55imrn91d5fkyhx78ia3` (`productId`),
  CONSTRAINT `FK8tjwm55imrn91d5fkyhx78ia3` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  CONSTRAINT `productfinishorder_chk_1` CHECK ((`cancelStatus` between 0 and 1))
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- depo.sku definition

CREATE TABLE `sku` (
  `skuId` bigint NOT NULL AUTO_INCREMENT,
  `addedAt` datetime(6) DEFAULT NULL,
  `costPrice` float DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `marketPrice` float DEFAULT NULL,
  `maxPrice` float DEFAULT NULL,
  `minPrice` float DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `productId` bigint DEFAULT NULL,
  `profit` float DEFAULT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`skuId`),
  KEY `FK4ilnmwf96d6qbgdayuxccisw7` (`productId`),
  CONSTRAINT `FK4ilnmwf96d6qbgdayuxccisw7` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- depo.skuitems definition

CREATE TABLE `skuitems` (
  `skuItemId` bigint NOT NULL AUTO_INCREMENT,
  `addedAt` datetime(6) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `skuId` bigint DEFAULT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`skuItemId`),
  KEY `FKdswvtpo0aem0gc1mu4madws66` (`skuId`),
  CONSTRAINT `FKdswvtpo0aem0gc1mu4madws66` FOREIGN KEY (`skuId`) REFERENCES `sku` (`skuId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- depo.skucostmaterials definition

CREATE TABLE `skucostmaterials` (
  `costMaterialId` bigint NOT NULL AUTO_INCREMENT,
  `addedAt` datetime(6) DEFAULT NULL,
  `costNum` bigint DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `materialId` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `skuItemId` bigint NOT NULL,
  `unitName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `skuId` bigint NOT NULL,
  `productId` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`costMaterialId`),
  KEY `FKgu61bp4w8iw2fxomti6yn9oo1` (`materialId`),
  KEY `FKoeykhc6qeq28ys3jaqgfvl4ok` (`skuItemId`),
  CONSTRAINT `FKgu61bp4w8iw2fxomti6yn9oo1` FOREIGN KEY (`materialId`) REFERENCES `materials` (`materialId`),
  CONSTRAINT `FKoeykhc6qeq28ys3jaqgfvl4ok` FOREIGN KEY (`skuItemId`) REFERENCES `skuitems` (`skuItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;