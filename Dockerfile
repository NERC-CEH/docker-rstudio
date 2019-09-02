FROM rocker/rstudio:3.5.3

#For some R packages you need the corresponding development library to successfully install the R package.
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
  libcurl4-openssl-dev \
  mesa-common-dev \
  libcgal-dev \
  libglu1-mesa-dev \
  libx11-dev \
  libxml2-dev \
  gdal-bin \
  libgdal-dev \
  libproj-dev \
  libcairo2-dev \
  libgeos-dev \
  libgeos++-dev \
  libudunits2-dev \
  libpng-dev \
  libnetcdf-dev \
  netcdf-bin \
  libssl-dev \
  libssh2-1-dev \
  libsodium-dev \
  && apt-get clean

# Install Base Packages
RUN R -e "install.packages(c('devtools','dplyr', 'knitr', 'magrittr', 'packrat' ), repos='http://cran.rstudio.com/')"

# Install specific R Packages
RUN R -e "install.packages(c('BH','INLA','FNN','R6','RColorBrewer','RandomFields','RandomFieldsUtils','Rcpp','abind','assertthat','cli','colorspace','crayon','deldir','digest','doParallel','dotCall64','dplyr','fansi','fields','foreach','ggplot2','glue','goftest','gridExtra','gstat','gtable','htmltools','httpuv','intervals','iterators','jsonlite','labeling','later','lazyeval','maps','matrixStats','mime','munsell','pillar','pkgconfig','plogr','plyr','polyclip','promises','purrr','reshape2','rgeos','rlang','scales','shiny','sourcetools','sp','spacetime','spam','spatstat','spatstat.data','spatstat.utils','stringi','stringr','tensor','tibble','tidyselect','utf8','viridis','viridisLite','withr','xtable','xts','zoo'), repos=c(getOption('repos'), INLA='https://inla.r-inla-download.org/R/stable'), dep=TRUE)"

