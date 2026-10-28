###### Volcano_Plot

CA_import$expression = ifelse(CA_import$pvalue < 0.01 & abs(CA_import$log2FoldChange) >= 0.5, 
                                   ifelse(CA_import$log2FoldChange> 0.5 ,'Up','Down'),
                             'NA')
head(CA_import)
library(ggplot2)
plot_ca <- ggplot(data = CA_import, 
                  aes(x = log2FoldChange, 
                      y = -log10(CA_import$pvalue), 
                      colour=expression,
                      label = CA_import$gene_id)) +
  geom_text_repel(label = CA_import$gene_id)+
  geom_point(alpha=0.4, size=3.5) +
  scale_color_manual(values=c("grey", "grey","grey"))+
  xlim(c(-4.5, 4.5)) +
  ylim(c(0,30)) +
  geom_vline(xintercept=c(-1,1),lty=4,col="black",lwd=0.8) +
  geom_hline(yintercept = 1.301,lty=4,col="black",lwd=0.8) +
  labs(x="log2(fold change)",
       y="-log10 (adj.p-value)",
       title="Control_AT")  +
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5), 
        legend.position="right", 
        legend.title = element_blank())
plot_ca
