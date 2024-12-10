# FROM r-base:4.3.2
FROM 	genepattern/spatialgp.preprocessing:0.6

#Install Moffitt's CA certificates
#RUN apt-get update -qq && \
#    apt-get upgrade -y && \
#    apt-get clean all && \
#    apt-get install -y --no-install-recommends \
#        ca-certificates locales wget libcurl4-openssl-dev libxml2-dev libssl-dev && \
#    apt-get clean && \
#    apt-get purge && \
#    rm -rf /var/lib/apt/lists/* 

#Install required system libraries
#RUN apt-get -y update && apt-get -y install libhdf5-dev libudunits2-dev libv8-dev libgdal-dev cmake libfftw3-dev libfontconfig1-dev libcurl4-openssl-dev libglpk-dev libgsl-dev libmagick++-dev

#RUN mkdir /spatialGE
WORKDIR /spatialGE

#RUN Rscript -e "install.packages(c('systemfonts', 'ggforce', 'ggpubr', 'BiocManager', 'msigdbr', 'rgeos', 'hdf5r', 'remotes', 'openxlsx', 'svglite', 'rdist', 'magick', 'ggtext', 'lsa', 'uwot', 'ggplot2', 'dplyr', 'stringr'))"
#RUN Rscript -e "BiocManager::install(c('EBImage', 'ComplexHeatmap', 'SpatialDecon', 'sparseMatrixStats', 'SummarizedExperiment', 'SingleCellExperiment'), update = TRUE, ask = FALSE)"
#RUN Rscript -e "remotes::install_github(c('JEFworks-Lab/STdeconvolve', 'Nanostring-Biostats/InSituType', 'FridleyLab/spatialGE'))"
#RUN Rscript -e "install.packages(c('getopt'))"
#RUN Rscript -e "install.packages(c('optparse'))"

#RUN apt update -y && \
#    apt upgrade -y && \
#    apt install -y libcurl4-openssl-dev && \
#    apt-get install -y libbz2-dev liblzma-dev

#RUN Rscript -e "install.packages(c('spatstat', 'devtools', 'janitor', 'tidyverse'))"
#RUN Rscript -e "devtools::install_github('FridleyLab/mIFsim@v0.1.3.3')"
COPY src/sthet_wrapper.R /spatialGE/
