module ApplicationHelper
  def copyright_generator
    OlindosViewTool::Renderer.copyright 'Yaroslav Mohutin', 'All rights reserved'
  end
end
