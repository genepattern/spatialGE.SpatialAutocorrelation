**Spatial Autocorrelation Analysis Tool**
=====================================

**Description**
---------------

This tool performs spatial autocorrelation analysis on bioinformatics data using the Moran and Geary statistics. It provides a flexible and customizable way to compute and visualize spatial autocorrelation statistics for a given set of genes and samples.

**Module Details**
-----------------

* **Authors**: Edwin Huang
* **Categories**: sthet
* **Source Repo**: https://github.com/FridleyLab/spatialGE
* **Contact**: [edh021@cloud.ucsd.edu](mailto:edh021@cloud.ucsd.edu)

**Input Files**
---------------

* **Input RDS Object**: RDS (R Data Storage)
	+ Description: The input RDS object containing the bioinformatics data.

**Output Files**
----------------

* **Spatial Autocorrelation Statistics**: A list of spatial autocorrelation statistics for the specified genes and samples.
* **Plot of Intermediate Results**: A plot of the intermediate results, if the `-p` option is specified.

**Parameters**
--------------

| Name | Description | Default Value | Type |
| --- | --- | --- | --- |
| `-i`, `--input` | Input RDS object | NULL | Character |
| `-g`, `--genes` | Vector of gene names | NULL | Character |
| `-s`, `--samples` | List of sample names | NULL | Character |
| `-m`, `--method` | Spatial statistic(s) to estimate | "moran" | Character |
| `-k`, `--knn` | Number of neighbors | NULL | Integer |
| `-o`, `--overwrite` | Overwrite previous statistics | FALSE | Logical |
| `-c`, `--cores` | Number of cores to use | NULL | Integer |
| `-p`, `--plot` | Plot intermediate results | FALSE | Logical |
| `-sm`, `--samplemeta` | Sample meta variable | NULL | Character |
| `-cb`, `--color_by` | Variable to color points | NULL | Character |
| `-cp`, `--color_pal` | Color palette | "muted" | Character |
| `-ps`, `--ptsize` | Point size | 1 | Numeric |

**Example Usage**
-----------------

To run the tool, save the script to a file (e.g., `spatial_ge_wrapper.R`) and then run it from the command line using the following command:
```r
Rscript spatial_ge_wrapper.R -i input.rds -g gene1,gene2 -s sample1,sample2 -m both -k 10 -o -c 4 -p -sm samplemeta -cb color_by -cp muted -ps 2
```
Replace the input file `input.rds` and the gene and sample names with your own data. The other options can be adjusted as needed.
