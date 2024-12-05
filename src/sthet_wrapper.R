# Load necessary libraries
library(optparse)
library(spatialGE)

print("=================== start of sthet_wrapper ====================")

# Define command line options
option_list <- list(
  make_option(c("-i", "--input"), type="character", default=NULL,
              help="Path to the STList RDS object", metavar="character"),
  make_option(c("-g", "--genes"), type="character", default=NULL,
              help="Comma-separated list of gene names to compute statistics", metavar="character"),
  make_option(c("-s", "--samples"), type="character", default=NULL,
              help="Comma-separated list of sample names or indices to compute statistics", metavar="character"),
  make_option(c("-O", "--output_filename"), type="character", default=NULL,
              help="Prefix for all output filenames", metavar="character"),
  make_option(c("-m", "--method"), type="character", default="moran",
              help="Spatial statistic(s) to estimate: 'moran', 'geary', or both", metavar="character"),
  make_option(c("-k", "--neighbors"), type="integer", default=NULL,
              help="Number of neighbors to estimate weights. Use NULL for distance-based method", metavar="integer"),
  make_option(c("-o", "--overwrite"), type="logical", default=FALSE,
              help="Logical indicating if previous statistics should be overwritten", metavar="logical"),
  make_option(c("-c", "--cores"), type="integer", default=NULL,
              help="Number of cores to use during parallelization", metavar="integer"),
  make_option(c("--samplemeta"), type="character", default=NULL,
              help="A string indicating the name of the variable in the clinical data frame. If NULL, uses sample names", metavar="character"),
  make_option(c("--color_by"), type="character", default=NULL,
              help="The variable in x@spatial_meta used to color points in the plot. If NULL, each sample is assigned a different color", metavar="character"),
  make_option(c("--categorical"), type="logical", default=TRUE,
              help="Logical indicating whether or not to treat color_by as a categorical variable. Default is TRUE", metavar="logical"),
  make_option(c("--color_pal"), type="character", default=NULL,
              help="A string of a color palette from khroma or RColorBrewer, or a vector with colors with enough elements to plot categories.", metavar="character"),
  make_option(c("--ptsize"), type="double", default=NULL,
              help="A number specifying the size of the points. Passed to the size aesthetic.", metavar="double")

)

print("========= commandline parsed ===========")

# Parse command line options
opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)

# Load the STList object
if (is.null(opt$input)) {
  stop("Please provide the path to the STList RDS object using the -i or --input option.")
}
stlist <- readRDS(opt$input)

print("========== data loaded ===============")

# Convert genes and samples from comma-separated strings to vectors
genes <- if (!is.null(opt$genes)) unlist(strsplit(opt$genes, ",")) else NULL
samples <- if (!is.null(opt$samples)) unlist(strsplit(opt$samples, ",")) else NULL

# Run the SThet function
stlist <- SThet(x=stlist, genes=genes, samples=samples, method=opt$method, k=opt$neighbors, overwrite=opt$overwrite, cores=opt$cores)

print("=========== sthet finished ===============")

plots <- compare_SThet(stlist,
                   samplemeta=opt$samplemeta,
                   color_by=opt$color_by,
                   gene=genes,
                   color_pal=opt$color_pal,
                   ptsize=opt$ptsize)

print("=========== COMPARE_sthet finished ===============")

png_filename <- paste0(opt$output_filename, "_compare_sthet.png" )

png(png_filename)
print(plots)
dev.off()

# Save the modified STList object
rds_filename <- paste0(opt$output_filename, "_sthet.rds" )

saveRDS(stlist, file=rds_filename

print(" ======== DONE ========================")
