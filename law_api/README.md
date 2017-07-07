# LawApi

To run app locally:
  * Follow instructions to install Elixir, Erlang, Phoenix, and Postgre
  * Update db connection in config/dev.exs
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

**Connect to api endpoints at [`localhost:4000`](http://localhost:4000/api/v1/) from your browser.**

**Connect to live API at (https://fierce-springs-40228.herokuapp.com/api/v1/)**

# API Routes

*     firm_path       GET     /api/v1/firms
*     firm_path       GET     /api/v1/firms/:id
*     firm_path       POST    /api/v1/firms
*     firm_path       PATCH   /api/v1/firms/:id
*                     PUT     /api/v1/firms/:id
*     firm_path       DELETE  /api/v1/firms/:id
*     lawsuit_path    GET     /api/v1/lawsuits
*     lawsuit_path    GET     /api/v1/lawsuits/:id
*     lawsuit_path    POST    /api/v1/lawsuits
*     lawsuit_path    PATCH   /api/v1/lawsuits/:id
*                     PUT     /api/v1/lawsuits/:id
*     lawsuit_path    DELETE  /api/v1/lawsuits/:id
*     defendant_path  GET     /api/v1/defendants
*     defendant_path  GET     /api/v1/defendants/:id
*     defendant_path  POST    /api/v1/defendants
*     defendant_path  PATCH   /api/v1/defendants/:id
*                     PUT     /api/v1/defendants/:id
*     defendant_path  DELETE  /api/v1/defendants/:id
*     plaintiff_path  GET     /api/v1/plaintiffs
*     plaintiff_path  GET     /api/v1/plaintiffs/:id
*     plaintiff_path  POST    /api/v1/plaintiffs
*     plaintiff_path  PATCH   /api/v1/plaintiffs/:id
*                     PUT     /api/v1/plaintiffs/:id
*     plaintiff_path  DELETE  /api/v1/plaintiffs/:id

# API Documentation

View API Docs at (http://docs.lawapi.apiary.io/#)
