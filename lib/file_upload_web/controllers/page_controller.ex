defmodule FileUploadWeb.PageController do
  use FileUploadWeb, :controller
  alias FileUpload.Avatar
  alias FileUpload.Accounts
  alias FileUpload.Accounts.User

  def index(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    img_url = Avatar.url({user.avatar, user}) |> String.replace_prefix("/priv/static", "")
    changeset = User.changeset(%User{})
    render(conn, "index.html", changeset: changeset, img_url: img_url)
  end

  def index(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "index.html", changeset: changeset, img_url: nil)
  end

  def upload(conn, %{"user" => %{"avatar" => avatar_params, "id" => id}}) do
    user = Accounts.get_user!(id)
    Accounts.update_user(user, %{avatar: avatar_params})
    conn
    |> put_flash(:info, "User uploaded successfully.")
    |> redirect(to: Routes.page_path(conn, :index, id: user.id))
  end

end
