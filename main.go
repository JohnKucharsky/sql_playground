package main

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
	"github.com/joho/godotenv"
	_ "github.com/lib/pq"
	"log"
	"os"
)

type Country struct {
	ID          int     `db:"id"`
	CountryCode string  `db:"country_code"`
	Name        *string `db:"name"`
}

func main() {
	if err := godotenv.Load(); err != nil {
		log.Println("Can't load env")
	}

	ctx := context.Background()

	dbAddress := "postgres://postgres:pass@db:5432/data?sslmode=disable"
	dbAddressEnv := os.Getenv("DB_URL")
	var dbAddressString = dbAddressEnv
	if dbAddressEnv == "" {
		dbAddressString = dbAddress
	}

	conn, err := pgxpool.New(ctx, dbAddressString)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to create connection pool: %v\n", err)
		os.Exit(1)
	}
	defer conn.Close()

	// start
	sql := "select * from countries"

	rows, err := conn.Query(ctx, sql)
	if err != nil {
		fmt.Println("Query error", err.Error())
	}

	countries, err := pgx.CollectRows(rows, pgx.RowToStructByName[Country])

	if err != nil {
		fmt.Println("Collect rows error", err.Error())
	}

	for _, country := range countries {
		//test
		if country.Name != nil {
			fmt.Println(country.CountryCode, country.ID, *country.Name)

		} else {
			fmt.Println(country.CountryCode, country.ID, country.Name)
		}

	}

}
