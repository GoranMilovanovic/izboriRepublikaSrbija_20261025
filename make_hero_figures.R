# Renders the two large-type "hero" cards used at the top of README.md
# (_img/hero_en_v5.png and _img/hero_sr_v5.png). Run from the repository root:
#   Rscript make_hero_figures.R
# Powers of ten are typeset with plotmath (parse = TRUE), not with Unicode
# superscript characters: most fonts lack native glyphs for several of those
# characters and fall back to another font, so "10⁻³⁶" can render as "10⁻³ ⁶".
# The file names carry a version suffix because GitHub caches README images by path.
library(ggplot2)

# lines: list of list(y, label, size, colour, parse, bold, x, hjust)
hero <- function(file, lines) {
  g <- ggplot() + xlim(-1, 1) + ylim(-0.22, 0.95) + theme_void() +
    theme(plot.background = element_rect(fill = "#fcfcfb", colour = NA)) +
    annotate("segment", x = -0.35, xend = 0.35, y = 0.62, yend = 0.62, colour = "#eb6834", linewidth = 1.2)
  for (l in lines)
    g <- g + annotate("text", x = if (is.null(l$x)) 0 else l$x, y = l$y, hjust = if (is.null(l$hjust)) 0.5 else l$hjust, label = l$label, size = l$size, colour = l$colour,
                      fontface = if (isTRUE(l$bold)) "bold" else "plain", parse = isTRUE(l$parse), lineheight = 0.95)
  ggsave(file, g, width = 12, height = 7.2, dpi = 150, bg = "#fcfcfb")
}

ink <- "#0b0b0b"; grey <- "#52514e"; muted <- "#898781"

hero("_img/hero_en_v5.png", list(
  # headline as plain bold text: "2 × 10" plus a hand-placed bold exponent (plotmath cannot do bold Helvetica)
  list(y = 0.76, x = -0.12, label = "2 × 10", size = 44, colour = ink, bold = TRUE),
  list(y = 0.88, x = 0.325, label = "−36", size = 24, colour = ink, bold = TRUE, hjust = 0),
  list(y = 0.47, size = 7.2, colour = ink,
       label = "The probability that a random sample of the people who voted on 25 October 2026\nwould produce a result at least as far from the truth as Ipsos's published numbers."),
  list(y = 0.27, size = 6.2, colour = grey,
       label = "In words: about one in five hundred decillion — a 5 followed by 35 zeros. Computed exactly, not estimated."),
  list(y = 0.17, size = 6.2, colour = grey, parse = TRUE,
       label = "'Even with every assumption chosen in Ipsos\\'s favour, the probability never rises above about '*10^-30*'.'"),
  list(y = 0.02, size = 6.2, colour = grey,
       label = "For scale: picking one specific star in the observable universe and, independently, one specific second"),
  list(y = -0.07, size = 6.2, colour = grey, parse = TRUE,
       label = "'from all the seconds since the last Ice Age ended, is about a 1 in '*4 %*% 10^35*' event — the same odds.'"),
  list(y = -0.19, size = 4.4, colour = muted,
       label = "Exact multinomial test (all 1.57 billion outcomes enumerated), four categories, effective n = 2,110. RIK preliminary results, 31 October 2026.")
))

hero("_img/hero_sr_v5.png", list(
  # headline as plain bold text: "2 × 10" plus a hand-placed bold exponent (plotmath cannot do bold Helvetica)
  list(y = 0.76, x = -0.12, label = "2 × 10", size = 44, colour = ink, bold = TRUE),
  list(y = 0.88, x = 0.325, label = "−36", size = 24, colour = ink, bold = TRUE, hjust = 0),
  list(y = 0.47, size = 7.2, colour = ink,
       label = "Verovatnoća da slučajno izabran uzorak ljudi koji su glasali 25. oktobra 2026.\ndâ rezultat bar toliko udaljen od istine koliko su to bile objavljene brojke Ipsosa."),
  list(y = 0.27, size = 6.2, colour = grey,
       label = "Rečima: otprilike jedan u petsto kvintilijardi — broj 5 sa 35 nula. Izračunato tačno, ne procenjeno."),
  list(y = 0.17, size = 6.2, colour = grey, parse = TRUE,
       label = "'Čak i kad se svaka pretpostavka izabere u korist Ipsosa, verovatnoća ne prelazi oko '*10^-30*'.'"),
  list(y = 0.02, size = 6.2, colour = grey,
       label = "Za osećaj razmere: izvući jednu određenu zvezdu u vidljivom svemiru i, nezavisno od toga, jednu određenu"),
  list(y = -0.07, size = 6.2, colour = grey, parse = TRUE,
       label = "'sekundu od kraja poslednjeg ledenog doba — to je događaj od oko 1 u '*4 %*% 10^35*'. Iste šanse.'"),
  list(y = -0.19, size = 4.4, colour = muted,
       label = "Tačan multinomni test (nabrojano svih 1,57 milijardi ishoda), četiri grupe, stvarna veličina uzorka 2.110. Preliminarni rezultati RIK-a, 31. oktobar 2026.")
))
