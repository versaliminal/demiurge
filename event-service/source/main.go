package main

import (
	"demiurge/event-service/api"
	_ "embed"
	"fmt"

	"github.com/gin-gonic/gin"
)

func main() {
	fmt.Println("Starting event-service")
	router := gin.Default()
	server := api.NewServer()
	api.RegisterHandlers(router, server)
	router.Run()
}
