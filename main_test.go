package main

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

// Setup sn instance of Gin router.
func SetUpRouter() *gin.Engine {
	gin.SetMode(gin.ReleaseMode)
	router := gin.Default()

	return router
}

func TestMessage(t *testing.T) {
	t.Parallel()

	router := SetUpRouter()
	router.GET("/messages", getMessages)

	req, _ := http.NewRequest(http.MethodGet, "/messages", nil)

	write := httptest.NewRecorder()
	router.ServeHTTP(write, req)

	var messages []message
	err := json.Unmarshal(write.Body.Bytes(), &messages)

	if err != nil {
		panic(err)
	}

	assert.Equal(t, http.StatusOK, write.Code)
	assert.NotEmpty(t, messages)
}

func TestHealthCheck(t *testing.T) {
	t.Parallel()

	router := SetUpRouter()
	router.GET("/healthcheck", getHealthCheck)

	req, _ := http.NewRequest(http.MethodGet, "/healthcheck", nil)

	write := httptest.NewRecorder()
	router.ServeHTTP(write, req)

	assert.Equal(t, http.StatusOK, write.Code)
	assert.NotEmpty(t, "API is running!")
}
