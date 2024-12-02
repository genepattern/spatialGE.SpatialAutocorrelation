# Load necessary libraries
library(optparse)
library(spatialGE)

# Define command line options
option_list <- list(
  make_option(c("-i", "--input"), type="character", default=NULL,
              help="Path to the STList RDS object", metavar="character"),
  make_option(c("-g", "--genes"), type="character", default=NULL,
              help="Comma-separated list of gene names to compute statistics", metavar="character"),
  make_option(c("-s", "--samples"), type="character", default=NULL,
              help="Comma-separated list of sample names or indices to compute statistics", metavar="character"),
  make_option(c("-m", "--method"), type="character", default="moran",
              help="Spatial statistic(s) to estimate: 'moran', 'geary', or both", metavar="character"),
  make_option(c("-k", "--neighbors"), type="integer", default=NULL,
              help="Number of neighbors to estimate weights. Use NULL for distance-based method", metavar="integer"),
  make_option(c("-o", "--overwrite"), type="logical", default=FALSE,
              help="Logical indicating if previous statistics should be overwritten", metavar="logical"),
  make_option(c("-c", "--cores"), type="integer", default=NULL,
              help="Number of cores to use during parallelization", metavar="integer"),
  make_option(c("-p", "--plot"), type="logical", default=FALSE,
              help="Logical indicating if intermediate results should be plotted", metavar="logical")
)

# Parse command line options
opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)

# Load the STList object
if (is.null(opt$input)) {
  stop("Please provide the path to the STList RDS object using the -i or --input option.")
}
stlist <- readRDS(opt$input)

# Convert genes and samples from comma-separated strings to vectors
genes <- if (!is.null(opt$genes)) unlist(strsplit(opt$genes, ",")) else NULL
samples <- if (!is.null(opt$samples)) unlist(strsplit(opt$samples, ",")) else NULL

# Run the SThet function
stlist <- SThet(x=stlist, genes=genes, samples=samples, method=opt$method, k=opt$neighbors, overwrite=opt$overwrite, cores=opt$cores)

# Optionally plot intermediate results
if (opt$plot) {
  # Assuming a function plot_intermediate_results exists
  plot_intermediate_results(stlist)
}

# Save the modified STList object
saveRDS(stlist, file="output_stlist.rds")