# Neural Network

## Feedforward Neural Network

$${\displaystyle {\begin{aligned}h_{t} = \sigma_{g}(W_{h} \cdot x_{t}+U_{h} \cdot h_{t-1}+b_{h})\\y_{t} = \sigma_{g}(W_{y} \cdot h_{t}+b_{y})\end{aligned}}}$$

$${\displaystyle {\begin{aligned}h_{t} = \sigma_{g}(W_{h} \star x_{t}+U_{h} \star h_{t-1}+b_{h})\\y_{t} = \sigma_{g}(W_{y} \star h_{t}+b_{y})\end{aligned}}}$$

## Long Short Term Memory Neural Network

$${\displaystyle {\begin{aligned}a_{t} = \sigma_{g}(W_{a} \cdot x_{t}+U_{a} \cdot h_{t-1}+b_{a})\\f_{t} = \sigma_{g}(W_{f} \cdot x_{t}+U_{f} \cdot h_{t-1}+b_{f})\\i_{t} = \sigma_{g}(W_{i} \cdot x_{t}+U_{i} \cdot h_{t-1}+b_{i})\\o_{t} = \sigma_{g}(W_{o} \cdot x_{t}+U_{o} \cdot h_{t-1}+b_{o})\\c_{t} = f_{t} \circ c_{t-1}+i_{t} \circ a_{t}\\h_{t} = o_{t} \circ \sigma_{g}(c_{t}))\end{aligned}}}$$

$${\displaystyle {\begin{aligned}a_{t} = \sigma_{g}(W_{a} \star x_{t}+U_{a} \star h_{t-1}+b_{a})\\f_{t} = \sigma_{g}(W_{f} \star x_{t}+U_{f} \star h_{t-1}+b_{f})\\i_{t} = \sigma_{g}(W_{i} \star x_{t}+U_{i} \star h_{t-1}+b_{i})\\o_{t} = \sigma_{g}(W_{o} \star x_{t}+U_{o} \star h_{t-1}+b_{o})\\c_{t} = f_{t} \circ c_{t-1}+i_{t} \circ a_{t}\\h_{t} = o_{t} \circ \sigma_{g}(c_{t}))\end{aligned}}}$$

## Transformer Neural Network

$${\displaystyle {\begin{aligned}{\text{attention}}(Q, K, V)={\text{softmax}}\left({\frac{QK^{\mathrm{T}}}{\sqrt{d_{k}}}}\right)V\end{aligned}}}$$
