defmodule TwittexWeb.Layouts do
  use TwittexWeb, :html

  embed_templates "layouts/*"

  attr :href, :string, required: true
  attr :text, :string, required: true
  attr :method, :string, default: "get"
  def navbar_link(assigns) do
    ~H"""
    <.link
      class="mb-2 sm:mb-0 sm:mr-5 text-gray-700 hover:text-gray-500"
      href={@href}
      method={@method}
    >
      <%= @text %>
    </.link>
    """
  end
end
