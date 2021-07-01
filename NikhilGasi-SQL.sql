/*Create a database and tables from DDL Queries file*/

CREATE DATABASE ecommerce;

USE ecommerce;

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
  customer_id int identity (1,1) PRIMARY KEY,
  user_name   varchar(20),
  first_name  varchar(100),
  last_name   varchar(100),
  country     varchar(50),
  town        varchar(50),
  address     varchar(255),
  active      char(1)
);

CREATE TABLE product (
  product_id       int identity (1,1) PRIMARY KEY,
  product_name     varchar(100),
  description      varchar(255),
  price            float,
  mrp              float,
  pieces_per_cASE  float,
  weight_per_piece float,
  uom              varchar(30),
  brand            varchar(100),
  category         varchar(100),
  tax_percent      float,
  active           char(1),
  created_by       varchar(20),
  created_date     datetime DEFAULT GETDATE(),
  updated_by       varchar(20),
  updated_date     datetime DEFAULT GETDATE()
);

CREATE TABLE sales
(
  id             int identity (1,1) PRIMARY KEY,
  transction_id  int,
  bill_no        int,
  bill_date      datetime DEFAULT getdate(),
  bill_location  varchar(30),
  customer_id    int,
  product_id     int,
  qty            int,
  uom            varchar(20),
  price          float,
  gross_price    float,
  tax_pc         float,
  tax_amt        float,
  discount_pc    float,
  discount_amt   float,
  net_bill_amt   float,
  created_by     varchar(20),
  created_date   datetime DEFAULT GETDATE(),
  updated_by     varchar(20),
  updated_date   datetime DEFAULT GETDATE()
  CONSTRAINT fk_product_id FOREIGN KEY(product_id) REFERENCES dbo.product(product_id),
  CONSTRAINT fk_customer_id FOREIGN KEY(customer_id) REFERENCES dbo.customer(customer_id)
);


/*Populate product and customer tables using Manual Queries*/

INSERT INTO dbo.customer([user_name],first_name, last_name, country, town, address, active)
VALUES('jvn_dhl','Jeevan','Dahal','Nepal','','','Y'),
('prm_gtm','Pramod','Gautam','Nepal','','','Y'),
('jwn_nrl','Jiwan','Niroula','Nepal','','','Y'),
('rzn_rai','Raazan','Rai','Nepal','','','Y'),
('tej_prj','Tej','Parajuli','Nepal','','','Y');

INSERT INTO dbo.product(product_name, description, price, mrp, pieces_per_cASE, weight_per_piece, uom, brand, category, tax_percent, active, created_by, created_date, updated_by, updated_date)
VALUES
('LB Act F 85g X 144 Rs 22', 'LB Act F 85g X 144 Rs 22', 16.0303, 22, 144, 85, 'CD', 'LiteBee', 'PW', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('LB Care 85g X 144 Rs 22', 'LB Care 85g X 144 Rs 22', 16.0303, 22, 144, 85, 'CD', 'LiteBee', 'PW', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('LB Deo F 85g X 144 Rs 22', 'LB Deo F 85g X 144 Rs 22', 16.0303, 22, 144, 85, 'CD', 'LiteBee', 'PW', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('LB Red 62g X144 Rs 15', 'LB Red 62g X144 Rs 15', 10.731, 15, 144, 62, 'CD', 'LiteBee', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('LB Red 85g X 144 Rs 22', 'LB Red 85g X 144 Rs 22', 16.0303, 22, 144, 85, 'CD', 'LiteBee', 'PW', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Lorii 75g X 144 Rs 27', 'Lorii 75g X 144 Rs 27', 19.6735, 27, 144, 75, 'CD', 'Lorii', 'PW', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy DFT 100gX100 Rs65 ', 'Pondy DFT 100gX100 Rs65 ', 46.5011, 65, 100, 100, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy DFT 20gX324 Rs12', 'Pondy DFT 20gX324 Rs12', 8.58483, 12, 324, 20, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy DFT 400gX25 Rs225 ', 'Pondy DFT 400gX25 Rs225 ', 160.965, 225, 25, 400, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy DFT 50gX200 Rs35', 'Pondy DFT 50gX200 Rs35', 25.039, 35, 200, 50, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Sandal 100gX72 Rs70', 'Pondy Sandal 100gX72 Rs70', 50.0782, 70, 72, 100, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Sandal 20gX324 Rs12', 'Pondy Sandal 20gX324', 8.03686, 12, 324, 20, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Sandal 300gX25 Rs180', 'Pondy Sandal 300gX25 Rs180', 128.772, 180, 25, 300, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Sandal 50gX144 Rs40', 'Pondy Sandal 50gX144 Rs40', 28.6161, 40, 144, 50, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS SelectB 350mlX24Rs260', 'SS SelectB 350mlX24Rs260', 182.683, 260, 24, 350, 'CD', 'SunShine', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Select HFS350mlX24 Rs260', 'SS Select HFS350mlX24 Rs260', 182.683, 260, 24, 350, 'CD', 'SunShine', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS SelectP350mlX24 Rs260', 'SS SelectP350mlX24 Rs260', 182.683, 260, 24, 350, 'CD', 'SunShine', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vimos Bar 200g X 60 Rs 18', 'Vimos Bar 200g X 60 Rs 18', 12.8773, 18, 60, 200, 'CD', 'Vimos', 'HHC', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CP 180mlX48 Rs 135', 'CP 180mlX48 Rs 135', 96.5792, 135, 48, 180, 'CD', 'Cacti Plus', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CP425X18 Rs290 ofr Rs50 off', 'CP425X18 Rs290 ofr Rs50 off', 171.696, 290, 18, 425, 'CD', 'Cacti Plus', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CP 425ml X 18 Rs 290', 'CP 425ml X 18 Rs 290', 207.467, 290, 18, 425, 'CD', 'Cacti Plus', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('WL L & O 300gX60 Rs 20 new', 'WL L & O 300gX60 Rs 20 new', 14.573, 20, 60, 300, 'CD', 'WhiteSurf', 'FW', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('WL L & O 300gX60 Rs 20  off', 'WL L & O 300gX60 Rs 20  off', 14.573, 20, 60, 300, 'CD', 'WhiteSurf', 'FW', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vimos B a/g 95gx72 Rs10', 'Vimos B a/g 95gx72 Rs10', 7.28651, 10, 72, 95, 'CD', 'Vimos', 'HHC', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL 25gX144 FW ofr Rs65', 'FAL 25gX144 FW ofr Rs65', 46.5011, 65, 144, 25, 'CD', 'Fight and Love', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL MV 25g X 288 Rs 65', 'FAL MV 25g X 288 Rs 65', 46.5011, 65, 288, 25, 'CD', 'Fight and Love', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL 50g x 144 Rs 120', 'FAL 50g x 144 Rs 120', 85.8482, 120, 144, 50, 'CD', 'Fight and Love', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Pink 3.5ml x1680', 'SS Pink 3.5ml x1680', 0.648866, 1, 1680, 3.5, 'CD', 'SunShine', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vasten TM 300mlX40 Rs296', 'Vasten TM 300mlX40 Rs296', 211.759, 296, 40, 300, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Body Silk 300ml', 'DEBE Body Silk 300ml', 214.621, 300, 12, 300, 'CD', 'DEBE', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pears Amber 75g', 'Pears Amber 75g', 36.4325, 0.01, 72, 75, 'CD', 'Pears', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pep Perfect T.Brush', 'Pep Perfect T.Brush', 26.8143, 37, 180, 26, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Pink 100g', 'DEBE BS Bar Pink 100g', 45.905, 63, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Pink 100g Rs65', 'DEBE BS Bar Pink 100g Rs65', 47.3623, 65, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Pink 100g Rs 70', 'DEBE BS Bar Pink 100g Rs 70', 51.0056, 70, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Pink 100g Rs 80', 'DEBE BS Bar Pink 100g Rs 80', 58.2921, 80, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Pink 100g Rs 65', 'DEBE BS Bar Pink 100g Rs 65', 47.3623, 65, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Pink 100g Rs 80', 'DEBE BS Bar Pink 100g Rs 80', 57.2321, 80, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Fresh 100g', 'DEBE BS Bar Fresh 100g', 45.905, 63, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Fresh 100g Rs65', 'DEBE BS Bar Fresh 100g Rs65', 47.3623, 65, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Fresh 100g Rs70', 'DEBE BS Bar Fresh 100g Rs70', 51.0056, 70, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Fresh 100g Rs80', 'DEBE BS Bar Fresh 100g Rs80', 58.2921, 80, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Fresh 100g Rs65', 'DEBE BS Bar Fresh 100g Rs65', 47.3623, 65, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Fresh 100g Rs80', 'DEBE BS Bar Fresh 100g Rs80', 57.2321, 80, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Fresh 100g Rs80New', 'DEBE BS Bar Fresh 100g Rs80New', 57.2321, 80, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Regular100g', 'DEBE BS Bar Regular100g', 45.905, 63, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Regular100g Rs65', 'DEBE BS Bar Regular100g Rs65', 47.3623, 65, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Regular100g Rs 70', 'DEBE BS Bar Regular100g Rs 70', 51.0056, 70, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Regular100g Rs 80', 'DEBE BS Bar Regular100g Rs 80', 58.2921, 80, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Regular100g Rs65', 'DEBE BS Bar Regular100g Rs65', 47.3623, 65, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar Regular100g Rs80', 'DEBE BS Bar Regular100g Rs80', 57.2321, 80, 48, 100, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Body Silk 150ml', 'DEBE Body Silk 150ml', 121.618, 170, 36, 150, 'CD', 'DEBE', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Body Silk 150ml Rs200', 'DEBE Body Silk 150ml Rs200', 143.08, 200, 36, 150, 'CD', 'DEBE', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Body Silk 150ml Rs145', 'DEBE Body Silk 150ml Rs145', 103.733, 145, 36, 150, 'CD', 'DEBE', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CAC 380ml Shampoo Ice', 'CAC 380ml Shampoo Ice', 170.39, 249, 24, 380, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CAC Shampoo 380ml Hair', 'CAC Shampoo 380ml Hair', 170.39, 249, 24, 380, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shampoo DT 200ml', 'DEBE Shampoo DT 200ml', 82.1159, 120, 24, 200, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Dim 150ml - 12pcs', 'Axle Dim 150ml - 12pcs', 133.499, 190, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Dim 150ml - 12pcs Rs 200', 'Axle Dim 150ml - 12pcs Rs 200', 140.525, 200, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Dim 150ml - 12pcs Rs 225', 'Axle Dim 150ml - 12pcs Rs 225', 158.091, 225, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Dim 150ml - 12pcs Rs 230', 'Axle Dim 150ml - 12pcs Rs 230', 161.604, 230, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Pulse  150ml - 12pcs', 'Axle Pulse  150ml - 12pcs', 133.499, 190, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Pulse  150ml - 12pcs Rs 200', 'Axle Pulse  150ml - 12pcs Rs 200', 140.525, 200, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Pulse  150ml - 12pcs Rs 225', 'Axle Pulse  150ml - 12pcs Rs 225', 158.091, 225, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Pulse  150ml - 12pcs Rs 230', 'Axle Pulse  150ml - 12pcs Rs 230', 161.604, 230, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Click 150ml - 12pcs', 'Axle Click 150ml - 12pcs', 133.499, 190, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Click 150ml - 12pcs Rs 200', 'Axle Click 150ml - 12pcs Rs 200', 140.525, 200, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Click 150ml - 12pcs Rs 225', 'Axle Click 150ml - 12pcs Rs 225', 158.091, 225, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Click 150ml - 12pcs Rs 230', 'Axle Click 150ml - 12pcs Rs 230', 161.604, 230, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Vice 150ml - 12pcs', 'Axle Vice 150ml - 12pcs', 133.499, 190, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Vice 150ml - 12pcs Rs 200', 'Axle Vice 150ml - 12pcs Rs 200', 140.525, 200, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Vice 150ml - 12pcs Rs 225', 'Axle Vice 150ml - 12pcs Rs 225', 158.091, 225, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Vice 150ml - 12pcs Rs 230', 'Axle Vice 150ml - 12pcs Rs 230', 161.604, 230, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL Skinclarity 25g 96pc', 'FAL Skinclarity 25g 96pc', 43.719, 60, 96, 25, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL Skinclarity 50g 72pc', 'FAL Skinclarity 50g 72pc', 79.8184, 128, 72, 50, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CAC Shampoo ex str 380ml', 'CAC Shampoo ex str 380ml', 170.39, 249, 24, 380, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CAC Shampoo ex str 200ml', 'CAC Shampoo ex str 200ml', 92.3802, 135, 48, 200, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CAC Shampoo ex str 90ml', 'CAC Shampoo ex str 90ml', 47.2165, 249, 48, 90, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CAC shampoo com soft 380', 'CAC shampoo com soft 380', 170.39, 249, 24, 380, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CAC shampoo com soft 200', 'CAC shampoo com soft 200', 92.3802, 135, 48, 200, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CAC shampoo com soft 90', 'CAC shampoo com soft 90', 47.2165, 249, 48, 90, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CAC shampoo hairfall 200', 'CAC shampoo hairfall 200', 92.3802, 135, 48, 200, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CAC shampoo hairfall 90m', 'CAC shampoo hairfall 90m', 47.2165, 69, 48, 90, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CAC shampoo icecool 200', 'CAC shampoo icecool 200', 92.3802, 135, 48, 200, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Hairfall solution 400', 'SS Hairfall solution 400', 130, 185, 24, 400, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Hair cond DT 180ml', 'DEBE Hair cond DT 180ml', 82.1159, 120, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shampoo 200ml DLT', 'DEBE Shampoo 200ml DLT', 82.1159, 120, 24, 200, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shampoo 700ml DLT', 'DEBE Shampoo 700ml DLT', 245.919, 350, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shampoo 700ml DT', 'DEBE Shampoo 700ml DT', 245.919, 350, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shampoo 700ml IDT', 'DEBE Shampoo 700ml IDT', 245.919, 350, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC 350ml DT', 'DEBE HC 350ml DT', 147.552, 210, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC 350ml IDT', 'DEBE HC 350ml IDT', 147.552, 210, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SunShine Shampo HFS 375ml', 'SunShine Shampo HFS 375ml', 130, 185, 24, 375, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SunShine Cond HFS 350ml', 'SunShine Cond HFS 350ml', 129.986, 185, 24, 350, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Touch 150ml - 12 pc', 'Axle Touch 150ml - 12 pc', 133.499, 190, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Touch 150ml - 12 pc Rs 200', 'Axle Touch 150ml - 12 pc Rs 200', 140.525, 200, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Darktemptation 150m', 'Axle Darktemptation 150m', 133.499, 190, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Dark Temptation 150ml - 12 pc Rs 200', 'Axle Dark Temptation 150ml - 12 pc Rs 200', 140.525, 200, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Dark Temptation 150mlX12 Rs 225', 'Axle Dark Temptation 150mlX12 Rs 225', 158.091, 225, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Dark Temptation 150mlX12 Rs 230', 'Axle Dark Temptation 150mlX12 Rs 230', 161.604, 230, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pep Whitening 190g', 'Pep Whitening 190g', 50.0782, 70, 48, 190, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pep Whitening 190gX48 Rs75', 'Pep Whitening 190gX48 Rs75', 54.6488, 75, 48, 190, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pep Whitening 190gX48 Rs95', 'Pep Whitening 190gX48 Rs95', 69.2218, 95, 48, 190, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pep Whitening 190gX48 Rs110', 'Pep Whitening 190gX48 Rs110', 80.1516, 110, 48, 190, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Summer 150ml', 'Axle Summer 150ml', 133.499, 190, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Summer 150ml Rs 200', 'Axle Summer 150ml Rs 200', 140.525, 200, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Summer 150ml Rs 225', 'Axle Summer 150ml Rs 225', 158.091, 225, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CLEAN UP milkcalcium 160', 'CLEAN UP milkcalcium 160', 57.2321, 80, 48, 160, 'CD', 'CLEAN UP', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CLEAN UP milkcalcium 160X48 Rs85', 'CLEAN UP milkcalcium 160X48 Rs85', 61.9353, 85, 48, 160, 'CD', 'CLEAN UP', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CLEAN UP milkcalcium 160X48 Rs100', 'CLEAN UP milkcalcium 160X48 Rs100', 72.8651, 100, 48, 160, 'CD', 'CLEAN UP', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CLEAN UP milkcalcium 160X48 Rs110', 'CLEAN UP milkcalcium 160X48 Rs110', 80.1516, 110, 48, 160, 'CD', 'CLEAN UP', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pep anticavity 190g', 'Pep anticavity 190g', 50.0782, 70, 48, 190, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pep anticavity 190gX48 Rs75', 'Pep anticavity 190gX48 Rs75', 54.6488, 75, 48, 190, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pep anticavity 190gX48 Rs90', 'Pep anticavity 190gX48 Rs90', 65.5786, 90, 48, 190, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pep anticavity 190gX48 Rs100', 'Pep anticavity 190gX48 Rs100', 72.8651, 100, 48, 190, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('WhiteDent Herbal 120g', 'WhiteDent Herbal 120g', 32.9085, 46, 72, 120, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pep T.Brush T1 fight.med', 'Pep T.Brush T1 fight.med', 17.4876, 25, 180, 26, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC pink smth& mgb180', 'SS HC pink smth& mgb180', 46.4369, 104, 24, 180, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pep T.Brush T1 fight.sof', 'Pep T.Brush T1 fight.sof', 17.4876, 25, 180, 26, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE b wash 375ml exfol', 'DEBE b wash 375ml exfol', 143.081, 200, 24, 375, 'CD', 'DEBE', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE b wash 375ml Fresh', 'DEBE b wash 375ml Fresh', 143.081, 200, 24, 375, 'CD', 'DEBE', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion whitning 200m', 'Vas Lotion whitning 200m', 105.394, 150, 24, 200, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion whitning 200mX24 Rs185', 'Vas Lotion whitning 200mX24 Rs185', 129.986, 185, 24, 200, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion whitning 200mX24 Rs210', 'Vas Lotion whitning 200mX24 Rs210', 150.235, 210, 24, 200, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion whitning 200mX24 Rs215', 'Vas Lotion whitning 200mX24 Rs215', 153.812, 215, 24, 200, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion whitning 200mX24 Rs220', 'Vas Lotion whitning 200mX24 Rs220', 157.388, 220, 24, 200, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion whitning 400m', 'Vas Lotion whitning 400m', 189.71, 270, 12, 400, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion whitning 400mX12 Rs330', 'Vas Lotion whitning 400mX12 Rs330', 231.867, 330, 12, 400, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion whitning 400mX12 Rs370', 'Vas Lotion whitning 400mX12 Rs370', 264.698, 370, 12, 400, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion whitning 400mX12 Rs390', 'Vas Lotion whitning 400mX12 Rs390', 279.007, 390, 12, 400, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion whitning 400mX12 Rs400', 'Vas Lotion whitning 400mX12 Rs400', 286.161, 400, 12, 400, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion AL & CL 200ml', 'Vas Lotion AL & CL 200ml', 84.3151, 120, 24, 200, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion AL & CL 200ml Rs165', 'Vas Lotion AL & CL 200ml Rs165', 115.933, 165, 24, 200, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion AL & CL 400ml', 'Vas Lotion AL & CL 400ml', 158.091, 225, 12, 400, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lotion AL & CL 400ml Rs310', 'Vas Lotion AL & CL 400ml Rs310', 217.814, 310, 12, 400, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Shamp strgt & slk 375', 'SS Shamp strgt & slk 375', 129.986, 185, 24, 375, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Shamp strgt & slk 375 new', 'SS Shamp strgt & slk 375 new', 140.525, 200, 24, 375, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC strgt & slk 350ml', 'SS HC strgt & slk 350ml', 129.986, 185, 24, 350, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC strgt & slk 350ml Rs 200', 'SS HC strgt & slk 350ml Rs 200', 140.525, 200, 24, 350, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC strgtNslk 350mlX24 Rs 230', 'SS HC strgtNslk 350mlX24 Rs 230', 161.604, 230, 24, 350, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 200g', 'Surf Engine 200g', 39.4525, 58, 72, 200, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 500g', 'Surf Engine 500g', 86.9935, 125, 32, 500, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 500g Rs130', 'Surf Engine 500g Rs130', 93.0024, 130, 32, 500, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 500g x 32 Rs 128', 'Surf Engine 500g x 32 Rs 128', 89.1405, 128, 32, 500, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 500g Rs 133', 'Surf Engine 500g Rs 133', 95.1485, 133, 32, 500, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shamp IDT 700', 'DEBE Shamp IDT 700', 245.919, 350, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shamp IDT 700 MRP 375', 'DEBE Shamp IDT 700 MRP 375', 263.485, 375, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shamp DSHT 700', 'DEBE Shamp DSHT 700', 245.919, 350, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shamp DSHT 700 MRP 375', 'DEBE Shamp DSHT 700 MRP 375', 263.485, 375, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shapo DT 700', 'DEBE Shapo DT 700', 231.867, 330, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shapo DT 700 MRP 375', 'DEBE Shapo DT 700 MRP 375', 263.485, 375, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shampoo IDT 175ml', 'DEBE Shampoo IDT 175ml', 82.1159, 120, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shampoo DT 175ml', 'DEBE Shampoo DT 175ml', 82.1159, 120, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shamp DSHT 175', 'DEBE Shamp DSHT 175', 82.1159, 120, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IDT 180ml', 'DEBE HC IDT 180ml', 82.1159, 120, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DT 180', 'DEBE HC DT 180', 82.1159, 120, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DLST 180', 'DEBE HC DLST 180', 82.1159, 120, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Body lotion 100ml', 'Vas Body lotion 100ml', 51.5089, 72, 96, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Body lotion 300ml', 'Vas Body lotion 300ml', 125.911, 176, 40, 300, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Body Silk 300ml', 'DEBE Body Silk 300ml', 214.621, 300, 12, 300, 'CD', 'DEBE', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Body Silk 300ml Rs350', 'DEBE Body Silk 300ml Rs350', 250.39, 350, 12, 300, 'CD', 'DEBE', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Body Silk 300ml Rs400', 'DEBE Body Silk 300ml Rs400', 286.161, 400, 12, 300, 'CD', 'DEBE', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Body Silk 300ml Rs290', 'DEBE Body Silk 300ml Rs290', 207.467, 290, 12, 300, 'CD', 'DEBE', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shamp DSHT 375', 'DEBE Shamp DSHT 375', 143.702, 210, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DSHT 350', 'DEBE HC DSHT 350', 147.552, 210, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Shampoo 375ml IDT', 'DEBE Shampoo 375ml IDT', 143.702, 210, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh 375ml Dry therpy', 'DEBE Sh 375ml Dry therpy', 143.702, 210, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vasten Lipcare 10ml', 'Vasten Lipcare 10ml', 19.3159, 27, 192, 10, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 15g', 'Surf Engine 15g', 2.36675, 5, 720, 15, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Pet Jelly 45g', 'Vas Pet Jelly 45g', 34.3393, 48, 120, 45, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('LB Liquid Total 200ml*24', 'LB Liquid Total 200ml*24', 50.0782, 70, 24, 200, 'CD', 'LiteBee', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('WhiteDent complete 65g', 'WhiteDent complete 65g', 21.462, 30, 144, 65, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('WhiteDent Complete 170g', 'WhiteDent Complete 170g', 50.0782, 70, 48, 170, 'CD', 'WhiteDent', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Shampoo 5ml', 'Clear Shampoo 5ml', 1.06825, 2, 512, 5, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC 350 S&M (P)', 'SS HC 350 S&M (P)', 129.986, 185, 24, 350, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Sh 375 DSf (Y)', 'SS Sh 375 DSf (Y)', 129.986, 185, 24, 375, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Sh 375 DSf_Y_Rs200', 'SS Sh 375 DSf_Y_Rs200', 140.525, 200, 24, 375, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC 180 S&M (P)', 'SS HC 180 S&M (P)', 70.2627, 104, 24, 180, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Sh 375 S&P (S)', 'SS Sh 375 S&P (S)', 129.986, 185, 24, 375, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Sh 375 S&P_S Rs200', 'SS Sh 375 S&P_S Rs200', 140.525, 200, 24, 375, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC 350 S&P (S)', 'SS HC 350 S&P (S)', 129.986, 185, 24, 350, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC 350 S&P_S Rs 200', 'SS HC 350 S&P_S Rs 200', 140.525, 200, 24, 350, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Sh 375 HFS (G)', 'SS Sh 375 HFS (G)', 129.986, 185, 24, 375, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC 350 HFS (G)', 'SS HC 350 HFS (G)', 129.986, 185, 24, 350, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL AM 50gX72 Rs138', 'FAL AM 50gX72 Rs138', 98.7255, 138, 72, 50, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL 50g AM', 'FAL 50g AM', 91.5714, 128, 72, 50, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE IDT Leavon 120X24 Rs250', 'DEBE IDT Leavon 120X24 Rs250', 178.85, 250, 24, 120, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HFS_G_700mlX12 Rs350', 'SS HFS_G_700mlX12 Rs350', 250.39, 350, 12, 700, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HFS_G_700mlX12 Rs375', 'SS HFS_G_700mlX12 Rs375', 268.275, 375, 12, 700, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Stn Blk 700X12 Rs350', 'SS Stn Blk 700X12 Rs350', 250.39, 350, 12, 700, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Stn Blk 700X12 Rs375', 'SS Stn Blk 700X12 Rs375', 268.275, 375, 12, 700, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS St&Mng_P_700X12 Rs350', 'SS St&Mng_P_700X12 Rs350', 250.39, 350, 12, 700, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS St&Mng_P_700X12 Rs375', 'SS St&Mng_P_700X12 Rs375', 268.275, 375, 12, 700, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Str&Per_S_700X12 Rs350', 'SS Str&Per_S_700X12 Rs350', 250.39, 350, 12, 700, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Str&Per_S_700X12 Rs375', 'SS Str&Per_S_700X12 Rs375', 268.275, 375, 12, 700, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Wh. Bty. 25gmX48', 'Pondy Wh. Bty. 25gmX48', 71.7913, 104, 48, 25, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Wh. Bty. 25gmX48 Rs 110', 'Pondy Wh. Bty. 25gmX48 Rs 110', 78.6942, 110, 48, 25, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Wh Bty 25gmX48 Rs115_2 ', 'Pondy Wh Bty 25gmX48 Rs115_2 ', 82.4143, 115.2, 48, 25, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Wh Bty 25gmX48 Rs 115', 'Pondy Wh Bty 25gmX48 Rs 115', 82.2712, 115, 48, 25, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Wh Bty 25gmX48 Rs 132', 'Pondy Wh Bty 25gmX48 Rs 132', 94.4331, 132, 48, 25, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Wh Bty 25gmX48 Rs 128', 'Pondy Wh Bty 25gmX48 Rs 128', 91.73, 128, 48, 25, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Wh. Bty. 25gmX48 Rs 110 R', 'Pondy Wh. Bty. 25gmX48 Rs 110 R', 78.6942, 110, 48, 25, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Wh. Bty. 25gmX48 Rs 110New', 'Pondy Wh. Bty. 25gmX48 Rs 110New', 79.1171, 110, 48, 25, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Wh. Bty. 25gmX48 Rs 110NewR', 'Pondy Wh. Bty. 25gmX48 Rs 110NewR', 78.6942, 110, 48, 25, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Score 150X12', 'Axle Score 150X12', 133.499, 190, 12, 150, 'CD', 'Axle', 'Deo', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Score 150X12 Rs 200', 'Axle Score 150X12 Rs 200', 140.525, 200, 12, 150, 'CD', 'Axle', 'Deo', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Score 150X12 Rs 225', 'Axle Score 150X12 Rs 225', 158.091, 225, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Score 150X12 Rs 230', 'Axle Score 150X12 Rs 230', 161.604, 230, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH H/Def thrpy 400m', 'DEBE SH H/Def thrpy 400m', 143.702, 210, 12, 400, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC H/Def thrpy 400m', 'DEBE HC H/Def thrpy 400m', 143.702, 210, 12, 400, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Dov sh h/def400m mashreq', 'Dov sh h/def400m mashreq', 143.702, 210, 12, 400, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Dov hc h/def400m mashreq', 'Dov hc h/def400m mashreq', 143.702, 210, 12, 400, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CLEAN UP Pepermint 80g', 'CLEAN UP Pepermint 80g', 36.6286, 51.2, 72, 80, 'CD', 'CLEAN UP', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('CLEAN UP Pepermint 150g', 'CLEAN UP Pepermint 150g', 62.9554, 88, 48, 150, 'CD', 'CLEAN UP', 'Oral Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pep T1GD Brush X180 Rs18', 'Pep T1GD Brush X180 Rs18', 13.1157, 18, 180, 15.28, 'CD', 'WhiteDent', 'Oral care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vasten Menz 30g', 'Vasten Menz 30g', 85.8484, 120, 24, 30, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vasten Menz 50g', 'Vasten Menz 50g', 137.351, 192, 16, 50, 'CD', 'Vasten', 'Skin Care', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL 25g AM', 'FAL 25g AM', 52.6536, 73.6, 96, 25, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL 25g AM Rs 80', 'FAL 25g AM Rs 80', 57.2321, 80, 96, 25, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Twist 150X12', 'Axle Twist 150X12', 133.499, 190, 12, 150, 'CD', 'Axle', 'Deo', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Twist 150X12 Rs 200', 'Axle Twist 150X12 Rs 200', 140.525, 200, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Twist 150X12 Rs 225', 'Axle Twist 150X12 Rs 225', 158.091, 225, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Twist 150X12 Rs 230', 'Axle Twist 150X12 Rs 230', 161.604, 230, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Cold Cream 55 gm', 'Pondy Cold Cream 55 gm', 59.5827, 85, 75, 55, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Cold Cream 100 gm', 'Pondy Cold Cream 100 gm', 101.178, 144, 40, 100, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy Cold Cream 8 gm', 'Pondy Cold Cream 8 gm', 7.02627, 10, 576, 8, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vasten Pet Jelly 50 gm', 'Vaseliine Pet Jelly 50 gm', 38.6444, 55, 72, 50, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vasten Pet Jelly 100 gm', 'Vaseliine Pet Jelly 100 gm', 66.7496, 95, 48, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vasten Pet Jelly 250 gm', 'Vaseliine Pet Jelly 250 gm', 119.446, 170, 24, 250, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vasten Pet Jelly 7 gm', 'Vaseliine Pet Jelly 7 gm', 7.02626, 10, 768, 7, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 700 X12', 'DEBE SH IRP 700 X12', 288.077, 410, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 700 X12 Rs 450', 'DEBE SH IRP 700 X12 Rs 450', 316.182, 450, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 700 X12 Rs 490', 'DEBE SH IRP 700 X12 Rs 490', 344.287, 490, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 700 X12 Rs 510', 'DEBE SH IRP 700 X12 Rs 510', 358.34, 510, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 700 X12 Rs 510 New', 'DEBE SH IRP 700 X12 Rs 510 New', 364.855, 510, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DNC 700 X12', 'DEBE SH DNC 700 X12', 288.077, 410, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DNC 700 X12 Rs 450', 'DEBE SH DNC 700 X12 Rs 450', 316.182, 450, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 700 X12', 'DEBE SH DS 700 X12', 288.077, 410, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 700 X12 Rs 450', 'DEBE SH DS 700 X12 Rs 450', 316.182, 450, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 700 X12 Rs 490', 'DEBE SH DS 700 X12 Rs 490', 344.287, 490, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 700 X12 Rs 510', 'DEBE SH DS 700 X12 Rs 510', 358.34, 510, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 700 X12 Rs 510 New', 'DEBE SH DS 700 X12 Rs 510 New', 364.855, 510, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 375X24', 'DEBE SH IRP 375X24', 150.546, 220, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 375X24 Rs 230', 'DEBE SH IRP 375X24 Rs 230', 157.388, 230, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 375X24 Rs250', 'DEBE SH IRP 375X24 Rs250', 160.81, 250, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 375X24 Rs250 New', 'DEBE SH IRP 375X24 Rs250 New', 175.657, 250, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 375X24 Rs260', 'DEBE SH IRP 375X24 Rs260', 182.683, 260, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 375X24 Rs260 New', 'DEBE SH IRP 375X24 Rs260 New', 186.004, 260, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 375X24 Rs280', 'DEBE SH IRP 375X24 Rs280', 200.313, 280, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DNC 375 X24', 'DEBE SH DNC 375 X24', 150.546, 220, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DNC 375 X24 Rs 230', 'DEBE SH DNC 375 X24 Rs 230', 157.388, 230, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 375 X24', 'DEBE SH DS 375 X24', 150.546, 220, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 375 X24 Rs 230', 'DEBE SH DS 375 X24 Rs 230', 157.388, 230, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 375 X24 Rs250', 'DEBE SH DS 375 X24 Rs250', 160.81, 250, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 375 X24 Rs250 New', 'DEBE SH DS 375 X24 Rs250 New', 175.657, 250, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 375 X24 Rs260', 'DEBE SH DS 375 X24 Rs260', 182.683, 260, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 375 X24 Rs260 New', 'DEBE SH DS 375 X24 Rs260 New', 186.004, 260, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 375 X24 Rs280', 'DEBE SH DS 375 X24 Rs280', 200.313, 280, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 175 X24', 'DEBE SH IRP 175 X24', 82.1159, 120, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 175 X24 Rs 130', 'DEBE SH IRP 175 X24 Rs 130', 88.9587, 130, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 175 X24 Rs 140', 'DEBE SH IRP 175 X24 Rs 140', 95.8016, 140, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH IRP 175 X24 Rs 140 New', 'DEBE SH IRP 175 X24 Rs 140 New', 98.3679, 140, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SHP IRP 175X24', 'DEBE SHP IRP 175X24 Rs140', 98.3679, 140, 24, 175, 'CD', 'DEBE', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SHP IRP 175X24 Rs145', 'DEBE SHP IRP 175X24 Rs145', 101.881, 145, 24, 175, 'CD', 'DEBE', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SHP IRP 175X24 Rs145 R', 'DEBE SHP IRP 175X24 Rs145 R', 103.733, 145, 24, 175, 'CD', 'DEBE', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SHP IRP 175X24 Rs155', 'DEBE SHP IRP 175X24 Rs155', 110.887, 155, 24, 175, 'CD', 'DEBE', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DNC 175 X24', 'DEBE SH DNC 175 X24', 82.1159, 120, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DNC 175 X24 Rs 130', 'DEBE SH DNC 175 X24 Rs 130', 88.9587, 130, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DNC 175 X24 Rs 140 ', 'DEBE SH DNC 175 X24 Rs 140 ', 98.3679, 140, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 175 X24', 'DEBE SH DS 175 X24', 82.1159, 120, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 175 X24 Rs 130', 'DEBE SH DS 175 X24 Rs 130', 88.9587, 130, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 175 X24 Rs 140', 'DEBE SH DS 175 X24 Rs 140', 95.8016, 140, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 175 X24 Rs 140 New', 'DEBE SH DS 175 X24 Rs 140 New', 98.3679, 140, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 175 X24 Rs 145', 'DEBE SH DS 175 X24 Rs 145', 101.881, 145, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 175 X24 Rs 145 New', 'DEBE SH DS 175 X24 Rs 145 New', 103.733, 145, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE SH DS 175 X24 Rs 155', 'DEBE SH DS 175 X24 Rs 155', 110.887, 155, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 350X24', 'DEBE HC IRP 350X24', 153.967, 225, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 350X24 Rs 250', 'DEBE HC IRP 350X24 Rs 250', 171.074, 250, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 350X24 Rs 280', 'DEBE HC IRP 350X24 Rs 280', 191.603, 280, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 350X24 Rs 280 New', 'DEBE HC IRP 350X24 Rs 280 New', 196.736, 280, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 350X24 Rs 280 N', 'DEBE HC IRP 350X24 Rs 280 N', 200.313, 280, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 350X24 Rs 300', 'DEBE HC IRP 350X24 Rs 300', 214.621, 300, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DNC 350X24', 'DEBE HC DNC 350X24', 153.967, 225, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DNC 350X24 Rs 250', 'DEBE HC DNC 350X24 Rs 250', 171.074, 250, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 350X24', 'DEBE HC DS 350X24', 153.967, 225, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 350X24 Rs 250', 'DEBE HC DS 350X24 Rs 250', 171.074, 250, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 350X24 Rs 280', 'DEBE HC DS 350X24 Rs 280', 191.603, 280, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 350X24 Rs 280 New', 'DEBE HC DS 350X24 Rs 280 New', 196.736, 280, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 350X24 Rs 280 N', 'DEBE HC DS 350X24 Rs 280 N', 200.313, 280, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 350X24 Rs 300', 'DEBE HC DS 350X24 Rs 300', 214.621, 300, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 180X24', 'DEBE HC IRP 180X24', 85.5373, 125, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 180X24 Rs 145', 'DEBE HC IRP 180X24 Rs 145', 99.223, 145, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 180X24 Rs 160', 'DEBE HC IRP 180X24 Rs 160', 109.488, 160, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 180X24 Rs 175', 'DEBE HC IRP 180X24 Rs 175', 119.752, 175, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 180X24 Rs 175 New', 'DEBE HC IRP 180X24 Rs 175 New', 122.96, 175, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 180X24 Rs 175 N', 'DEBE HC IRP 180X24 Rs 175 N', 125.195, 175, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 180X24 Rs210', 'DEBE HC IRP 180X24 Rs210', 150.235, 210, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC IRP 180X24 Rs 220', 'DEBE HC IRP 180X24 Rs 220', 157.388, 220, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DNC 180X24', 'DEBE HC DNC 180X24', 85.5373, 125, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DNC 180X24 Rs 145', 'DEBE HC DNC 180X24 Rs 145', 99.223, 145, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 180X24', 'DEBE HC DS 180X24', 85.5373, 125, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 180X24 Rs 145', 'DEBE HC DS 180X24 Rs 145', 99.223, 145, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 180X24 Rs 160', 'DEBE HC DS 180X24 Rs 160', 109.488, 160, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 180X24 Rs 160 New', 'DEBE HC DS 180X24 Rs 160 New', 112.42, 160, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 180X24 Rs 175', 'DEBE HC DS 180X24 Rs 175', 122.96, 175, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 180X24 Rs 175 New', 'DEBE HC DS 180X24 Rs 175 New', 125.195, 175, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 180X24 Rs 210', 'DEBE HC DS 180X24 Rs 210', 150.235, 210, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC DS 180X24 Rs 220', 'DEBE HC DS 180X24 Rs 220', 157.388, 220, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lot ALCL 50X24', 'Vas Lot ALCL 50X24', 24.5921, 35, 24, 50, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lot ALCL 100X24', 'Vas Lot ALCL 100X24', 45.6706, 65, 24, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lot ALCL 100X24 Rs88', 'Vas Lot ALCL 100X24 Rs88', 61.8313, 88, 24, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lot ALCL 100X24 Rs88 New', 'Vas Lot ALCL 100X24 Rs88 New', 62.9556, 88, 24, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lot ALCL 100X24 Rs100', 'Vas Lot ALCL 100X24 Rs100', 71.5401, 100, 24, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lot ALCL 100X24 Rs104', 'Vas Lot ALCL 100X24 Rs104', 74.402, 104, 24, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lot Whit 100X24', 'Vas Lot Whit 100X24', 56.2103, 80, 24, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lot Whit 100X24 Rs88', 'Vas Lot Whit 100X24 Rs88', 61.8313, 88, 24, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lot Whit 100X24 Rs95', 'Vas Lot Whit 100X24 Rs95', 66.7496, 95, 24, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lot Whit 100X24 Rs105', 'Vas Lot Whit 100X24 Rs105', 75.1171, 105, 24, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lot Whit 100X24 Rs110', 'Vas Lot Whit 100X24 Rs110', 78.694, 110, 24, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lot Whit 100X24 Rs120', 'Vas Lot Whit 100X24 Rs120', 85.8484, 120, 24, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC HFS (G) 180mlX24', 'SS HC HFS (G) 180mlX24', 70.2627, 100, 24, 180, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC TnL (P) 180mlX24', 'SS HC TnL (P) 180mlX24', 70.2627, 100, 24, 180, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Provoke 150mlX12', 'Axle Provoke 150mlX12', 140.525, 200, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Provoke 150mlX12 Rs225', 'Axle Provoke 150mlX12 Rs225', 158.091, 225, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Axle Provoke 150mlX12 Rs230', 'Axle Provoke 150mlX12 Rs230', 161.604, 230, 12, 150, 'CD', 'Axle', 'Deo', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS SH Drm Sft 350mlX24', 'SS SH Drm Sft 350mlX24', 140.525, 200, 24, 350, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC HFS 7mlX768', 'SS HC HFS 7mlX768', 1.29537, 2, 768, 7, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC HFS 90mlX48', 'SS HC HFS 90mlX48', 35.77, 50, 48, 90, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('LB HW Refill 180mlX24', 'LB HW Refill 180mlX24', 35.7702, 50, 24, 180, 'CD', 'LiteBee', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear SH AHF 350mlX24', 'Clear SH AHF 350mlX24', 174.954, 249, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC S&M_P_350mlX24', 'SS HC S&M_P_350mlX24', 140.525, 200, 24, 350, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC SnM_P_350mlX24 Rs 230', 'SS HC SnM_P_350mlX24 Rs 230', 161.604, 230, 24, 350, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC HFS_G_350mlX24', 'SS HC HFS_G_350mlX24', 140.525, 200, 24, 350, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC HFS_G_350mlX24 Rs 230', 'SS HC HFS_G_350mlX24 Rs 230', 161.604, 230, 24, 350, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC S&M_P_160mlX24', 'SS HC S&M_P_160mlX24', 70.2627, 100, 24, 160, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss H&S Veg 43gX48', 'Knoss H&S Veg 43gX48', 35.77, 50, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss H&S Veg 43g Rs56', 'Knoss H&S Veg 43g Rs56', 40.0625, 56, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss H&S Veg 43g Rs60', 'Knoss H&S Veg 43g Rs60', 42.9242, 60, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss H&S Veg 43g Rs75', 'Knoss H&S Veg 43g Rs60', 53.6552, 75, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss Mix Veg 54gX48', 'Knoss Mix Veg 54gX48', 35.77, 50, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss Mix Veg 54g Rs56', 'Knoss Mix Veg 54g Rs56', 40.0625, 56, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss Mix Veg 54g Rs60', 'Knoss Mix Veg 54g Rs60', 42.9242, 60, 48, 54, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss Mix Veg 54g Rs62', 'Knoss Mix Veg 54g Rs62', 44.355, 62, 48, 54, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss Mix Veg 54g Rs75', 'Knoss Mix Veg 54g Rs75', 53.6552, 75, 48, 54, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss SwtCrn Ckn 46gX48', 'Knoss SwtCrn Ckn 46gX48', 35.77, 50, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss SwtCrn Ckn 46g Rs56', 'Knoss SwtCrn Ckn 46g Rs56', 40.0625, 56, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss SwtCrn Ckn 46g Rs60', 'Knoss SwtCrn Ckn 46g Rs60', 42.9242, 60, 48, 46, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss SwtCrn Ckn 46g Rs75', 'Knoss SwtCrn Ckn 46g Rs60', 53.6552, 75, 48, 46, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss SwtCrn Veg 47gX48', 'Knoss SwtCrn Veg 47gX48', 35.77, 50, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss SwtCrn Veg 47g Rs56', 'Knoss SwtCrn Veg 47g Rs56', 40.0625, 56, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss SwtCrn Veg 47g Rs75', 'Knoss SwtCrn Veg 47g Rs75', 53.6552, 75, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss Chickn Dlt 51gX48', 'Knoss Chickn Dlt 51gX48', 35.77, 50, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss Chickn Dlt 51g Rs56', 'Knoss Chickn Dlt 51g Rs56', 40.0625, 56, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss Chickn Dlt 51g Rs60', 'Knoss Chickn Dlt 51g Rs60', 42.9242, 60, 48, 51, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss Chickn Dlt 51g Rs62', 'Knoss Chickn Dlt 51g Rs62', 44.355, 62, 48, 51, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss Chickn Dlt 51g Rs75', 'Knoss Chickn Dlt 51g Rs62', 53.6552, 75, 48, 51, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss CrmyMshrm 50gX48', 'Knoss CrmyMshrm 50gX48', 35.77, 50, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss CrmyMshrm 50g Rs56', 'Knoss CrmyMshrm 50g Rs56', 40.0625, 56, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss CrmyMshrm 50g Rs60', 'Knoss CrmyMshrm 50g Rs60', 42.9242, 60, 48, 50, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss CrmyMshrm 50g Rs75', 'Knoss CrmyMshrm 50g Rs75', 53.6552, 75, 48, 50, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss ThkTomato 55gX48', 'Knoss ThkTomato 55gX48', 35.77, 50, 48, 43, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear SH CSC2in1 350X24', 'Clear SH CSC2in1 350X24', 174.954, 249, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear SH CSC2in1 350X24 Rs275', 'Clear SH CSC2in1 350X24 Rs275', 193.222, 275, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear SH CSC2in1 350X24 Rs300', 'Clear SH CSC2in1 350X24 Rs300', 210.788, 300, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear SH CSC2in1 350X24 Rs300 New', 'Clear SH CSC2in1 350X24 Rs300 New', 214.621, 300, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear SH CSC2in1 350X24 Rs330', 'Clear SH CSC2in1 350X24 Rs330', 236.083, 330, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh EXS 350X24', 'Clear Sh EXS 350X24', 174.954, 249, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh EXS 350X24 Rs275', 'Clear Sh EXS 350X24 Rs275', 174.954, 275, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh EXS 350X24 Rs275 Revised', 'Clear Sh EXS 350X24 Rs275 Revised', 193.222, 275, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh EXS 350X24 Rs300', 'Clear Sh EXS 350X24 Rs300', 210.788, 300, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh EXS 350X24 Rs300 New', 'Clear Sh EXS 350X24 Rs300 New', 214.621, 300, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh EXS 350X24 Rs330', 'Clear Sh EXS 350X24 Rs330', 236.083, 330, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh EXS 180X48', 'Clear Sh EXS 180X48', 94.8546, 135, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh EXS 180X48 Rs150', 'Clear Sh EXS 180X48 Rs150', 105.394, 150, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh EXS 180X48 Rs160', 'Clear Sh EXS 180X48 Rs160', 112.42, 160, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh EXS 180X48 Rs160 New', 'Clear Sh EXS 180X48 Rs160 New', 114.464, 160, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh AHF 180X48', 'Clear Sh AHF 180X48', 94.8546, 135, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh AHF 180X48 Rs150', 'Clear Sh AHF 180X48 Rs150', 105.394, 150, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh AHF 180X48 Rs160', 'Clear Sh AHF 180X48 Rs160', 112.42, 160, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh AHF 180X48 Rs160 New', 'Clear Sh AHF 180X48 Rs160 New', 114.464, 160, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh CSC 180X48', 'Clear Sh CSC 180X48', 94.8546, 135, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh CSC 180X48 Rs150', 'Clear Sh CSC 180X48 Rs150', 105.394, 150, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh CSC 180X48 Rs160', 'Clear Sh CSC 180X48 Rs160', 112.42, 160, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh CSC 180X48 Rs160 New', 'Clear Sh CSC 180X48 Rs160 New', 114.464, 160, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy WB 50X48', 'Pondy WB 50X48', 171.696, 240, 48, 50, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy WB 50X48 Rs 265', 'Pondy WB 50X48 Rs 265', 189.582, 265, 48, 50, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS DrmSfSmt_Y_ 700X12 Rs350', 'SS DrmSfSmt_Y_ 700X12 Rs350', 250.39, 350, 12, 700, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS DrmSfSmt_Y_ 700X12 Rs375', 'SS DrmSfSmt_Y_ 700X12 Rs375', 268.275, 375, 12, 700, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS DrmSfSmt_Y_ 700X12 Rs390', 'SS DrmSfSmt_Y_ 700X12 Rs390', 279.007, 390, 12, 700, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL AM 50g X 72 Rs 144', 'FAL AM 50g X 72 Rs 144', 103.018, 144, 72, 50, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL AM 50g X 72 Rs 158', 'FAL AM 50g X 72 Rs 158', 113.033, 158, 72, 50, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vasten HW 40ml X 48', 'Vasten HW 40ml X 48', 31.6183, 45, 24, 40, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vasten HW 40ml X 48 revised', 'Vasten HW 40ml X 48 revised', 31.6183, 45, 48, 40, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pears Soap GS 125g x48', 'Pears Soap GS 125g x48', 58.2921, 80, 48, 125, 'CD', 'Pears', 'PW', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pears Soap GS 125*48', 'Pears Soap GS 125*48', 61.9353, 85, 48, 125, 'CD', 'Pears', 'PW', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pears Soap Oil clr125X48', 'Pears Soap Oil clr125X48', 58.2921, 80, 48, 125, 'CD', 'Pears', 'PW', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pears Soap Oil clr125*48', 'Pears Soap Oil clr125*48', 61.9353, 85, 48, 125, 'CD', 'Pears', 'PW', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pears Soap Amber 125X48', 'Pears Soap Amber 125X48', 58.2921, 80, 48, 125, 'CD', 'Pears', 'PW', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pears Soap Amber 125*48', 'Pears Soap Amber 125*48', 61.9353, 85, 48, 125, 'CD', 'Pears', 'PW', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy G Radin DC 25mlX12', 'Pondy G Radin DC 25mlX12', 572.321, 800, 12, 25, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy G Radin DC 25mlX12 Rs500', 'Pondy G Radin DC 25mlX12 Rs500', 357.701, 500, 12, 25, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy G Radin DC 50mlX12', 'Pondy G Radin DC 50mlX12', 915.714, 1280, 12, 50, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy G Radin DC 50mlX12 Rs800', 'Pondy G Radin DC 50mlX12 Rs800', 572.321, 800, 12, 50, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy FOAM P white 100gX24', 'Pondy FOAM P white 100gX24', 143.081, 200, 24, 100, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy P White FW 50gX48', 'Pondy P White FW 50gX48', 85.8482, 120, 48, 50, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy AMCell DC25x12', 'Pondy AMCell DC25x12', 343.393, 480, 12, 25, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy AMCell DC50x12', 'Pondy AMCell DC50x12', 500.781, 700, 12, 50, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy AMCell DC50*12', 'Pondy AMCell DC50*12', 522.244, 730, 12, 50, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy AMCell DayCrm50*12', 'Pondy AMCell DayCrm50*12', 522.281, 730, 12, 50, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('P Flaw WVL DayCrean 50gX12', 'P Flaw WVL DayCrean 50gX12', 572.321, 800, 12, 50, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('P Dly Reg FAC FOAM 100gX24', 'P Dly Reg FAC FOAM 100gX24', 343.393, 480, 24, 100, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('P Radin NgtRep Crm 50gX12', 'P Radin NgtRep Crm 50gX12', 500.781, 700, 12, 50, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('P Radin NgtRep Crm 50gX12 RS730', 'P Radin NgtRep Crm 50gX12 RS730', 522.244, 730, 12, 50, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC SM&Mng 160ml', 'SS HC SM&Mng 160ml', 70.2627, 100, 24, 160, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC SMnMng 160mlX24 Rs 120', 'SS HC SMnMng 160mlX24 Rs 120', 84.3151, 120, 24, 160, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC SMnMng 160ml Rs130', 'SS HC SMnMng 160ml Rs130', 91.3417, 130, 24, 160, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC SMnMng 160ml Rs140', 'SS HC SMnMng 160ml Rs140', 98.3679, 140, 24, 160, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC SMnMng 160ml Rs130 New', 'SS HC SMnMng 160ml Rs130 New', 93.0024, 130, 24, 160, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC SMnMng 160ml Rs150', 'SS HC SMnMng 160ml Rs150', 107.31, 150, 24, 160, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh AHF COSMO 350', 'Clear Sh AHF COSMO 350', 174.954, 249, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh AHF COSMO 350 Rs275', 'Clear Sh AHF COSMO 350 Rs275', 193.222, 275, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh AHF COSMO 350 Rs300', 'Clear Sh AHF COSMO 350 Rs300', 210.788, 300, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh AHF COSMO 350 Rs300 New', 'Clear Sh AHF COSMO 350 Rs300 New', 214.621, 300, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear Sh AHF COSMO 350 Rs330', 'Clear Sh AHF COSMO 350 Rs330', 236.083, 330, 24, 350, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear MENSh HFMcos350', 'Clear MENSh HFMcos350', 201.868, 295, 24, 350, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear MENSh HFMcos350X24 Rs295', 'Clear MENSh HFMcos350X24 Rs295', 207.275, 295, 24, 350, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear MENSh HFMcos350X24 Rs300', 'Clear MENSh HFMcos350X24 Rs300', 210.788, 300, 24, 350, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear MENSh HFMcos350X24 Rs300 New', 'Clear MENSh HFMcos350X24 Rs300 New', 214.621, 300, 24, 350, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear MENSh HFMcos350X24 Rs330', 'Clear MENSh HFMcos350X24 Rs330', 236.083, 330, 24, 350, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('VTM 100ml', 'VTM 100ml', 61.8312, 88, 96, 100, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Green Bold 300 Rs350', 'DEBE BS Green Bold 300 Rs350', 250.39, 350, 12, 300, 'CD', 'DEBE', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Green Bold 300 Rs400', 'DEBE BS Green Bold 300 Rs400', 286.161, 400, 12, 300, 'CD', 'DEBE', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Green Bold 300 Rs290', 'DEBE BS Green Bold 300 Rs290', 207.467, 290, 12, 300, 'CD', 'DEBE', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL Winter F_cream 25g', 'FAL Winter F_cream 25g', 32.1931, 45, 144, 25, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL Winter F_cream 25g Rs67', 'FAL Winter F_cream 25g Rs67', 47.9319, 67, 144, 25, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL Winter F_cream 25g Rs60', 'FAL Winter F_cream 25g Rs60', 42.9241, 60, 144, 25, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL Winter F_cream 50g', 'FAL Winter F_cream 50g', 64.3861, 80, 72, 50, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL Winter F_cream 50g Rs121', 'FAL Winter F_cream 50g Rs121', 86.5636, 121, 72, 50, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL Winter F_cream 50g Rs105', 'FAL Winter F_cream 50g Rs105', 75.1172, 105, 72, 50, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL Winter F_cream 50g Rs115', 'FAL Winter F_cream 50g Rs115', 82.2712, 115, 72, 50, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL Winter F_cream 50g Rs130', 'FAL Winter F_cream 50g Rs130', 93.0023, 130, 72, 50, 'CD', 'Fight and Love', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('VTM 300ml', 'VTM 300ml', 144.741, 206, 40, 300, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('VTM 300mlX40 Rs232', 'VTM 300mlX40 Rs232', 163.01, 232, 40, 300, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('PCC 55ml x 75', 'PCC 55ml x 75', 64.0796, 91.2, 75, 55, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('PCC 55ml x 75 Rs96', 'PCC 55ml x 75 Rs96', 67.4522, 96, 75, 55, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('PCC 55ml x 75 Rs96 New', 'PCC 55ml x 75 Rs96 New', 68.6786, 96, 75, 55, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('PCC 55ml x 75 Rs104', 'PCC 55ml x 75 Rs104', 74.4018, 104, 75, 55, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('PCC 100ml x 40', 'PCC 100ml x 40', 106.799, 152, 40, 100, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('PCC 100ml x 40 Rs158', 'PCC 100ml x 40 Rs158', 111.015, 158, 40, 100, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('PCC 100ml x 40 Rs176', 'PCC 100ml x 40 Rs176', 125.911, 176, 40, 100, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lip Care 10ml X 192', 'Vas Lip Care 10ml X 192', 21.4621, 30, 192, 10, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lip Care 10ml X 192 Rs35', 'Vas Lip Care 10ml X 192 Rs35', 25.0391, 35, 192, 10, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lip Care 10ml X 192 Rs50', 'Vas Lip Care 10ml X 192 Rs50', 35.7701, 50, 192, 10, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar 75gX48', 'DEBE BS Bar 75gX48', 40.0758, 55, 48, 75, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar 75gX48 Rs60', 'DEBE BS Bar 75gX48 Rs60', 43.719, 60, 48, 75, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE BS Bar 75gX48 Rs70', 'DEBE BS Bar 75gX48 Rs70', 50.0782, 70, 48, 75, 'CD', 'DEBE', 'Pw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear MENSh CSMcos350', 'Clear MENSh CSMcos350', 201.868, 295, 24, 350, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear MENSh CSMcos350X24 Rs295', 'Clear MENSh CSMcos350X24 Rs295', 207.275, 295, 24, 350, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear MENSh CSMcos350X24 Rs300', 'Clear MENSh CSMcos350X24 Rs300', 210.788, 300, 24, 350, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear MENSh CSMcos350X24 Rs300 New', 'Clear MENSh CSMcos350X24 Rs300 New', 214.621, 300, 24, 350, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Clear MENSh CSMcos350X24 Rs330', 'Clear MENSh CSMcos350X24 Rs330', 236.083, 330, 24, 350, 'CD', 'CLEAR', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss Chickn Dlt 51gX48 Rs75', 'Knoss Chickn Dlt 51gX48 Rs75', 53.6552, 75, 48, 50, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Knoss ThickToma55gX48 Rs75', 'Knoss ThickToma55gX48 Rs75', 53.6552, 75, 48, 50, 'CD', 'Knoss', 'Food', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('ClearMen ShHFM180x48', 'ClearMen ShHFM180x48', 119.447, 170, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('ClearMen ShHFM180x48 Rs 180', 'ClearMen ShHFM180x48 Rs 180', 126.473, 180, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('ClearMen ShHFM180x48 Rs 180 New', 'ClearMen ShHFM180x48 Rs 180 New', 128.772, 180, 48, 180, 'CD', 'CLEAR', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 1kg', 'Surf Engine 1kg', 193.092, 265, 16, 1000, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 1kg Rs272', 'Surf Engine 1kg Rs272', 198.193, 272, 16, 1000, 'CD', 'Surf Engine', 'Fw', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 1kgX16 Rs280', 'Surf Engine 1kgX16 Rs280', 204.022, 280, 16, 1000, 'CD', 'Surf Engine', 'Fw', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 1kgX16 Rs285', 'Surf Engine 1kgX16 Rs285', 207.665, 285, 16, 1000, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 1kgX16 Rs291', 'Surf Engine 1kgX16 Rs291', 212.037, 291, 16, 1000, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 3kg', 'Surf Engine 3kg', 539.2, 740, 4, 3000, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 3kgX4 Revised', 'Surf Engine 3kgX4 Revised', 448.848, 616, 4, 3000, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 500gX32', 'Surf Engine 500gX32', 95.1485, 133, 32, 500, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 500gX32 Rs135', 'Surf Engine 500gX32 Rs135', 96.5792, 135, 32, 500, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Surf Engine 500gX32 Rs140', 'Surf Engine 500gX32 Rs140', 100.156, 140, 32, 500, 'CD', 'Surf Engine', 'Fw', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 175x24', 'DEBE Sh NOC 175x24', 88.9587, 130, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 175x24 Rs140', 'DEBE Sh NOC 175x24 Rs140', 95.8016, 140, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 175x24 Rs140 New', 'DEBE Sh NOC 175x24 Rs140 New', 98.3679, 140, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'N', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 175x24 Rs145', 'DEBE Sh NOC 175x24 Rs145', 101.881, 145, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 175x24 Rs145 New', 'DEBE Sh NOC 175x24 Rs145 New', 103.733, 145, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 175x24 Rs155', 'DEBE Sh NOC 175x24 Rs155', 110.887, 155, 24, 175, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 375x24', 'DEBE Sh NOC 375x24', 157.388, 230, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 375x24 Rs250', 'DEBE Sh NOC 375x24 Rs250', 160.81, 250, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 375x24 Rs250 New', 'DEBE Sh NOC 375x24 Rs250 New', 175.657, 250, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 375x24 Rs260', 'DEBE Sh NOC 375x24 Rs260', 182.683, 260, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 375x24 Rs260 New', 'DEBE Sh NOC 375x24 Rs260 New', 186.004, 260, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 375x24 Rs280', 'DEBE Sh NOC 375x24 Rs280', 200.313, 280, 24, 375, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 700x12', 'DEBE Sh NOC 700x12', 316.182, 450, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 700x12 Rs490', 'DEBE Sh NOC 700x12 Rs490', 335.306, 490, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 700x12 Rs490 New', 'DEBE Sh NOC 700x12 Rs490 New', 344.287, 490, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 700x12 Rs510', 'DEBE Sh NOC 700x12 Rs510', 358.34, 510, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE Sh NOC 700x12 Rs510 New', 'DEBE Sh NOC 700x12 Rs510 New', 364.855, 510, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 180x24', 'DEBE HC NOC 180x24', 99.223, 145, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 180x24 Rs 160', 'DEBE HC NOC 180x24 Rs 160', 109.488, 160, 24, 180, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 350x24', 'DEBE HC NOC 350x24', 171.074, 250, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 350x24 Rs280', 'DEBE HC NOC 350x24 Rs280', 191.603, 280, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 350x24 Rs280 New', 'DEBE HC NOC 350x24 Rs280 New', 196.736, 280, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 350x24 Rs325', 'DEBE HC NOC 350x24 Rs325', 228.354, 325, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 350x24 Rs325 New', 'DEBE HC NOC 350x24 Rs325 New', 232.506, 325, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 350x24 Rs300', 'DEBE HC NOC 350x24 Rs300', 214.621, 300, 24, 350, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 700x12 Rs 450', 'DEBE HC NOC 700x12 Rs 450', 307.934, 450, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 700x12 Rs 480', 'DEBE HC NOC 700x12 Rs 480', 328.463, 480, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 700x12 Rs 530', 'DEBE HC NOC 700x12 Rs 530', 362.678, 530, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 700x12 Rs 530 New', 'DEBE HC NOC 700x12 Rs 530 New', 372.392, 530, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 700x12 Rs 550', 'DEBE HC NOC 700x12 Rs 550', 386.444, 550, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 700x12 Rs 550 New', 'DEBE HC NOC 700x12 Rs 550 New', 393.471, 550, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC NOC 700x12 Rs 510', 'DEBE HC NOC 700x12 Rs 510', 364.855, 510, 12, 700, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy AM Cell DC10gX12', 'Pondy AM Cell DC10gX12', 114.464, 160, 12, 10, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy AM Cell DC10gX36', 'Pondy AM Cell DC10gX36', 38.1548, 160, 36, 10, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Pondy AMCell FF 100gX12', 'Pondy AMCell FF 100gX12', 343.393, 480, 12, 100, 'CD', 'Pondy', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('FAL MV Tiffany 9gmX576 Imported', 'FAL MV Tiffany 9gmX576 Imported', 6.8879, 10, 576, 9, 'CD', 'Fight and Love', 'Skin care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC HFSn 320x24', 'SS HC HFSn 320x24', 161.604, 230, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC HFSn 320x24 Rs250', 'SS HC HFSn 320x24 Rs250', 175.657, 250, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC HFSn 320x24 Rs275', 'SS HC HFSn 320x24 Rs275', 193.222, 275, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC HFSn 320x24 Rs250 New', 'SS HC HFSn 320x24 Rs250 New', 178.85, 250, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC HFSn 320x24 Rs270', 'SS HC HFSn 320x24 Rs270', 193.158, 270, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Sh NOURSSM 320x24', 'SS Sh NOURSSM 320x24', 140.525, 200, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Sh NOURSSM 320x24 Rs220', 'SS Sh NOURSSM 320x24 Rs220', 154.578, 220, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Sh NOURSSM 320x24 Rs220 New', 'SS Sh NOURSSM 320x24 Rs220 New', 157.388, 220, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Sh NOURSSM 320x24 Rs240', 'SS Sh NOURSSM 320x24 Rs240', 171.696, 240, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Sh SM&Mng 320X24', 'SS Sh SM&Mng 320X24', 140.525, 200, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Sh SMNG(P) 320X24', 'SS Sh SMNG(P) 320X24 Rs 220', 154.578, 220, 24, 320, 'CD', 'SunShine', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS Sh SMNG(P) 320X24 Rs 220 New', 'SS Sh SMNG(P) 320X24 Rs 220 New', 157.388, 220, 24, 320, 'CD', 'SunShine', 'Hair care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('VPJ 60gX72', 'VPJ 60gX72', 60.8091, 85, 72, 60, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('VPJ 60gX72 Rs90', 'VPJ 60gX72 Rs90', 64.3861, 90, 72, 60, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('VPJ 120gX48', 'VPJ 120gX48', 91.3415, 130, 48, 120, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('VPJ 120gX48 Rs135', 'VPJ 120gX48 Rs135', 96.5792, 135, 48, 120, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('VPJ 120gX48 Rs140', 'VPJ 120gX48 Rs140', 100.156, 140, 48, 120, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('VPJ 120gX48 Rs135', 'VPJ 120gX48 Rs135', 96.5792, 135, 48, 120, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('VPJ 240gX24', 'VPJ 240gX24', 158.091, 225, 24, 240, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('VPJ 240gX24 Rs235', 'VPJ 240gX24 Rs235', 168.119, 235, 24, 240, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC NOURSSM 160X24', 'SS HC NOURSSM 160X24', 84.3151, 120, 24, 160, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC NOURSSM 160X24 Rs130', 'SS HC NOURSSM 160X24 Rs130', 91.3417, 130, 24, 160, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC NOURSSM 160X24 Rs140', 'SS HC NOURSSM 160X24 Rs140', 98.3679, 140, 24, 160, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC NOURSSM 160X24 Rs130 New', 'SS HC NOURSSM 160X24 Rs130 New', 93.0024, 130, 24, 160, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC NOURSSM 160X24 Rs150', 'SS HC NOURSSM 160X24 Rs150', 107.31, 150, 24, 160, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC NOURSSM 320X24', 'SS HC NOURSSM 320X24', 161.604, 230, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC NOURSSM 320X24 Rs250', 'SS HC NOURSSM 320X24 Rs250', 175.657, 250, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC NOURSSM 320X24 Rs275', 'SS HC NOURSSM 320X24 Rs275', 193.222, 275, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC NOURSSM 320X24 Rs250 New', 'SS HC NOURSSM 320X24 Rs250 New', 178.85, 250, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC NOURSSM 320X24 Rs270', 'SS HC NOURSSM 320X24 Rs270', 193.158, 270, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('PWB 50gX12 Rs400', 'PWB 50gX12 Rs400', 286.161, 400, 12, 50, 'CD', 'Pondy', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC 7_5mlX512 Rs4', 'DEBE HC 7_5mlX512 Rs4', 2.9146, 4, 512, 7.5, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('DEBE HC 7_5mlX512 Rs6', 'DEBE HC 7_5mlX512 Rs6', 4.37189, 6, 512, 7.5, 'CD', 'DEBE', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('Vas Lot Whit 10mlx144', 'Vas Lot Whit 10mlx144', 7.15403, 10, 144, 10, 'CD', 'Vasten', 'Skin Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC SMnMng 320X24 Rs230', 'SS HC SMnMng 320X24 Rs230', 161.604, 230, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC SMnMng 320X24 Rs250', 'SS HC SMnMng 320X24 Rs250', 175.657, 250, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC SMnMng 320X24 Rs275', 'SS HC SMnMng 320X24 Rs275', 193.222, 275, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC SMnMng 320X24 Rs250 New', 'SS HC SMnMng 320X24 Rs250 New', 178.85, 250, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC SMnMng 320X24 Rs2570', 'SS HC SMnMng 320X24 Rs2570', 193.158, 270, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC SMnMng 320X24 Rs270', 'SS HC SMnMng 320X24 Rs270', 193.158, 270, 24, 320, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00'),
('SS HC HFS 7_5X384', 'SS HC HFS 7_5X384', 2.18596, 3, 384, 7.5, 'CD', 'SunShine', 'Hair Care', 13, 'Y', 'manis', '2017-08-08 00:00:00', 'manis', '2017-08-08 00:00:00');


/*Populate sales table using sales.csv file*/

BULK INSERT dbo.sales
FROM 'G:\QA\SQL session\sales.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR ='\n'
);

select * from customer;

select * from sales;


/*Select all products with brand �Cacti Plus�*/

select * from product
where brand='Cacti Plus';


/*Count of total products with product category=�Skin Care�*/

select count(*) 'Skin Care'from product
where category='Skin Care';


/*Count of total products with MRP more than 100*/

select count (*) 'MRP>100'from product
where mrp>100;


/*Count of total products with product category=�Skin Care� and MRP more than 100*/

select count (*) 'Skincare and MRP' from product
where category ='Skin Care' and mrp>100;


/*Brandwise product count*/

select product.brand, count (product.product_id)
from product group by brand;


/*Brandwise as well as Active/Inactive Status wise product count*/

select product.brand, sum(case when active='Y' then 1 else 0 end) as active,
sum(case when active='N' then 1 else 0 end) as inactive, count(*) as totals
from product group by brand;


/*Display all columns with Product category in Skin Care or Hair Care*/

select * from product
where category='Skin Care' or category='Hair Care';


/*Display all columns with Product category in Skin Care or Hair Care, and MRP more than 100*/

select * from product
where (category='Skin Care' or category='Hair Care') and mrp>100;


/*Display   all   columns   with   Product   category=�Skin   Care�   and
Brand=�Pondy�, and MRP more than 100*/

select * from product
where category='Skin Care' and brand='Pondy' and mrp>100;


/*Display   all   columns   with   Product   category   =�Skin   Care�   or
Brand=�Pondy�, and more than 100*/

select * from product
where (category='Skin Care' or brand='Pondy') and mrp>100;


/*Display all product names only with names starting from letter P*/

select product_name from product
where product_name like 'P%';


/*Display  all product  names only with names Having letters �Bar�  in Between*/

select product_name from product
where product_name like '%Bar%';


/*Sales of those products which have been sold in more than two quantity in a bill*/
select * from sales;

select * from sales
where qty>2;


/*Sales of those products which have been sold in more than two quantity throughout the bill*/

select product_id, sum(qty) Quantity from sales
group by product_id having sum(qty)>2;


/*Create a new table with columns username and birthday, and dump data from dates file. Convert it to .csv format if required.
Research on Date Function Queries from the slide*/

create table dates(
    name varchar(20),
	birthdate date
);

BULK INSERT dbo.dates
FROM 'G:\QA\SQL session\dates.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR ='\n'
);

select * from dates;

/*no of people sharing Birth date*/

select count(birthdate) as Sameday from dates where birthdate in (
select birthdate from dates group by birthdate
having Count (birthdate)>1
);


/*no of people sharing Birth month*/

select count(*) as Total, datename(month, birthdate) as MonthName from dates
 group by datename(month, birthdate);


/*no of people sharing Weekday*/

SELECT count(name) as Total, datename(weekday, datepart(weekday, birthdate)) as Weekday from dates
group by datepart(weekday, birthdate);


/*Find the current age of all people*/

select *, datediff(year, birthdate, getdate()) age from dates;
