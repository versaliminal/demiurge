package api

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

// optional code omitted

type Server struct{}

func NewServer() Server {
	return Server{}
}

// (GET /health)
func (Server) Health(ctx *gin.Context, params HealthParams) {
	fmt.Println("Health API called")
	resp := HealthState{}
	ctx.JSON(http.StatusOK, resp)
}
