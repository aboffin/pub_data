# pub_data 

Programs, scripts used to generate figures in published work.  To run
the R script that generated the violin plots used in Figure 1 of
http://www.ncbi.nlm.nih.gov/pubmed/26113243, install R packages
'plyr', 'reshape2' and 'ggplot2 '.


## Download script and data file

## Install R packages

$ sudo R

## Inside R command-line prompt
> install.packages('plyr') ## similarly install 'reshape2' and 'ggplot2'

## quit R
> q()

## Back in Linux terminal, run the script

$ R CMD BATCH current_opinion_fig1.R
