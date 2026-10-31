# Renders the two large-type "hero" cards used at the top of README.md
# (_img/hero_en.png and _img/hero_sr.png). Run from the repository root:
#   Rscript make_hero_figures.R
library(ggplot2)

hero <- function(file, headline, line1, line2, line3, foot) {
  g <- ggplot() +
    annotate("text", x = 0, y = 0.78, label = headline, size = 44, fontface = "bold", colour = "#0b0b0b") +
    annotate("text", x = 0, y = 0.47, label = line1, size = 7.2, colour = "#0b0b0b", lineheight = 0.95) +
    annotate("text", x = 0, y = 0.22, label = line2, size = 6.2, colour = "#52514e", lineheight = 0.95) +
    annotate("text", x = 0, y = 0.02, label = line3, size = 6.2, colour = "#52514e", lineheight = 0.95) +
    annotate("text", x = 0, y = -0.16, label = foot, size = 4.6, colour = "#898781", lineheight = 0.95) +
    annotate("segment", x = -0.35, xend = 0.35, y = 0.62, yend = 0.62, colour = "#eb6834", linewidth = 1.2) +
    xlim(-1, 1) + ylim(-0.22, 0.95) +
    theme_void() +
    theme(plot.background = element_rect(fill = "#fcfcfb", colour = NA))
  ggsave(file, g, width = 12, height = 7.2, dpi = 150, bg = "#fcfcfb")
}

hero("_img/hero_en.png",
     headline = "3 × 10⁻³⁷",
     line1 = "The probability that a random sample of the people who voted on 25 October 2026\nwould produce a result at least as far from the truth as Ipsos's published numbers.",
     line2 = "In words: about one in three undecillion — a 3 followed by 36 zeros.\nEven with every assumption chosen in Ipsos's favour, the probability never rises above about 10⁻³⁰.",
     line3 = "For scale: picking one specific grain of sand from all the sand on Earth and, independently,\none specific second from all the seconds since the Big Bang, is about a 1 in 3 × 10³⁶ event — the same odds.",
     foot = "Exact multinomial test (importance sampling), four categories, effective n = 2,110. RIK preliminary results, 31 October 2026.")

hero("_img/hero_sr.png",
     headline = "3 × 10⁻³⁷",
     line1 = "Verovatnoća da slučajno izabran uzorak ljudi koji su glasali 25. oktobra 2026.\ndâ rezultat bar toliko udaljen od istine koliko su to bile objavljene brojke Ipsosa.",
     line2 = "Rečima: otprilike jedan u tri sekstiliona — broj 3 sa 36 nula.\nČak i kad se svaka pretpostavka izabere u korist Ipsosa, verovatnoća ne prelazi oko 10⁻³⁰.",
     line3 = "Za osećaj razmere: izvući jedno određeno zrno peska od sveg peska na Zemlji i, nezavisno od toga,\njednu određenu sekundu od svih sekundi od Velikog praska — to je događaj od oko 1 u 3 × 10³⁶. Iste šanse.",
     foot = "Tačan multinomni test (uzorkovanje po važnosti), četiri grupe, stvarna veličina uzorka 2.110. Preliminarni rezultati RIK-a, 31. oktobar 2026.")
