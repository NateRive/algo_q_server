package main

import (
	"net/http"

	"github.com/labstack/echo"
)

func NewRouter() *echo.Echo {
	e := echo.New()

	e.GET("/", Handler)
	return e
}

func Handler(c echo.Context) error {
	return c.String(http.StatusOK, "Hello0000")
}

func main() {
	router := NewRouter()

	// Start server
	router.Logger.Fatal(router.Start(":1323"))
}
