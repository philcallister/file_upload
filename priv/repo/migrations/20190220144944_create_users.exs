defmodule FileUpload.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :avatar, :string

      timestamps()
    end

  end
end
