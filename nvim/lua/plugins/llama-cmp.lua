return {
  "maxpaulus43/llama-cmp.nvim",
  opts = {
    model = "qwen2.5-coder:3b",
    preset = "qwen",
    debounce_ms = 250,
    generation = {
      max_tokens = 64,
      temperature = 0.1,
    },
    context = {
      max_prefix_lines = 20,
      max_suffix_lines = 10,
    },
  },
}
