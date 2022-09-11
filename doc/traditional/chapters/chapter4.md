# Turing Machine

$${\displaystyle T = (Q, \Sigma, b, \Gamma, \delta, q_{0}, F)}$$
$${\displaystyle Q \subseteq H}$$
$${\displaystyle \delta : \Sigma \times Q \otimes \Gamma \to \Sigma \times Q \otimes \Gamma \times \{L, R\}}$$

## Neural Turing Machine

* Definitions
$${\displaystyle {\mathcal{D}}(\mathbf{u},\mathbf{v})={\frac{\mathbf{u} \cdot \mathbf{v}}{\|\mathbf{u} \| \cdot \| \mathbf{v} \|}}}$$

* Reading
$$\sum_{i=0}^{M-1} w_t(i) = 1; \quad 0 \leq w_t(i) \leq 1$$
$$\mathbf{r}_t \longleftarrow \sum_{i=0}^{M-1}{w_t(i) \mathbf{M}_t(i)}$$

* Writing
$$\mathbf{\tilde{M}}_t(i) \longleftarrow \mathbf{M}_{t-1}(i) \left[\mathbf{1}-w_t(i) \mathbf{e}_t\right]$$
$$\mathbf{M}_t(i) \longleftarrow \mathbf{\tilde{M}}_t(i) + w_t(i)\, \mathbf{a}_t$$

* Addressing
$$w^c_t(i) \longleftarrow \frac{\exp\bigg(\beta_t \mathcal{D} \big[\mathbf{k}_t, \mathbf{M}_t(i)\big]\bigg)}{\sum_{j=0}^{N-1} \exp\bigg(\beta_t \mathcal{D} \big[\mathbf{k}_t, \mathbf{M}_t(j)\big]\bigg)}$$
$$\mathbf{w}^g_t \longleftarrow g_t \mathbf{w}^c_{t}  + (1-g_t) \mathbf{w}_{t-1}$$
$$\tilde{w}_t(i) \longleftarrow \sum_{j=0}^{N-1} w^g_t(j)\, s_t(i-j)$$
$$w_t(i) \longleftarrow \frac{\tilde{w}_t(i)^{\gamma_t}}{\sum_{j=0}^{N-1} \tilde{w}_t(j)^{\gamma_t}}$$

* Interfaces

$${\displaystyle \xi_{t}=W_{\xi}[h_{t}^{1};\cdots;h_{t}^{L}] = [\mathbf {k}_{t}^{w};{\hat {\beta_{t}^{w}}};\mathbf {\hat {e}}_{t};\mathbf {v}_{t};{\hat {g}}_{t}^{a};{\hat {g}}_{t}^{w}]}$$
$${\displaystyle \rho_{t}=W_{\rho}[h_{t}^{1};\cdots;h_{t}^{L}] = [\mathbf {k}_{t}^{r,1};\cdots;\mathbf {k}_{t}^{r,R};{\hat {\beta}}_{t}^{r,1};\cdots;{\hat {\beta}}_{t}^{r,R};{\hat {f_{t}^{1}}};\cdots;{\hat {f_{t}^{R}}};{\hat {\boldsymbol {\pi}}}_{t}^{1};\cdots;{\hat {\boldsymbol {\pi}}}_{t}^{R}]}$$

* Vector Output

$${\displaystyle \mathbf y_{t} = W_{y} \mathbf h_{t} + W_{r}^{i} \mathbf {r}_{t}^{i}}$$

### Feedforward Neural Turing Machine

### LSTM Neural Turing Machine

### Transformer Neural Turing Machine

## Differentiable Neural Computer

* Definitions
$${\displaystyle {\mathcal{D}}(\mathbf{u},\mathbf{v})={\frac{\mathbf{u} \cdot \mathbf{v}}{\|\mathbf{u} \| \cdot \| \mathbf{v} \|}}}$$
$${\displaystyle {\mathcal{C}}(M,\mathbf{k},\beta)[i]={\frac{\exp\{{\mathcal{D}}(\mathbf{k},M[i,\cdot])\beta \}}{\sum_{j}\exp\{{\mathcal{D}}(\mathbf{k},M[j,\cdot])\beta \}}}}$$
$${\displaystyle \sigma(x)=\frac{1}{1+e^{-x}}}$$
$${\displaystyle {\text{oneplus}}(x)=1+\log(1+e^{x})}$$
$${\displaystyle {\text{softmax}}(\mathbf{x})_{j}={\frac{e^{x_{j}}}{\sum_{k=1}^{K}e^{x_{k}}}}}$$

* Addressing
$${\displaystyle M_{t}=M_{t-1}\circ (E-\mathbf{w}_{t}^{w}\mathbf{e}_{t}^{\intercal})+\mathbf{w}_{t}^{w}\mathbf{v}_{t}^{\intercal}}$$
$${\displaystyle \mathbf{u}_{t}=(\mathbf{u}_{t-1}+\mathbf{w}_{t-1}^{w}-\mathbf{u}_{t-1}\circ \mathbf{w}_{t-1}^{w})\circ{\boldsymbol{\psi}}_{t}}$$
$${\displaystyle \mathbf{p}_{t}=\left(1-\sum_{i}\mathbf{w}_{t}^{w}[i]\right)\mathbf{p}_{t-1}+\mathbf{w}_{t}^{w}}$$
$${\displaystyle L_{t}=(\mathbf{1}-\mathbf{I})\left[(1-\mathbf{w}_{t}^{w}[i]-\mathbf{w}_{t}^{j})L_{t-1}[i,j]+\mathbf{w}_{t}^{w}[i]\mathbf{p}_{t-1}^{j}\right]}$$
$${\displaystyle \mathbf{w}_{t}^{w}=g_{t}^{w}[g_{t}^{a}\mathbf{a}_{t}+(1-g_{t}^{a})\mathbf{c}_{t}^{w}]}$$
$${\displaystyle \mathbf{w}_{t}^{r,i}={\boldsymbol{\pi}}_{t}^{i}[1]\mathbf{b}_{t}^{i}+{\boldsymbol{\pi}}_{t}^{i}[2]\mathbf{c}_{t}^{r,i}+{\boldsymbol{\pi}}_{t}^{i}[3]\mathbf{f}_{t}^{i}}$$
$${\displaystyle \mathbf{r}_{t}^{i}=M_{t}^{\intercal}\mathbf{w}_{t}^{r,i}}$$
$${\displaystyle \mathbf{a}_{t}[\phi_{t}[j]]=(1-\mathbf{u}_{t}[\phi_{t}[j]])\prod_{i=1}^{j-1}\mathbf{u}_{t}[\phi_{t}[i]]}$$
$${\displaystyle \mathbf{c}_{t}^{w}={\mathcal{C}}(M_{t-1},\mathbf{k}_{t}^{w},\beta_{t}^{w})}$$
$${\displaystyle \mathbf{c}_{t}^{r,i}={\mathcal{C}}(M_{t-1},\mathbf{k}_{t}^{r,i},\beta_{t}^{r,i})}$$
$${\displaystyle \mathbf{f}_{t}^{i}=L_{t}\mathbf{w}_{t-1}^{r,i}}$$
$${\displaystyle \mathbf{b}_{t}^{i}=L_{t}^{\intercal}\mathbf{w}_{t-1}^{r,i}}$$
$${\displaystyle {\boldsymbol{\psi}}_{t}=\prod_{i=1}^{R}\left(\mathbf{1}-f_{t}^{i}\mathbf{w}_{t-1}^{r,i}\right)}$$

* Interfaces

$${\displaystyle \xi_{t}=W_{\xi}[h_{t}^{1};\cdots;h_{t}^{L}] = [\mathbf {k}_{t}^{w};{\hat {\beta_{t}^{w}}};\mathbf {\hat {e}}_{t};\mathbf {v}_{t};{\hat {g}}_{t}^{a};{\hat {g}}_{t}^{w}]}$$
$${\displaystyle \rho_{t}=W_{\rho}[h_{t}^{1};\cdots;h_{t}^{L}] = [\mathbf {k}_{t}^{r,1};\cdots;\mathbf {k}_{t}^{r,R};{\hat {\beta}}_{t}^{r,1};\cdots;{\hat {\beta}}_{t}^{r,R};{\hat {f_{t}^{1}}};\cdots;{\hat {f_{t}^{R}}};{\hat {\boldsymbol {\pi}}}_{t}^{1};\cdots;{\hat {\boldsymbol {\pi}}}_{t}^{R}]}$$

* Vector Output

$${\displaystyle \mathbf y_{t} = W_{y} \mathbf h_{t} + W_{r}^{i} \mathbf {r}_{t}^{i}}$$

### Feedforward Differentiable Neural Computer

### LSTM Differentiable Neural Computer

### Transformer Differentiable Neural Computer
