defmodule FileUpload.Accounts.User do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :age, :integer
    field :name, :string
    field :avatar, FileUpload.Avatar.Type

    timestamps()
  end

  @doc false
  def changeset(user, attrs \\ :invalid) do
    user
    |> cast(attrs, [:name, :age])
    |> cast_attachments(attrs, [:avatar])
    |> validate_required([:name, :age])
  end

end
