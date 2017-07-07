defmodule LawApi.Router do
  use LawApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  #scope updated to version API
  scope "/api/v1", LawApi do
    pipe_through :api

      #using resources to avoid manually setting up each verb route, not needed here
      resources "/firms", FirmController, except: [:new, :edit]
      resources "/lawsuits", LawsuitController, except: [:new, :edit]
      resources "/defendants", DefendantController, except: [:new, :edit]
      resources "/plaintiffs", PlaintiffController, except: [:new, :edit]
    
  end
end
