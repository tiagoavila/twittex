defmodule TwittexWeb.ProfileLive do
  use TwittexWeb, :live_view

  import Phoenix.HTML.Tag, only: [img_tag: 2]
  import TwittexWeb.FeedComponents

  alias Twittex.Accounts
  alias Twittex.Feed
  alias Twittex.Feed.Tweek

  on_mount {TwittexWeb.UserAuth, :mount_current_user}

  def mount(%{"username" => username}, _session, socket) do
    user = Accounts.get_user_by_username!(username)
    tweeks = Feed.list_tweeks_for_user(user)
    form = Feed.change_tweek(%Tweek{}) |> to_form
    {:ok, assign(socket, form: form, tweeks: tweeks, user: user)}
  end
end
