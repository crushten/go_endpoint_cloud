package main

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

// message represents data about a message post
type message struct {
	ID        string    `json:"id"`
	Message   string    `json:"message"`
	Timestamp time.Time `json:"timestamp"`
}

// message slice to seed data
var messages = []message{
	{ID: "1", Message: "Automate all the things!"},
}

// getMessages responds with list of all the messages as json
func getMessages(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, messages)
}

func getHealthCheck(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, "API is running!")
}

func main() {
	router := gin.Default()
	router.GET("/messages", getMessages)
	router.GET("/healthcheck", getHealthCheck)

	router.Run("localhost:8080")
}
