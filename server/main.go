package main

import (
	"context"
	"log"
	"net/http"

	graphql "github.com/graph-gophers/graphql-go"
	"github.com/graph-gophers/graphql-go/relay"
)

const Schema = `
	schema {
		query: Query
	}
	
	type Query {
		article: Article!
	}

	type Article {
		title: String!
		content: String!
	}
`

type article struct {
	ID      *float64
	Title   string
	Content string
}

var articles = []article{
	{
		Title:   "안녕하세요",
		Content: "내용이에요",
	},
	{
		Title:   "title2",
		Content: "content2",
	},
	{
		Title:   "title3",
		Content: "content3",
	},
}

type Resolver struct {
}

func (r *Resolver) Article(ctx context.Context) (*article, error) {

	return &articles[0], nil
}

func main() {
	opts := []graphql.SchemaOpt{graphql.UseFieldResolvers(), graphql.MaxParallelism(20)}
	schema := graphql.MustParseSchema(Schema, &Resolver{}, opts...)

	http.Handle("/query", &relay.Handler{Schema: schema})

	log.Fatal(http.ListenAndServe(":9011", nil))
}
