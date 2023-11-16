-- Convert the current markdown file to pdf using pandoc
vim.opt_local.makeprg = "pandoc '%' -o %:r.pdf && echo Created file: %:r.pdf"
