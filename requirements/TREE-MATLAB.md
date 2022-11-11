```
code
├── controller
│   ├── FNN
│   │   ├── convolutional
│   │   │   └── ntm_controller.tb.m
│   │   └── standard
│   │       └── ntm_controller.tb.m
│   ├── LSTM
│   │   ├── convolutional
│   │   │   ├── ntm_activation_gate_vector.tb.m
│   │   │   ├── ntm_controller.tb.m
│   │   │   ├── ntm_forget_gate_vector.tb.m
│   │   │   ├── ntm_hidden_gate_vector.tb.m
│   │   │   ├── ntm_input_gate_vector.tb.m
│   │   │   ├── ntm_output_gate_vector.tb.m
│   │   │   └── ntm_state_gate_vector.tb.m
│   │   └── standard
│   │       ├── ntm_activation_gate_vector.tb.m
│   │       ├── ntm_controller.tb.m
│   │       ├── ntm_forget_gate_vector.tb.m
│   │       ├── ntm_hidden_gate_vector.tb.m
│   │       ├── ntm_input_gate_vector.tb.m
│   │       ├── ntm_output_gate_vector.tb.m
│   │       └── ntm_state_gate_vector.tb.m
│   └── transformer
│       ├── components
│       │   ├── ntm_masked_multi_head_attention.tb.m
│       │   ├── ntm_masked_scaled_dot_product_attention.tb.m
│       │   ├── ntm_multi_head_attention.tb.m
│       │   └── ntm_scaled_dot_product_attention.tb.m
│       ├── fnn
│       │   └── ntm_fnn.tb.m
│       ├── functions
│       │   ├── ntm_layer_norm.tb.m
│       │   └── ntm_positional_encoding.tb.m
│       ├── inputs
│       │   ├── ntm_inputs_vector.tb.m
│       │   ├── ntm_keys_vector.tb.m
│       │   ├── ntm_queries_vector.tb.m
│       │   └── ntm_values_vector.tb.m
│       ├── lstm
│       │   ├── ntm_activation_gate_vector.tb.m
│       │   ├── ntm_forget_gate_vector.tb.m
│       │   ├── ntm_hidden_gate_vector.tb.m
│       │   ├── ntm_input_gate_vector.tb.m
│       │   ├── ntm_lstm.tb.m
│       │   ├── ntm_output_gate_vector.tb.m
│       │   └── ntm_state_gate_vector.tb.m
│       └── top
│           ├── ntm_controller.tb.m
│           ├── ntm_decoder.tb.m
│           └── ntm_encoder.tb.m
├── dnc
│   ├── memory
│   │   ├── dnc_addressing.tb.m
│   │   ├── dnc_allocation_weighting.tb.m
│   │   ├── dnc_backward_weighting.tb.m
│   │   ├── dnc_forward_weighting.tb.m
│   │   ├── dnc_matrix_content_based_addressing.tb.m
│   │   ├── dnc_memory_matrix.tb.m
│   │   ├── dnc_memory_retention_vector.tb.m
│   │   ├── dnc_precedence_weighting.tb.m
│   │   ├── dnc_read_content_weighting.tb.m
│   │   ├── dnc_read_vectors.tb.m
│   │   ├── dnc_read_weighting.tb.m
│   │   ├── dnc_sort_vector.tb.m
│   │   ├── dnc_temporal_link_matrix.tb.m
│   │   ├── dnc_usage_vector.tb.m
│   │   ├── dnc_vector_content_based_addressing.tb.m
│   │   ├── dnc_write_content_weighting.tb.m
│   │   └── dnc_write_weighting.tb.m
│   ├── top
│   │   ├── dnc_interface_matrix.tb.m
│   │   ├── dnc_interface_top.tb.m
│   │   ├── dnc_interface_vector.tb.m
│   │   ├── dnc_output_vector.tb.m
│   │   └── dnc_top.tb.m
│   └── trained
│       └── dnc_trained_top.tb.m
├── math
│   ├── algebra
│   │   ├── matrix
│   │   │   ├── ntm_matrix_convolution.tb.m
│   │   │   ├── ntm_matrix_inverse.tb.m
│   │   │   ├── ntm_matrix_multiplication.tb.m
│   │   │   ├── ntm_matrix_product.tb.m
│   │   │   ├── ntm_matrix_summation.tb.m
│   │   │   ├── ntm_matrix_transpose.tb.m
│   │   │   ├── ntm_matrix_vector_convolution.tb.m
│   │   │   ├── ntm_matrix_vector_product.tb.m
│   │   │   └── ntm_transpose_vector_product.tb.m
│   │   ├── scalar
│   │   │   ├── ntm_scalar_multiplication.tb.m
│   │   │   └── ntm_scalar_summation.tb.m
│   │   ├── tensor
│   │   │   ├── ntm_tensor_convolution.tb.m
│   │   │   ├── ntm_tensor_inverse.tb.m
│   │   │   ├── ntm_tensor_matrix_convolution.tb.m
│   │   │   ├── ntm_tensor_matrix_product.tb.m
│   │   │   ├── ntm_tensor_multiplication.tb.m
│   │   │   ├── ntm_tensor_product.tb.m
│   │   │   ├── ntm_tensor_summation.tb.m
│   │   │   └── ntm_tensor_transpose.tb.m
│   │   └── vector
│   │       ├── ntm_dot_product.tb.m
│   │       ├── ntm_vector_convolution.tb.m
│   │       ├── ntm_vector_cosine_similarity.tb.m
│   │       ├── ntm_vector_module.tb.m
│   │       ├── ntm_vector_multiplication.tb.m
│   │       └── ntm_vector_summation.tb.m
│   ├── calculus
│   │   ├── matrix
│   │   │   ├── ntm_matrix_differentiation.tb.m
│   │   │   ├── ntm_matrix_integration.tb.m
│   │   │   └── ntm_matrix_softmax.tb.m
│   │   ├── tensor
│   │   │   ├── ntm_tensor_differentiation.tb.m
│   │   │   ├── ntm_tensor_integration.tb.m
│   │   │   └── ntm_tensor_softmax.tb.m
│   │   └── vector
│   │       ├── ntm_vector_differentiation.tb.m
│   │       ├── ntm_vector_integration.tb.m
│   │       └── ntm_vector_softmax.tb.m
│   ├── function
│   │   ├── matrix
│   │   │   ├── ntm_matrix_logistic_function.tb.m
│   │   │   └── ntm_matrix_oneplus_function.tb.m
│   │   ├── scalar
│   │   │   ├── ntm_scalar_logistic_function.tb.m
│   │   │   └── ntm_scalar_oneplus_function.tb.m
│   │   └── vector
│   │       ├── ntm_vector_logistic_function.tb.m
│   │       └── ntm_vector_oneplus_function.tb.m
│   └── statitics
│       ├── matrix
│       │   ├── ntm_matrix_deviation.tb.m
│       │   └── ntm_matrix_mean.tb.m
│       ├── scalar
│       │   ├── ntm_scalar_deviation.tb.m
│       │   └── ntm_scalar_mean.tb.m
│       └── vector
│           ├── ntm_vector_deviation.tb.m
│           └── ntm_vector_mean.tb.m
├── ntm
│   ├── memory
│   │   ├── ntm_addressing.tb.m
│   │   ├── ntm_matrix_content_based_addressing.tb.m
│   │   └── ntm_vector_content_based_addressing.tb.m
│   ├── read_heads
│   │   └── ntm_reading.tb.m
│   ├── top
│   │   ├── ntm_interface_matrix.tb.m
│   │   ├── ntm_interface_top.tb.m
│   │   ├── ntm_interface_vector.tb.m
│   │   ├── ntm_output_vector.tb.m
│   │   └── ntm_top.tb.m
│   ├── trained
│   │   └── ntm_trained_top.tb.m
│   └── write_heads
│       ├── ntm_erasing.tb.m
│       └── ntm_writing.tb.m
├── state
│   ├── feedback
│   │   ├── ntm_state_matrix_feedforward.tb.m
│   │   ├── ntm_state_matrix_input.tb.m
│   │   ├── ntm_state_matrix_output.tb.m
│   │   └── ntm_state_matrix_state.tb.m
│   ├── outputs
│   │   ├── ntm_state_vector_output.tb.m
│   │   └── ntm_state_vector_state.tb.m
│   └── top
│       └── ntm_state_top.tb.m
└── trainer
    ├── differentiation
    │   ├── ntm_matrix_controller_differentiation.tb.m
    │   └── ntm_vector_controller_differentiation.tb.m
    ├── FNN
    │   ├── ntm_fnn_b_trainer.tb.m
    │   ├── ntm_fnn_d_trainer.tb.m
    │   ├── ntm_fnn_k_trainer.tb.m
    │   ├── ntm_fnn_trainer.tb.m
    │   ├── ntm_fnn_u_trainer.tb.m
    │   ├── ntm_fnn_v_trainer.tb.m
    │   └── ntm_fnn_w_trainer.tb.m
    └── LSTM
        ├── activation
        │   ├── ntm_lstm_activation_b_trainer.tb.m
        │   ├── ntm_lstm_activation_d_trainer.tb.m
        │   ├── ntm_lstm_activation_k_trainer.tb.m
        │   ├── ntm_lstm_activation_trainer.tb.m
        │   ├── ntm_lstm_activation_u_trainer.tb.m
        │   ├── ntm_lstm_activation_v_trainer.tb.m
        │   └── ntm_lstm_activation_w_trainer.tb.m
        ├── forget
        │   ├── ntm_lstm_forget_b_trainer.tb.m
        │   ├── ntm_lstm_forget_d_trainer.tb.m
        │   ├── ntm_lstm_forget_k_trainer.tb.m
        │   ├── ntm_lstm_forget_trainer.tb.m
        │   ├── ntm_lstm_forget_u_trainer.tb.m
        │   ├── ntm_lstm_forget_v_trainer.tb.m
        │   └── ntm_lstm_forget_w_trainer.tb.m
        ├── input
        │   ├── ntm_lstm_input_b_trainer.tb.m
        │   ├── ntm_lstm_input_d_trainer.tb.m
        │   ├── ntm_lstm_input_k_trainer.tb.m
        │   ├── ntm_lstm_input_trainer.tb.m
        │   ├── ntm_lstm_input_u_trainer.tb.m
        │   ├── ntm_lstm_input_v_trainer.tb.m
        │   └── ntm_lstm_input_w_trainer.tb.m
        └── output
            ├── ntm_lstm_output_b_trainer.tb.m
            ├── ntm_lstm_output_d_trainer.tb.m
            ├── ntm_lstm_output_k_trainer.tb.m
            ├── ntm_lstm_output_trainer.tb.m
            ├── ntm_lstm_output_u_trainer.tb.m
            ├── ntm_lstm_output_v_trainer.tb.m
            └── ntm_lstm_output_w_trainer.tb.m
```

54 directories, 162 files
