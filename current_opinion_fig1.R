# Senthil / UNLV / May 27 2015
# This version includes Coleman et al., YNP samples
library(plyr)
library(reshape2)
library(ggplot2)
mydat <- read.table('current_opinion_fig1_data.csv',
                    head=T, row.names=NULL, sep='\t')
melt_mydat<-melt(mydat)

## Violin plots for YNP, WC, Armenia, Tibet, Tengchong, NZ, Phil,
## Guaymas Bay, GBS samples. Final version:
## http://www.ncbi.nlm.nih.gov/pubmed/26113243

## Some samples are organized by sites, others by region
sitelist <- c('Yellowstone National Park',
              'Great Basin', 'Guaymas Bay')
regionlist <- c('Canada', 'Armenia', 'Tibet', 'China', 'New Zealand',
                 'Philippines')

## Separate x and y axis lines in theme to display axis lines properly
## http://stackoverflow.com/questions/35833307/ggplot2-axis-not-showing-after-using-themeaxis-line-element-linehttp://stackoverflow.com/questions/35833307/ggplot2-axis-not-showing-after-using-themeaxis-line-element-line

for (i in seq(sitelist)){
    dat <- subset(melt_mydat, Site == sitelist[[i]])
    pdffile <- paste(gsub(' ', '_', sitelist[[i]]),
                     '_may27.pdf', sep='')
    pdf(pdffile, width=8, height=5, useDingbats=FALSE)
    (p <- ggplot(dat, aes(x=variable, y=value*100)) +
     geom_violin(aes(fill=factor(variable)), scale='width') +
     geom_boxplot(aes(fill=factor(variable)), width=0.1) +
     scale_fill_manual(values = c('#00C957', '#1E90FF',
                           '#FFA500', '#DC143C')) +
     scale_y_continuous(limits=c(0, 100)) +
     ylab('% Unclassified') +
     stat_summary(fun.y = 'mean', geom = 'point',
                  shape=15, size=4, fill= 'white') +
     coord_flip())

    if (sitelist[[i]] == 'Guaymas Bay'){
        (p <- ggplot(dat, aes(x=variable, y=value*100)) +
         geom_violin(aes(fill=factor(variable)), scale='width') +
         geom_boxplot(aes(fill=factor(variable)), width=0.1) +
         scale_fill_manual(values = c('#00C957', '#1E90FF',
                               '#FFA500', '#DC143C')) +
         ylab('% Unclassified') +
         stat_summary(fun.y = 'mean', geom = 'point',
                      shape=15, size=4, fill= 'white') +
         coord_flip())
    }
    print(p + theme(panel.background=element_blank(),
                    panel.border=element_blank(),
                    panel.grid.minor=element_blank(),
                    panel.grid.major=element_blank(),
		    axis.line.x = element_line(color="black", size=0),
                    axis.line.y = element_line(color="black", size=0),
                    axis.text.x=element_text(size=30, face='bold'),
                    axis.text.y=element_text(size=30, face='bold'),
                    axis.title.x=element_text(size=30, face='bold',
                        vjust=0.2),
                    axis.title.y=element_blank(),
                    legend.position='none'))
    dev.off()
    rm(p)
}

for (i in seq(regionlist)){
    dat <- subset(melt_mydat, Region == regionlist[[i]])
    pdffile <- paste(gsub(' ', '_', regionlist[[i]]),
                     '_may27.pdf', sep='')
    if (regionlist[[i]] == 'China'){
        pdffile <- 'Tengchong_may27.pdf'
    }
    pdf(pdffile, width=8, height=5, useDingbats=FALSE)
    (p <- ggplot(dat, aes(x=variable, y=value*100)) +
     geom_violin(aes(fill=factor(variable)), scale='width') +
     geom_boxplot(aes(fill=factor(variable)), width=0.1) +
     scale_fill_manual(values = c('#00C957', '#1E90FF',
                           '#FFA500', '#DC143C')) +
     scale_y_continuous(limits=c(0, 100)) +
     ylab('% Unclassified') +
     stat_summary(fun.y = 'mean', geom = 'point',
                  shape=15, size=4, fill= 'white') +
     coord_flip())
    
    print(p + theme(panel.background=element_blank(),
                    panel.border=element_blank(),
                    panel.grid.minor=element_blank(),
                    panel.grid.major=element_blank(),
		    axis.line.x = element_line(color="black", size=0),
                    axis.line.y = element_line(color="black", size=0),
                    axis.text.x=element_text(size=30, face='bold'),
                    axis.text.y=element_text(size=30, face='bold'),
                    axis.title.x=element_text(size=30, face='bold',
                        vjust=0.2),
                    axis.title.y=element_blank(),
                    legend.position='none'))
    dev.off()
    rm(p)
}
