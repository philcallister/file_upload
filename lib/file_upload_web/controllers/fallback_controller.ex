defmodule FileUploadWeb.FallbackController do
  use FileUploadWeb, :controller
  alias FileUpload.Accounts.User

  def call(conn, {:error, _}) do
    changeset = User.changeset(%User{})
    conn
    |> put_flash(:error, "That was bad.")
    |> put_view(FileUploadWeb.PageView)
    |> render("index.html", changeset: changeset, name: nil, img_url: nil)
  end

  def call(conn, _) do
    changeset = User.changeset(%User{})
    conn
    |> put_flash(:error, "That was WORSE.")
    |> put_view(FileUploadWeb.PageView)
    |> render("index.html", changeset: changeset, name: nil, img_url: nil)
  end

end