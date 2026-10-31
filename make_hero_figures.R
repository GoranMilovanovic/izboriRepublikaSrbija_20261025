# Renders the two large-type "hero" cards used at the top of README.md
# (_img/hero_en_v2.png and _img/hero_sr_v2.png). Run from the repository root:
#   Rscript make_hero_figures.R
# Powers of ten are typeset with plotmath (parse = TRUE), not with Unicode
# superscript characters: most fonts lack native glyphs for several of those
# characters and fall back to another font, so "10⁻³⁷" can render as "10⁻³ ⁷".
library(ggplot2)

# lines: list of list(y, label, size, colour, parse)
hero <- function(file, lines) {
  g <- ggplot() + xlim(-1, 1) + ylim(-0.22, 0.95) + theme_void() +
    theme(plot.background = element_rect(fill = "#fcfcfb", colour = NA)) +
    annotate("segment", x = -0.35, xend = 0.35, y = 0.62, yend = 0.62, colour = "#eb6834", linewidth = 1.2)
  for (l in lines)
    g <- g + annotate("text", x = 0, y = l$y, label = l$label, size = l$size, colour = l$colour,
                      fontface = if (isTRUE(l$bold)) "bold" else "plain", parse = isTRUE(l$parse), lineheight = 0.95)
  ggsave(file, g, width = 12, height = 7.2, dpi = 150, bg = "#fcfcfb")
}

ink <- "#0b0b0b"; grey <- "#52514e"; muted <- "#898781"

hero("_img/hero_en_v2.png", list(
  list(y = 0.78, label = "bold(3 %*% 10^-37)", size = 44, colour = ink, bold = TRUE, parse = TRUE),
  list(y = 0.47, size = 7.2, colour = ink,
       label = "The probability that a random sample of the people who voted on 25 October 2026\nwould produce a result at least as far from the truth as Ipsos's published numbers."),
  list(y = 0.27, size = 6.2, colour = grey,
       label = "In words: about one in three undecillion — a 3 followed by 36 zeros."),
  list(y = 0.17, size = 6.2, colour = grey, parse = TRUE,
       label = "'Even with every assumption chosen in Ipsos\\'s favour, the probability never rises above about '*10^-30*'.'"),
  list(y = 0.02, size = 6.2, colour = grey,
       label = "For scale: picking one specific grain of sand from all the sand on Earth and, independently,"),
  list(y = -0.07, size = 6.2, colour = grey, parse = TRUE,
       label = "'one specific second from all the seconds since the Big Bang, is about a 1 in '*3 %*% 10^36*' event — the same odds.'"),
  list(y = -0.19, size = 4.6, colour = muted,
       label = "Exact multinomial test (importance sampling), four categories, effective n = 2,110. RIK preliminary results, 31 October 2026.")
))

hero("_img/hero_sr_v2.png", list(
  list(y = 0.78, label = "bold(3 %*% 10^-37)", size = 44, colour = ink, bold = TRUE, parse = TRUE),
  list(y = 0.47, size = 7.2, colour = ink,
       label = "Verovatnoća da slučajno izabran uzorak ljudi koji su glasali 25. oktobra 2026.\ndâ rezultat bar toliko udaljen od istine koliko su to bile objavljene brojke Ipsosa."),
  list(y = 0.27, size = 6.2, colour = grey,
       label = "Rečima: otprilike jedan u tri sekstiliona — broj 3 sa 36 nula."),
  list(y = 0.17, size = 6.2, colour = grey, parse = TRUE,
       label = "'Čak i kad se svaka pretpostavka izabere u korist Ipsosa, verovatnoća ne prelazi oko '*10^-30*'.'"),
  list(y = 0.02, size = 6.2, colour = grey,
       label = "Za osećaj razmere: izvući jedno određeno zrno peska od sveg peska na Zemlji i, nezavisno od toga,"),
  list(y = -0.07, size = 6.2, colour = grey, parse = TRUE,
       label = "'jednu određenu sekundu od svih sekundi od Velikog praska — to je događaj od oko 1 u '*3 %*% 10^36*'. Iste šanse.'"),
  list(y = -0.19, size = 4.6, colour = muted,
       label = "Tačan multinomni test (uzorkovanje po važnosti), četiri grupe, stvarna veličina uzorka 2.110. Preliminarni rezultati RIK-a, 31. oktobar 2026.")
))
