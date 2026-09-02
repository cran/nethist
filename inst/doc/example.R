## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(nethist)

## ----nethist-example, eval=FALSE----------------------------------------------
# set.seed(42)
# data(polblog)
# 
# # Automatic bandwidth selection
# nethist_polblog <- nethist(polblog)
# print(nethist_polblog)

## ----nethist-fast-------------------------------------------------------------
set.seed(2024)
A_gnp <- igraph::sample_gnp(200, 0.05)
result <- nethist(A_gnp)
print(result)

## ----plot-nethist, fig.width=5, fig.height=5----------------------------------
plot(result)

## ----plot-nethist-prob, fig.width=5, fig.height=5-----------------------------
plot(result, type = "prob", prob = TRUE,
     col.regions = colorRampPalette(c("#FFFFFF", "#08306B"))(50))

## ----multinethist-example, eval=FALSE-----------------------------------------
# set.seed(42)
# data(IndianVil)
# 
# # IndianVil is a 231 x 231 x 12 adjacency array
# # representing 12 socioeconomic relationship types in an Indian village
# mnethist_result <- multinethist(IndianVil)
# print(mnethist_result)

## ----common-f, eval=FALSE-----------------------------------------------------
# # Heterogeneous histogram (default): each layer has its own density
# mnethist_het <- multinethist(IndianVil, common_f = FALSE)
# 
# # Homogeneous histogram: shared structure, layer-specific density
# mnethist_hom <- multinethist(IndianVil, common_f = TRUE)

## ----multinethist-fast--------------------------------------------------------
set.seed(2024)
# Build a small 2-layer network
A1 <- igraph::as_adjacency_matrix(igraph::sample_gnp(80, 0.10), sparse = FALSE)
A2 <- igraph::as_adjacency_matrix(igraph::sample_gnp(80, 0.05), sparse = FALSE)
A_multi <- array(c(A1, A2), dim = c(80, 80, 2))

mn_result <- multinethist(A_multi)
print(mn_result)

## ----plot-multinethist, fig.width=5, fig.height=5-----------------------------
plot(mn_result)

## ----plot3d, eval=FALSE-------------------------------------------------------
# plot3d(mnethist_result)

## ----summary-plot-factor, eval=FALSE------------------------------------------
# set.seed(42)
# data(polblog)
# nethist_polblog <- nethist(polblog)
# 
# political_label <- factor(
#   c(rep("Liberal", 586), rep("Conservative", 638))
# )
# 
# summary_plot(nethist_polblog, covariate = political_label,
#              legend_title = "Political affiliation")

## ----summary-plot-numeric, fig.width=5, fig.height=4--------------------------
set.seed(2024)
A_gnp <- igraph::sample_gnp(200, 0.05)
result <- nethist(A_gnp)

# Node degree as a numeric covariate
node_degree <- igraph::degree(A_gnp)
summary_plot(result, covariate = node_degree, ylab = "Degree")

## ----violin, fig.width=6, fig.height=4----------------------------------------
set.seed(2024)
A_gnp <- igraph::sample_gnp(400, 0.05)
violin_netsummary(A_gnp)

