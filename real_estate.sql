DROP DATABASE IF EXISTS real_estate;
CREATE DATABASE real_estate;
USE real_estate;

-- Owners table
DROP TABLE IF EXISTS owners;
CREATE TABLE owners (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Row id", 
  first_name VARCHAR(50) NOT NULL COMMENT "User name",
  last_name VARCHAR(50) NOT NULL COMMENT "Last name",
  email VARCHAR(50) NOT NULL UNIQUE COMMENT "e-mail",
  address VARCHAR(100) NOT NULL COMMENT "address",
  phone VARCHAR(30) NOT NULL UNIQUE COMMENT "Cell phone",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Owners";  

-- Apartment types
DROP TABLE IF EXISTS apartment_types;
CREATE TABLE apartment_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Type id", 
  rooms INT UNSIGNED COMMENT "number of rooms",
  square INT UNSIGNED COMMENT "Total square",
  life_square INT UNSIGNED COMMENT "Life square",
  kitchen_square INT UNSIGNED COMMENT "Kitchen square",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Apartment types";

-- Feature types
DROP TABLE IF EXISTS feature_types;
CREATE TABLE feature_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Feature type id", 
  name VARCHAR(50) NOT NULL COMMENT "Type name",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Feature types";

-- Ecology features
DROP TABLE IF EXISTS ecology_features;
CREATE TABLE ecology_features (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Feature id", 
  name VARCHAR(50) NOT NULL COMMENT "Feature name",
  feature_type_id INT UNSIGNED NOT NULL COMMENT "Feature type",
  FOREIGN KEY (feature_type_id) REFERENCES feature_types(id),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Ecology features";

-- Social features
DROP TABLE IF EXISTS social_features;
CREATE TABLE social_features (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Feature id", 
  name VARCHAR(50) NOT NULL COMMENT "Feature name",
  feature_type_id INT UNSIGNED NOT NULL COMMENT "Feature type",
  FOREIGN KEY (feature_type_id) REFERENCES feature_types(id),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Social features";

-- Healthcare features
DROP TABLE IF EXISTS healthcare_features;
CREATE TABLE healthcare_features (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Feature id", 
  name VARCHAR(50) NOT NULL COMMENT "Feature name",
  feature_type_id INT UNSIGNED NOT NULL COMMENT "Feature type",
  FOREIGN KEY (feature_type_id) REFERENCES feature_types(id),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Healthcare feature";

-- Shop features
DROP TABLE IF EXISTS shop_features;
CREATE TABLE shop_features (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Feature id", 
  name VARCHAR(50) NOT NULL COMMENT "Feature name",
  feature_type_id INT UNSIGNED NOT NULL COMMENT "Feature type",
  FOREIGN KEY (feature_type_id) REFERENCES feature_types(id),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Healthcare feature";

-- Ecology
DROP TABLE IF EXISTS ecology;
CREATE TABLE ecology (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Row id", 
  ecology_feature_id INT UNSIGNED NOT NULL COMMENT "Feature id",
  FOREIGN KEY (ecology_feature_id) REFERENCES ecology_features(id),
  value INT UNSIGNED COMMENT "Value",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Ecology";

-- Social
DROP TABLE IF EXISTS social;
CREATE TABLE social (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Row id", 
  social_feature_id INT UNSIGNED NOT NULL COMMENT "Feature id",
  FOREIGN KEY (social_feature_id) REFERENCES social_features(id),
  value INT UNSIGNED COMMENT "Value",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Social";

-- Healthcare
DROP TABLE IF EXISTS healthcare;
CREATE TABLE healthcare (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Row id", 
  healthcare_feature_id INT UNSIGNED NOT NULL COMMENT "Feature id",
  FOREIGN KEY (healthcare_feature_id) REFERENCES healthcare_features(id),
  value INT UNSIGNED COMMENT "Value",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Healthcare";

-- Shops
DROP TABLE IF EXISTS shop;
CREATE TABLE shop (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Row id", 
  shop_feature_id INT UNSIGNED NOT NULL COMMENT "Feature id",
  FOREIGN KEY (shop_feature_id) REFERENCES shop_features(id),
  value INT UNSIGNED COMMENT "Value",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Shops";

-- Environment
DROP TABLE IF EXISTS environment;
CREATE TABLE environment (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Row id", 
  ecology_id INT UNSIGNED NOT NULL COMMENT "Ecology id",
  social_id INT UNSIGNED NOT NULL COMMENT "Social id",
  healthcare_id INT UNSIGNED NOT NULL COMMENT "Healthcare id",
  shop_id INT UNSIGNED NOT NULL COMMENT "Shop id",
  FOREIGN KEY (ecology_id) REFERENCES ecology(id),
  FOREIGN KEY (social_id) REFERENCES social(id),
  FOREIGN KEY (healthcare_id) REFERENCES healthcare(id),
  FOREIGN KEY (shop_id) REFERENCES shop(id),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Environment";

-- Districts
DROP TABLE IF EXISTS districts;
CREATE TABLE districts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "District id", 
  name VARCHAR(50) NOT NULL COMMENT "Feature name",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Districts";

-- Houses
DROP TABLE IF EXISTS houses;
CREATE TABLE houses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "House id",
  district_id INT UNSIGNED NOT NULL COMMENT "District id",
  FOREIGN KEY (district_id) REFERENCES districts(id),
  house_floor INT UNSIGNED COMMENT "House floor",
  house_year INT UNSIGNED NOT NULL COMMENT "House year",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Houses";

-- Apartments
DROP TABLE IF EXISTS apartments;
CREATE TABLE apartments (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Apartment id", 
  house_id INT UNSIGNED NOT NULL COMMENT "House id",
  FOREIGN KEY (house_id) REFERENCES houses(id),
  apartment_type_id INT UNSIGNED NOT NULL COMMENT "Aapartment type",
  FOREIGN KEY (apartment_type_id) REFERENCES apartment_types(id),
  apartment_floor INT UNSIGNED COMMENT "Apartment floor",
  environment_id INT UNSIGNED NOT NULL COMMENT "Environment id",
  FOREIGN KEY (environment_id) REFERENCES environment(id),
  owner_id INT UNSIGNED NOT NULL COMMENT "Owner id",
  FOREIGN KEY (owner_id) REFERENCES owners(id),
  price INT UNSIGNED NOT NULL COMMENT "Price",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Creation time",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Update time"
) COMMENT "Apartments";

