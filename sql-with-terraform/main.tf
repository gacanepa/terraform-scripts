# These two variables should be set in advance inside of terraform.tfvars in the same directory
variable "sql_user" {}
variable "sql_password" {}

# DEVELOPMENT ENV
# MySQL 8.0 database instance
resource "google_sql_database_instance" "mysql-canepa-development-db" {
  database_version = "MYSQL_8_0"
  region           = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}

# MySQL user
resource "google_sql_user" "mysql-development-user" {
  name     = "${var.sql_user}"
  instance = google_sql_database_instance.mysql-canepa-development-db.name
  password = "${var.sql_password}"
}

# PostgreSQL 13 database instance
resource "google_sql_database_instance" "postgres-canepa-development-db" {
  database_version = "POSTGRES_13"
  region           = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}

# User
resource "google_sql_user" "postgres-development-user" {
  name     = "${var.sql_user}"
  instance = google_sql_database_instance.postgres-canepa-development-db.name
  password = "${var.sql_password}"
}
# END OF DEVELOPMENT ENV

# TESTING ENV
# MySQL 8.0 database instance
resource "google_sql_database_instance" "mysql-canepa-integrationtest-db" {
  database_version = "MYSQL_8_0"
  region           = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}

# MySQL user
resource "google_sql_user" "mysql-integrationtest-user" {
  name     = "${var.sql_user}"
  instance = google_sql_database_instance.mysql-canepa-integrationtest-db.name
  password = "${var.sql_password}"
}

# PostgreSQL 13 database instance
resource "google_sql_database_instance" "postgres-canepa-integrationtest-db" {
  database_version = "POSTGRES_13"
  region           = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}

# User
resource "google_sql_user" "postgres-integrationtest-user" {
  name     = "${var.sql_user}"
  instance = google_sql_database_instance.postgres-canepa-integrationtest-db.name
  password = "${var.sql_password}"
}
# END OF TESTING ENV

# QA ENV
# MySQL 8.0 database instance
resource "google_sql_database_instance" "mysql-canepa-qa-db" {
  database_version = "MYSQL_8_0"
  region           = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}

# MySQL user
resource "google_sql_user" "mysql-qa-user" {
  name     = "${var.sql_user}"
  instance = google_sql_database_instance.mysql-canepa-qa-db.name
  password = "${var.sql_password}"
}

# PostgreSQL 13 database instance
resource "google_sql_database_instance" "postgres-canepa-qa-db" {
  database_version = "POSTGRES_13"
  region           = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}

# User
resource "google_sql_user" "postgres-qa-user" {
  name     = "${var.sql_user}"
  instance = google_sql_database_instance.postgres-canepa-qa-db.name
  password = "${var.sql_password}"
}
# END OF QA ENV