local telescope = require('telescope')
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

local function path_display(_, path)
  local tail = require("telescope.utils").path_tail(path)
  return string.format("%s (%s)", tail, path)
end

telescope.setup {
  defaults = {
    file_ignore_patterns = {".git/*", "node_modules"},
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' >',
    color_devicons = true,
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    path_display = path_display,

    mappings = {
      i = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.close,
        ["<M-q>"] = actions.send_to_qflist
      }
    },

    sorting_strategy = "ascending"
  },

  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer, -- or right hand side can also be the name of the action as string
        },
        n = {
          ["<c-d>"] = actions.delete_buffer,
        }
      },
      layout_config = {
        width = 0.6,
        prompt_position = "top"
      },
    },
    current_buffer_fuzzy_find = {
      theme = "dropdown",
      previewer = false,
      layout_config = {
        width = 0.6,
        prompt_position = "top"
      },
    },
    find_files = {
      previewer = false,
      layout_strategy = "vertical",
      layout_config = {
        vertical = {
          mirror = true,
          height = 0.6,
          width = 0.6
        },
        prompt_position = "top"
      }
    },
    git_files = {
      layout_strategy = "vertical",
      layout_config = {
        vertical = {
          mirror = true,
          width = 0.6
        }
      },
      prompt_position = "top"
    },
    live_grep = {
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = 'top',
          mirror = true,
          width = 0.9
        }
      }
    },
    lsp_document_symbols = {
      theme = "dropdown",
      previewer = false,
      layout_config = {
        width = 0.8,
        prompt_position = "top"
      },
    },
  },

  extensions = {
    file_browser = {
      previewer = false,
      layout_strategy = "vertical",
      path_display = path_display,
      layout_config = {
        vertical = {
          mirror = true,
          width = 0.6
        },
        prompt_position = "top"
      }
    },
    fzf_native = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

telescope.load_extension('file_browser')
telescope.load_extension('projects')
telescope.load_extension('neoclip')
-- telescope.load_extension('projects')
