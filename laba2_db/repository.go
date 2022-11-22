package main

import (
  "log"
  "database/sql"
  _ "github.com/mattn/go-sqlite3"
)

func main() {
  CreateDB()
}

func CreateDB() {
  db, err := sql.Open("sqlite3", "products.db")
  if err != nil {
    log.Fatal(err)
  }
  defer db.Close()

  _, err = db.Exec("create table monitors(id integer, name varchar(255) not null, count integer)")

  if err != nil {
    log.Fatal(err)
  }
}
