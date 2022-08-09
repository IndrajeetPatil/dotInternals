# Free clipart image taken from:
# http://clipart-library.com/clipart/495897.htm
library(hexSticker)
library(magick)
library(showtext)

# Loading Google fonts (http://www.google.com/fonts)
font_add_google("Roboto")

# Automatically use showtext to render text for future devices
showtext_auto()

closet <- image_read("hextools/closet.jpeg")

sticker(
  closet,
  package = "dotInternals",
  p_color	= "black",
  p_family = "Roboto",
  p_size = 40,
  s_x = 1,
  s_y = .75,
  s_width = 1.3,
  s_height = 1,
  filename = "hextools/dotInternals.png",
  h_fill = "white",
  dpi = 600
)
