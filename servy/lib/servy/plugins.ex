defmodule Servy.Plugins do
  require Logger

  def rewrite_path(%{path: "/wildlife"} = conv) do
    %{ conv | path: "/wildthings" }
  end

  def rewrite_path(%{path: "/bears?id=" <> id} = conv) do
    %{ conv | path: "/bears/#{id}" }
  end

  def rewrite_path(conv), do: conv

  def log(conv) do
    Logger.info inspect(conv)
    conv
  end

  def track(%{status: 404, path: path} = conv) do
    Logger.warn "Warning: #{path} is on the loose! >:]\n"
    conv
  end

  def track(conv), do: conv

  def emojify(%{ status: 200, response_body: response_body } = conv) do
    %{ conv | response_body: "💩📞👍\n#{response_body}\n🏭🐸😈" }
  end

  def emojify(conv), do: conv
end
