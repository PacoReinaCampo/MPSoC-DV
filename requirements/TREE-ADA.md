```
code
├── arithmetic
│   ├── matrix
│   │   ├── ntm_matrix_adder.adb
│   │   ├── ntm_matrix_divider.adb
│   │   └── ntm_matrix_multiplier.adb
│   ├── scalar
│   │   ├── ntm_scalar_adder.adb
│   │   ├── ntm_scalar_divider.adb
│   │   └── ntm_scalar_multiplier.adb
│   ├── tensor
│   │   ├── ntm_tensor_adder.adb
│   │   ├── ntm_tensor_divider.adb
│   │   └── ntm_tensor_multiplier.adb
│   └── vector
│       ├── ntm_vector_adder.adb
│       ├── ntm_vector_divider.adb
│       └── ntm_vector_multiplier.adb
├── controller
│   ├── FNN
│   │   ├── convolutional
│   │   │   └── ntm_controller.adb
│   │   └── standard
│   │       └── ntm_controller.adb
│   ├── LSTM
│   │   ├── convolutional
│   │   │   ├── ntm_activation_gate_vector.adb
│   │   │   ├── ntm_controller.adb
│   │   │   ├── ntm_forget_gate_vector.adb
│   │   │   ├── ntm_hidden_gate_vector.adb
│   │   │   ├── ntm_input_gate_vector.adb
│   │   │   ├── ntm_output_gate_vector.adb
│   │   │   └── ntm_state_gate_vector.adb
│   │   └── standard
│   │       ├── ntm_activation_gate_vector.adb
│   │       ├── ntm_controller.adb
│   │       ├── ntm_forget_gate_vector.adb
│   │       ├── ntm_hidden_gate_vector.adb
│   │       ├── ntm_input_gate_vector.adb
│   │       ├── ntm_output_gate_vector.adb
│   │       └── ntm_state_gate_vector.adb
│   └── transformer
│       ├── components
│       │   ├── ntm_masked_multi_head_attention.adb
│       │   ├── ntm_masked_scaled_dot_product_attention.adb
│       │   ├── ntm_multi_head_attention.adb
│       │   └── ntm_scaled_dot_product_attention.adb
│       ├── fnn
│       │   └── ntm_fnn.adb
│       ├── functions
│       │   ├── ntm_layer_norm.adb
│       │   └── ntm_positional_encoding.adb
│       ├── inputs
│       │   ├── ntm_inputs_vector.adb
│       │   ├── ntm_keys_vector.adb
│       │   ├── ntm_queries_vector.adb
│       │   └── ntm_values_vector.adb
│       ├── lstm
│       │   ├── ntm_activation_gate_vector.adb
│       │   ├── ntm_forget_gate_vector.adb
│       │   ├── ntm_hidden_gate_vector.adb
│       │   ├── ntm_input_gate_vector.adb
│       │   ├── ntm_lstm.adb
│       │   ├── ntm_output_gate_vector.adb
│       │   └── ntm_state_gate_vector.adb
│       └── top
│           ├── ntm_controller.adb
│           ├── ntm_decoder.adb
│           └── ntm_encoder.adb
├── dnc
│   ├── memory
│   │   ├── dnc_addressing.adb
│   │   ├── dnc_allocation_weighting.adb
│   │   ├── dnc_backward_weighting.adb
│   │   ├── dnc_forward_weighting.adb
│   │   ├── dnc_matrix_content_based_addressing.adb
│   │   ├── dnc_memory_matrix.adb
│   │   ├── dnc_memory_retention_vector.adb
│   │   ├── dnc_precedence_weighting.adb
│   │   ├── dnc_read_content_weighting.adb
│   │   ├── dnc_read_vectors.adb
│   │   ├── dnc_read_weighting.adb
│   │   ├── dnc_sort_vector.adb
│   │   ├── dnc_temporal_link_matrix.adb
│   │   ├── dnc_usage_vector.adb
│   │   ├── dnc_vector_content_based_addressing.adb
│   │   ├── dnc_write_content_weighting.adb
│   │   └── dnc_write_weighting.adb
│   ├── top
│   │   ├── dnc_interface_matrix.adb
│   │   ├── dnc_interface_top.adb
│   │   ├── dnc_interface_vector.adb
│   │   ├── dnc_output_vector.adb
│   │   └── dnc_top.adb
│   └── trained
│       └── dnc_trained_top.adb
├── math
│   ├── algebra
│   │   ├── matrix
│   │   │   ├── ntm_matrix_convolution.adb
│   │   │   ├── ntm_matrix_inverse.adb
│   │   │   ├── ntm_matrix_multiplication.adb
│   │   │   ├── ntm_matrix_product.adb
│   │   │   ├── ntm_matrix_summation.adb
│   │   │   ├── ntm_matrix_transpose.adb
│   │   │   ├── ntm_matrix_vector_convolution.adb
│   │   │   ├── ntm_matrix_vector_product.adb
│   │   │   └── ntm_transpose_vector_product.adb
│   │   ├── scalar
│   │   │   ├── ntm_scalar_multiplication.adb
│   │   │   └── ntm_scalar_summation.adb
│   │   ├── tensor
│   │   │   ├── ntm_tensor_convolution.adb
│   │   │   ├── ntm_tensor_inverse.adb
│   │   │   ├── ntm_tensor_matrix_convolution.adb
│   │   │   ├── ntm_tensor_matrix_product.adb
│   │   │   ├── ntm_tensor_multiplication.adb
│   │   │   ├── ntm_tensor_product.adb
│   │   │   ├── ntm_tensor_summation.adb
│   │   │   └── ntm_tensor_transpose.adb
│   │   └── vector
│   │       ├── ntm_dot_product.adb
│   │       ├── ntm_vector_convolution.adb
│   │       ├── ntm_vector_cosine_similarity.adb
│   │       ├── ntm_vector_module.adb
│   │       ├── ntm_vector_multiplication.adb
│   │       └── ntm_vector_summation.adb
│   ├── calculus
│   │   ├── matrix
│   │   │   ├── ntm_matrix_differentiation.adb
│   │   │   ├── ntm_matrix_integration.adb
│   │   │   └── ntm_matrix_softmax.adb
│   │   ├── tensor
│   │   │   ├── ntm_tensor_differentiation.adb
│   │   │   ├── ntm_tensor_integration.adb
│   │   │   └── ntm_tensor_softmax.adb
│   │   └── vector
│   │       ├── ntm_vector_differentiation.adb
│   │       ├── ntm_vector_integration.adb
│   │       └── ntm_vector_softmax.adb
│   ├── function
│   │   ├── matrix
│   │   │   ├── ntm_matrix_logistic_function.adb
│   │   │   └── ntm_matrix_oneplus_function.adb
│   │   ├── scalar
│   │   │   ├── ntm_scalar_logistic_function.adb
│   │   │   └── ntm_scalar_oneplus_function.adb
│   │   └── vector
│   │       ├── ntm_vector_logistic_function.adb
│   │       └── ntm_vector_oneplus_function.adb
│   └── statitics
│       ├── matrix
│       │   ├── ntm_matrix_deviation.adb
│       │   └── ntm_matrix_mean.adb
│       ├── scalar
│       │   ├── ntm_scalar_deviation.adb
│       │   └── ntm_scalar_mean.adb
│       └── vector
│           ├── ntm_vector_deviation.adb
│           └── ntm_vector_mean.adb
├── ntm
│   ├── memory
│   │   ├── ntm_addressing.adb
│   │   ├── ntm_matrix_content_based_addressing.adb
│   │   └── ntm_vector_content_based_addressing.adb
│   ├── read_heads
│   │   └── ntm_reading.adb
│   ├── top
│   │   ├── ntm_interface_matrix.adb
│   │   ├── ntm_interface_top.adb
│   │   ├── ntm_interface_vector.adb
│   │   ├── ntm_output_vector.adb
│   │   └── ntm_top.adb
│   ├── trained
│   │   └── ntm_trained_top.adb
│   └── write_heads
│       ├── ntm_erasing.adb
│       └── ntm_writing.adb
├── state
│   ├── feedback
│   │   ├── ntm_state_matrix_feedforward.adb
│   │   ├── ntm_state_matrix_input.adb
│   │   ├── ntm_state_matrix_output.adb
│   │   └── ntm_state_matrix_state.adb
│   ├── outputs
│   │   ├── ntm_state_vector_output.adb
│   │   └── ntm_state_vector_state.adb
│   └── top
│       └── ntm_state_top.adb
└── trainer
    ├── differentiation
    │   ├── ntm_matrix_controller_differentiation.adb
    │   └── ntm_vector_controller_differentiation.adb
    ├── FNN
    │   ├── ntm_fnn_b_trainer.adb
    │   ├── ntm_fnn_d_trainer.adb
    │   ├── ntm_fnn_k_trainer.adb
    │   ├── ntm_fnn_trainer.adb
    │   ├── ntm_fnn_u_trainer.adb
    │   ├── ntm_fnn_v_trainer.adb
    │   └── ntm_fnn_w_trainer.adb
    └── LSTM
        ├── activation
        │   ├── ntm_lstm_activation_b_trainer.adb
        │   ├── ntm_lstm_activation_d_trainer.adb
        │   ├── ntm_lstm_activation_k_trainer.adb
        │   ├── ntm_lstm_activation_trainer.adb
        │   ├── ntm_lstm_activation_u_trainer.adb
        │   ├── ntm_lstm_activation_v_trainer.adb
        │   └── ntm_lstm_activation_w_trainer.adb
        ├── forget
        │   ├── ntm_lstm_forget_b_trainer.adb
        │   ├── ntm_lstm_forget_d_trainer.adb
        │   ├── ntm_lstm_forget_k_trainer.adb
        │   ├── ntm_lstm_forget_trainer.adb
        │   ├── ntm_lstm_forget_u_trainer.adb
        │   ├── ntm_lstm_forget_v_trainer.adb
        │   └── ntm_lstm_forget_w_trainer.adb
        ├── input
        │   ├── ntm_lstm_input_b_trainer.adb
        │   ├── ntm_lstm_input_d_trainer.adb
        │   ├── ntm_lstm_input_k_trainer.adb
        │   ├── ntm_lstm_input_trainer.adb
        │   ├── ntm_lstm_input_u_trainer.adb
        │   ├── ntm_lstm_input_v_trainer.adb
        │   └── ntm_lstm_input_w_trainer.adb
        └── output
            ├── ntm_lstm_output_b_trainer.adb
            ├── ntm_lstm_output_d_trainer.adb
            ├── ntm_lstm_output_k_trainer.adb
            ├── ntm_lstm_output_trainer.adb
            ├── ntm_lstm_output_u_trainer.adb
            ├── ntm_lstm_output_v_trainer.adb
            └── ntm_lstm_output_w_trainer.adb
```

59 directories, 174 files
