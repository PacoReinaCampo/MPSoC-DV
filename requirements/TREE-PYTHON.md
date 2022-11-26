```
code
├── arithmetic
│   ├── matrix
│   │   ├── **ntm_matrix_adder.py**
│   │   ├── **ntm_matrix_divider.py**
│   │   └── **ntm_matrix_multiplier.py**
│   ├── scalar
│   │   ├── **ntm_scalar_adder.py**
│   │   ├── **ntm_scalar_divider.py**
│   │   └── **ntm_scalar_multiplier.py**
│   ├── tensor
│   │   ├── **ntm_tensor_adder.py**
│   │   ├── **ntm_tensor_divider.py**
│   │   └── **ntm_tensor_multiplier.py**
│   └── vector
│       ├── **ntm_vector_adder.py**
│       ├── **ntm_vector_divider.py**
│       └── **ntm_vector_multiplier.py**
├── controller
│   ├── FNN
│   │   ├── convolutional
│   │   │   └── ntm_controller.py
│   │   └── standard
│   │       └── ntm_controller.py
│   ├── LSTM
│   │   ├── convolutional
│   │   │   ├── ntm_activation_gate_vector.py
│   │   │   ├── ntm_controller.py
│   │   │   ├── ntm_forget_gate_vector.py
│   │   │   ├── ntm_hidden_gate_vector.py
│   │   │   ├── ntm_input_gate_vector.py
│   │   │   ├── ntm_output_gate_vector.py
│   │   │   └── ntm_state_gate_vector.py
│   │   └── standard
│   │       ├── ntm_activation_gate_vector.py
│   │       ├── ntm_controller.py
│   │       ├── ntm_forget_gate_vector.py
│   │       ├── ntm_hidden_gate_vector.py
│   │       ├── ntm_input_gate_vector.py
│   │       ├── ntm_output_gate_vector.py
│   │       └── ntm_state_gate_vector.py
│   └── transformer
│       ├── components
│       │   ├── ntm_masked_multi_head_attention.py
│       │   ├── ntm_masked_scaled_dot_product_attention.py
│       │   ├── ntm_multi_head_attention.py
│       │   └── ntm_scaled_dot_product_attention.py
│       ├── fnn
│       │   └── ntm_fnn.py
│       ├── functions
│       │   ├── ntm_layer_norm.py
│       │   └── ntm_positional_encoding.py
│       ├── inputs
│       │   ├── ntm_inputs_vector.py
│       │   ├── ntm_keys_vector.py
│       │   ├── ntm_queries_vector.py
│       │   └── ntm_values_vector.py
│       ├── lstm
│       │   ├── ntm_activation_gate_vector.py
│       │   ├── ntm_forget_gate_vector.py
│       │   ├── ntm_hidden_gate_vector.py
│       │   ├── ntm_input_gate_vector.py
│       │   ├── ntm_lstm.py
│       │   ├── ntm_output_gate_vector.py
│       │   └── ntm_state_gate_vector.py
│       └── top
│           ├── ntm_controller.py
│           ├── ntm_decoder.py
│           └── ntm_encoder.py
├── dnc
│   ├── memory
│   │   ├── dnc_addressing.py
│   │   ├── dnc_allocation_weighting.py
│   │   ├── dnc_backward_weighting.py
│   │   ├── dnc_forward_weighting.py
│   │   ├── dnc_matrix_content_based_addressing.py
│   │   ├── dnc_memory_matrix.py
│   │   ├── dnc_memory_retention_vector.py
│   │   ├── dnc_precedence_weighting.py
│   │   ├── dnc_read_content_weighting.py
│   │   ├── dnc_read_vectors.py
│   │   ├── dnc_read_weighting.py
│   │   ├── dnc_sort_vector.py
│   │   ├── dnc_temporal_link_matrix.py
│   │   ├── dnc_usage_vector.py
│   │   ├── dnc_vector_content_based_addressing.py
│   │   ├── dnc_write_content_weighting.py
│   │   └── dnc_write_weighting.py
│   ├── top
│   │   ├── dnc_interface_matrix.py
│   │   ├── dnc_interface_top.py
│   │   ├── dnc_interface_vector.py
│   │   ├── dnc_output_vector.py
│   │   └── dnc_top.py
│   └── trained
│       └── dnc_trained_top.py
├── math
│   ├── algebra
│   │   ├── matrix
│   │   │   ├── ntm_matrix_convolution.py
│   │   │   ├── ntm_matrix_inverse.py
│   │   │   ├── ntm_matrix_multiplication.py
│   │   │   ├── ntm_matrix_product.py
│   │   │   ├── ntm_matrix_summation.py
│   │   │   ├── ntm_matrix_transpose.py
│   │   │   ├── ntm_matrix_vector_convolution.py
│   │   │   ├── ntm_matrix_vector_product.py
│   │   │   └── ntm_transpose_vector_product.py
│   │   ├── scalar
│   │   │   ├── ntm_scalar_multiplication.py
│   │   │   └── ntm_scalar_summation.py
│   │   ├── tensor
│   │   │   ├── ntm_tensor_convolution.py
│   │   │   ├── ntm_tensor_inverse.py
│   │   │   ├── ntm_tensor_matrix_convolution.py
│   │   │   ├── ntm_tensor_matrix_product.py
│   │   │   ├── ntm_tensor_multiplication.py
│   │   │   ├── ntm_tensor_product.py
│   │   │   ├── ntm_tensor_summation.py
│   │   │   └── ntm_tensor_transpose.py
│   │   └── vector
│   │       ├── ntm_dot_product.py
│   │       ├── ntm_vector_convolution.py
│   │       ├── ntm_vector_cosine_similarity.py
│   │       ├── ntm_vector_module.py
│   │       ├── ntm_vector_multiplication.py
│   │       └── ntm_vector_summation.py
│   ├── calculus
│   │   ├── matrix
│   │   │   ├── **ntm_matrix_differentiation.py**
│   │   │   ├── **ntm_matrix_integration.py**
│   │   │   └── **ntm_matrix_softmax.py**
│   │   ├── tensor
│   │   │   ├── **ntm_tensor_differentiation.py**
│   │   │   ├── **ntm_tensor_integration.py**
│   │   │   └── **ntm_tensor_softmax.py**
│   │   └── vector
│   │       ├── **ntm_vector_differentiation.py**
│   │       ├── **ntm_vector_integration.py**
│   │       └── **ntm_vector_softmax.py**
│   ├── function
│   │   ├── matrix
│   │   │   ├── **ntm_matrix_logistic_function.py**
│   │   │   └── **ntm_matrix_oneplus_function.py**
│   │   ├── scalar
│   │   │   ├── **ntm_scalar_logistic_function.py**
│   │   │   └── **ntm_scalar_oneplus_function.py**
│   │   └── vector
│   │       ├── **ntm_vector_logistic_function.py**
│   │       └── **ntm_vector_oneplus_function.py**
│   └── statitics
│       ├── matrix
│       │   ├── ntm_matrix_deviation.py
│       │   └── ntm_matrix_mean.py
│       ├── scalar
│       │   ├── ntm_scalar_deviation.py
│       │   └── ntm_scalar_mean.py
│       └── vector
│           ├── ntm_vector_deviation.py
│           └── ntm_vector_mean.py
├── ntm
│   ├── memory
│   │   ├── ntm_addressing.py
│   │   ├── ntm_matrix_content_based_addressing.py
│   │   └── ntm_vector_content_based_addressing.py
│   ├── read_heads
│   │   └── ntm_reading.py
│   ├── top
│   │   ├── ntm_interface_matrix.py
│   │   ├── ntm_interface_top.py
│   │   ├── ntm_interface_vector.py
│   │   ├── ntm_output_vector.py
│   │   └── ntm_top.py
│   ├── trained
│   │   └── ntm_trained_top.py
│   └── write_heads
│       ├── ntm_erasing.py
│       └── ntm_writing.py
├── state
│   ├── feedback
│   │   ├── *ntm_state_matrix_feedforward.py*
│   │   ├── *ntm_state_matrix_input.py*
│   │   ├── *ntm_state_matrix_output.py*
│   │   └── *ntm_state_matrix_state.py*
│   ├── outputs
│   │   ├── *ntm_state_vector_output.py*
│   │   └── *ntm_state_vector_state.py*
│   └── top
│       └── *ntm_state_top.py*
└── trainer
    ├── differentiation
    │   ├── ntm_matrix_controller_differentiation.py
    │   └── ntm_vector_controller_differentiation.py
    ├── FNN
    │   ├── ntm_fnn_b_trainer.py
    │   ├── ntm_fnn_d_trainer.py
    │   ├── ntm_fnn_k_trainer.py
    │   ├── ntm_fnn_trainer.py
    │   ├── ntm_fnn_u_trainer.py
    │   ├── ntm_fnn_v_trainer.py
    │   └── ntm_fnn_w_trainer.py
    └── LSTM
        ├── activation
        │   ├── ntm_lstm_activation_b_trainer.py
        │   ├── ntm_lstm_activation_d_trainer.py
        │   ├── ntm_lstm_activation_k_trainer.py
        │   ├── ntm_lstm_activation_trainer.py
        │   ├── ntm_lstm_activation_u_trainer.py
        │   ├── ntm_lstm_activation_v_trainer.py
        │   └── ntm_lstm_activation_w_trainer.py
        ├── forget
        │   ├── ntm_lstm_forget_b_trainer.py
        │   ├── ntm_lstm_forget_d_trainer.py
        │   ├── ntm_lstm_forget_k_trainer.py
        │   ├── ntm_lstm_forget_trainer.py
        │   ├── ntm_lstm_forget_u_trainer.py
        │   ├── ntm_lstm_forget_v_trainer.py
        │   └── ntm_lstm_forget_w_trainer.py
        ├── input
        │   ├── ntm_lstm_input_b_trainer.py
        │   ├── ntm_lstm_input_d_trainer.py
        │   ├── ntm_lstm_input_k_trainer.py
        │   ├── ntm_lstm_input_trainer.py
        │   ├── ntm_lstm_input_u_trainer.py
        │   ├── ntm_lstm_input_v_trainer.py
        │   └── ntm_lstm_input_w_trainer.py
        └── output
            ├── ntm_lstm_output_b_trainer.py
            ├── ntm_lstm_output_d_trainer.py
            ├── ntm_lstm_output_k_trainer.py
            ├── ntm_lstm_output_trainer.py
            ├── ntm_lstm_output_u_trainer.py
            ├── ntm_lstm_output_v_trainer.py
            └── ntm_lstm_output_w_trainer.py
```

59 directories, 174 files
