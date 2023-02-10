#http://genoplotr.r-forge.r-project.org/vignette.php
#install and load  genoPlotR

library(genoPlotR)

df1 <- data.frame(name=c("Gene1", "Gene2", "Gene3"), start=c(2, 800, 1050), end=c(600, 1000, 1400), strand=c(-1, 1, -1), col=c("blue", "green", "red"))
dna_seg1 <- dna_seg(df1)

df2 <- data.frame(name=c("Gene1", "Gene2", "Gene3"), start=c(50, 1000, 1200),end=c(900, 1100, 1300), strand=c(-1, 1, 1), col=c("pink", "grey", "red"))
dna_seg2 <- dna_seg(df2)

df3 <- data.frame(name=c("Gene1", "Gene2", "Gene3"), start=c(1900, 2100, 2800), end=c(2000, 2500, 3500), strand=c(-1, -1, 1), col=rep("blue", 3))
dna_seg3 <- dna_seg(df3)

df4 <- data.frame(name=c("Gene1", "Gene2", "Gene3"), start=c(50, 1000, 1200), end=c(900, 1100, 1300), strand=c(-1, 1, 1), col=rep("purple", 3))
dna_seg4 <- dna_seg(df4)

df5 <- data.frame(name=c("Gene1", "Gene2", "Gene3"), start=c(500, 1000, 1900), end=c(900, 1800, 1950), strand=c(-1, -1, -1), col=rep("yellow", 3))
dna_seg5 <- dna_seg(df5)

dna_segs <- list(dna_seg1, dna_seg2, dna_seg3, dna_seg4, dna_seg5)


names <- c("Genome 1", "Genome 2", "Genome 3", "Genome 4", "Genome 5")
names(dna_segs) <- names


df6 <- data.frame(start1=dna_seg1$start, end1=dna_seg1$end, start2=dna_seg2$start, end2=dna_seg2$end, col=c("#67000D", "#08306B", "#ff7b8b"))
comparison1 <- comparison(df6)

df7 <- data.frame(start1=c(50, 800, 200),end1=c(500, 1100, 500), start2=c(1899, 2732,700), end2=c(2034, 2508, 2000), col=c("#006727", "#08306B", "#67000D"))
comparison2 <- comparison(df7)

df8 <- data.frame(start1=c(50, 700, 200),end1=c(2000, 1500, 900), start2=c(1009, 1032, 1100), end2=c(204, 1258, 3000), col=c("#640067", "#08306B", "#67000D"))
comparison3 <- comparison(df8)

df9 <- data.frame(start1=c(50, 700, 900),end1=c(4000, 2000, 700), start2=c(1000, 2000, 800), end2=c(200, 358, 400), col=c("#67000D", "#0d6700", "#08306B"))
comparison4 <- comparison(df9)

comparisons <- list(comparison1, comparison2,comparison3, comparison4)

#comparisons[[1]]$col <- apply_color_scheme(c(0.6, 0.4, 0.5), "grey")
#comparisons[[2]]$col <- apply_color_scheme(c(0.6, 0.4, 0.5), "grey")
#comparisons[[3]]$col <- apply_color_scheme(c(0.6, 0.4, 0.5), "grey")
#comparisons[[4]]$col <- apply_color_scheme(c(0.6, 0.4, 0.5), "grey")

mid_pos <- middle(dna_segs[[1]])
annot <- annotation(x1=c(mid_pos[1], dna_segs[[1]]$end[2]), x2=c(NA, dna_segs[[1]]$end[3]), text=c(dna_segs[[1]]$name[1], "Region1"), rot=c(30, 0), col=c("red", "black"))


plot_gene_map(dna_segs=dna_segs, comparisons=comparisons, annotations=annot, annotation_height=1.3,  main="Comparison of genomes")
