CREATE DATABASE "modelagem_ecommerce"

CREATE TABLE users (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"e-mail" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"adress" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE products (
	"id" serial NOT NULL,
	"name" varchar(150) NOT NULL UNIQUE,
	"price" int NOT NULL,
	"imageUrl" TEXT NOT NULL,
	"categoryId" int NOT NULL,
	"sizeId" int NOT NULL,
	"avaiable" BOOLEAN NOT NULL,
	"stock" int NOT NULL,
	"colorId" int NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "productImages" (
	"id" serial NOT NULL,
	"productId" int NOT NULL,
	"imageUrl" TEXT,
	CONSTRAINT "productImages_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE category (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE sizes (
	"id" serial NOT NULL,
	"size" TEXT NOT NULL UNIQUE,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE color (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "color_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE purchases (
	"id" serial NOT NULL,
	"userId" int NOT NULL,
	"productId" int NOT NULL,
	"quantity" int NOT NULL,
	"statusId" int NOT NULL,
	"purchaseDate" DATE NOT NULL,
	"userAdress" DATE NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE status (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "status_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "category"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("sizeId") REFERENCES "sizes"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("colorId") REFERENCES "color"("id");

ALTER TABLE "productImages" ADD CONSTRAINT "productImages_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("statusId") REFERENCES "status"("id");










