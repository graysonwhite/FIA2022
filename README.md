# FIA Science Stakeholder Meeting 2022: Slides and Materials

## Invited talk: *Improving Forest Inventory Small Area Estimates through Ecological Borrowing and Hierarchical Bayesian Methods*

An invited talk in the *Estimation Methods: Model-based Inferential Paradigms and Tools* session.

### Abstract

The U.S. Forest Inventory and Analysis Program (FIA) collects inventory data on and computes estimates for many forest attributes to monitor the status and trends of the nation's forests. Increasingly, FIA needs to produce estimates in small geographic and temporal regions. In this application, we implement four Fay-Herriot area level hierarchical Bayesian (HB) estimators that borrow strength across ecological provinces and sections and consider prior information on the between-area variation of the response variables. We compare the performance of these HB estimators to the analogous Fay-Herriot area level empirical best linear unbiased prediction (EBLUP) estimator and to the industry-standard post-stratified (PS) direct estimator in diverse ecological regions in the interior western United States. Results suggest that when producing estimates in this HB framework and using weakly informative priors, we can reduce variance substantially compared to the analogous EBLUP estimator and the PS estimator.

Slides available: [pdf](slides/HB_Estimation_Methods_Grayson_White.pdf)

Relevant links:    
* [*Hierarchical Bayesian Small Area Estimation Using Weakly Informative Priors in Ecologically Homogeneous Areas of the Interior Western Forests* (paper)](https://doi.org/10.3389/ffgc.2021.752911)    
* [`FIESTA` (R package)](https://usdaforestservice.github.io/FIESTA/)
* Estimator dashboards
    * [Ecosubsections](https://ncasi-shiny-tools.shinyapps.io/ecosubsections/)
    * [Counties](https://ncasi-shiny-tools.shinyapps.io/counties/)
    * [Watersheds](https://ncasi-shiny-tools.shinyapps.io/watersheds/) 
    
 
## Contributed talk: *How Do We Assess the Performance of Our Small Area Estimators?*

A contributed talk in the *Improving Estimation Methods* session.

### Abstract

In the U.S. Forest Inventory and Analysis (FIA) Program's small area estimation problems, we are fortunate to have essentially complete unit-level "administrative data" in the form of wall-to-wall coverage of the USA by satellite measurements, elevation data, climate records, etc. at geographic resolution equivalent to the individual plots of land where FIA survey data are collected. In this talk, we first discuss the many choices we have when estimating forest attributes, and then discuss an approach to design-based simulation studies for evaluating SAE models when such detailed administrative data are available. This approach uses hot deck imputation to take response variable values from real FIA survey data and assign them to similar units sampled in each simulation run.

Slides available: [pdf](slides/SAE_Assessment_Grayson_White.pdf)
