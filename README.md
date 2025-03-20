# lasso-SAMBA

**Implementation of lasso in SAMBA relies on _sharp_ package [[1]](#1), containing lasso enhanced by stability selection algorithm, and _Rsmlx_ package [[2]](#2), containing SAMBA algorithm [[3]](#3).**
**For lasso, categorical covariates need to be numerical and no missing values in the covariates table.**

For the example dataset contain in the demo projet in inst/data folder, we simulate for 100 individuals the antibody production by considering two Antibodies secreting cells (ASC), denoted by S -\textit{for short-live}- and L -\textit{for long-live}- (at rates $\varphi_S$ and $\varphi_L$ resp.) and characterized by their half-life ($\delta_S$ and $\delta_L$ resp.). Antibodies are supposed to decay at rate $\delta_{Ab}$. We add significant covariates on $\varphi_S$, $\varphi_L$ and $\delta_{Ab}$ parameters. The mechanistic model is then : 
```math 
\forall i\leq N,j\leq n_i,   \left\{\begin{array}{rcl}
    \frac{d}{dt} Ab_i(t_{ij}) &=& {\varphi_S}_i e^{-\delta_S t_{ij}} + {\varphi_L}_i e^{-\delta_L t_{ij}} - {\delta_{Ab}}_i Ab_i(t_{ij}) \\
    Ab_i(t_{i0}=0) &=& {Ab_0}
\end{array}\right.
```
with 
```math
 \displaystyle\left\{
\begin{array}{rcl}
         \log({\varphi_S}_i) &=& \log({\varphi_S}_{pop}) + \eta^{\varphi_S}_i \\
         \log({\varphi_L}_i) &=& \log({\varphi_L}_{pop})  + \eta^L_i \\
         \log({\delta_{Ab}}_i) &=& \log({\delta_{Ab}}_{pop})   +\eta^{Ab}_i
    \end{array}\right. 
```
where
```math
\displaystyle\left\{
\begin{array}{rcl}
\eta^{\varphi_S}_i&\overset{iid}{\sim}&\mathcal N(0,\omega_{\varphi_S}^2) \\
\eta^L_i&\overset{iid}{\sim}&\mathcal N(0,\omega_L^2) \\
\eta^{Ab}_i&\overset{iid}{\sim}&\mathcal N(0,\omega_{Ab}^2)
    \end{array}\right. 
```
The observation are the defined as 
$Y_{ij} = log_{10}(Ab_i(t_{ij}))+\varepsilon_{ij}$
where 
```math 
\varepsilon_i\overset{iid}{\sim}\mathcal N(0,\Sigma=\sigma^2_{Ab}I_{n_i})
```
We then add to the dataset noisy genes in order to have finally 200 covariates. These covariates are correlated gaussian covariates. 


To build the model, we will use Monolix software [[8]](#8) and the Rsmlx package [[2]](#2) (containing implemented SAMBA algorithm [[3]](#3)) from which we had several other function to enable our lasso approach. 

```r
library(LSAMBA)
project <- getMLXdir()

res = buildmlx(project = project,
                buildMethod = "lasso",
                model='covariate',
                test=FALSE)
getIndividualParameterModel()
```
