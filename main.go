package main

import (
	"net/http"

	"github.com/labstack/echo"
)

// User
type User struct {
	Name  string `json:"name"`
	Comment string `json:"comment"`
}

// Handler
func data(c echo.Context) error {
	u := &User{
		Name:  "Iwase",
		Comment: "Nice to meet you",
	}
	return c.JSON(http.StatusOK, u)
}

func main() {
	// Echo instance
	e := echo.New()

	// Routes
	e.GET("/", data)

	// Start server
	e.Logger.Fatal(e.Start(":1323"))
}