class TextsController < ApplicationController

  def create
    response = AngelEvent.receive_text(params)
    render inline: "1"
  end

end