defmodule Servy.Plugins do
  require Logger

  alias Servy.Conv

  def rewrite_path(%Conv{path: "/wildlife"} = conv) do
    %{ conv | path: "/wildthings" }
  end

  def rewrite_path(%Conv{path: "/bears?id=" <> id} = conv) do
    %{ conv | path: "/bears/#{id}" }
  end

  def rewrite_path(%Conv{} = conv), do: conv

  def log(%Conv{} = conv) do
    Logger.info inspect(conv)
    conv
  end

  def track(%Conv{status: 404, path: path} = conv) do
    Logger.warn "Warning: #{path} is on the loose! >:]\n"
    conv
  end

  def track(%Conv{} = conv), do: conv

  def emojify(%{ status: 200, response_body: response_body } = conv) do
    %{ conv | response_body: "💩📞👍\n#{response_body}\n🏭🐸😈" }
  end

  def emojify(%Conv{} = conv), do: conv
end
