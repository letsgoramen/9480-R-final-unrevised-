# R setup for test-driven development and package configuration.
#install.packages("")  -> to install packages needed
#library()->Load installed packages

library(testthat) # package for creating unit tests
library(usethis) #provides shortcuts for setting up tests
library(devtools)#provides functions to work with packages easier
library(here) #helps to create a portable project
use_testthat()
