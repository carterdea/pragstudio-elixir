defmodule Servy.FileHandler do
  def handle_file({:ok, content}, conv) do
    %{ conv | status: 200, response_body: content }
  end

  def handle_file({:error, :enoent}, conv) do
    %{ conv | status: 404, response_body: "File not found." }
  end

  def handle_file({:error, reason}, conv) do
    %{ conv | status: 500, response_body: "File Error: #{reason}" }
  end
end
