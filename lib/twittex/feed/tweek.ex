defmodule Twittex.Feed.Tweek do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweeks" do
    field :content, :string
    belongs_to :user, Twittex.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(tweek, attrs) do
    tweek
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
