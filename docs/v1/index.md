**spatialGE.SpatialAutocorrelation**
=====================================

**Description**
---------------

This tool performs spatial autocorrelation analysis on bioinformatics data using the Moran and Geary statistics. It provides a flexible and customizable way to compute and visualize spatial autocorrelation statistics for a given set of genes and samples.

The calculation of spatial statistics with the SThet function of spatialge and and multi-sample comparison with compare_SThet provides and easy way to identify samples and genes exhibiting spatial patterns. 

**Module Details**
-----------------

* **Authors**: Fridley Lab of the Moffit Cancer Center
* **Adapted as a GenePattern Module by:** Ted Liefeld (jliefeld@cloud.ucsd.edu)
* **Categories**: spatial transcriptomics
* **Source Repo**: [https://github.com/FridleyLab/spatialGE]([https://github.com/genepattern/spatialGE.SpatialAutocorrelation](https://github.com/FridleyLab/spatialGE))
* **Module Source Repo**:  [https://github.com/genepattern/spatialGE.SpatialAutocorrelation](https://github.com/genepattern/spatialGE.SpatialAutocorrelation)
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

*
