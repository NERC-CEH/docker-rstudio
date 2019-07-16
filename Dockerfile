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
  && apt-get clean

RUN R -e "install.packages(c('devtools','dplyr', 'knitr', 'magrittr', 'packrat' ), repos='http://cran.rstudio.com/')"

