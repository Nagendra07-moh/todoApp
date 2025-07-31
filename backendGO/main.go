package main

import (
	"database/sql"
	"fmt"
	"net/http"
	"time"

	_ "github.com/lib/pq"
)

const (
	host     = "localhost"
	port     = 5432
	user     = "postgres"
	password = ""
	dbname   = "learn_go_pg"
)

func main() {
	psqlconn := fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable", host, port, user, password, dbname)
	db, err := sql.Open("postgres", psqlconn)
	if err != nil {
		fmt.Println("This is database connection error", err)
		return
	}
	defer db.Close()
	err = db.Ping()
	if err != nil {
		fmt.Println("Unable to connect to the database", err)
		return
	}

	fmt.Println("✅ Successfully connected to PostgreSQL!")
	createTableSQL := `
	CREATE TABLE IF NOT EXISTS employees (
		id SERIAL PRIMARY KEY,
		name TEXT NOT NULL,
		position TEXT,
		salary NUMERIC
	);`

	_, err = db.Exec(createTableSQL)
	if err != nil {
		fmt.Println("Error creating table", err)
		return
	}

	fmt.Println("✅ Table 'employees' created successfully!")

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, World!")
	})

	http.HandleFunc("/Home", func(w http.ResponseWriter, r *http.Request) {
		time.Sleep(3 * time.Second)
		fmt.Fprintf(w, "Hi!  there welcome to home!")
	})

	fmt.Println("Server is running at http://localhost:8080/")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		fmt.Println(err)
	}
}
