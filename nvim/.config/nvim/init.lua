-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Define the directory where your templates are stored
local template_dir = vim.fn.stdpath("config") .. "/templates"

local function load_skeleton()
  -- 1. Get current file information
  local current_file = vim.fn.expand("%:p") -- Get full path
  local filetype = vim.bo.filetype

  -- 2. Construct the template path for the current filetype
  local template_file = template_dir .. "/skeleton." .. filetype

  -- 3. CRITICAL NEW CHECK: If the current file IS the template itself, exit immediately.
  if current_file == template_file then
    return
  end

  -- Check if the current buffer is empty (new file)
  if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
    -- Check if the template file exists and is readable
    if vim.fn.filereadable(template_file) == 1 then
      -- Load the template content into the buffer
      vim.cmd("0r " .. template_file)

      -- Get current date and filename
      local date = os.date("%Y-%m-%d")
      local filename = vim.fn.expand("%:t")

      -- Replace placeholders ($FILENAME$, $DATE$)
      vim.api.nvim_buf_call(0, function()
        -- THIS IS WHERE THE E486 ERROR OCCURS, so we must be sure the template was loaded!
        vim.cmd(":%s/$FILENAME$/" .. filename .. "/g")
        vim.cmd(":%s/$DATE$/" .. date .. "/g")
      end)

      -- Move cursor to the second line for immediate editing
      vim.cmd("2")
    end
  end
end

-- Setup the Autocommand Group
local skeleton_group = vim.api.nvim_create_augroup("SkeletonFiles", { clear = true })

-- Define the Autocommand (External check for template directory)
vim.api.nvim_create_autocmd({ "BufNewFile" }, {
  group = skeleton_group,
  pattern = { "*" },
  callback = function(opts)
    -- We can simplify the external check here, as load_skeleton now has an internal check too.
    load_skeleton()
  end,
})
