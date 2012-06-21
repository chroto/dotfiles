runtime! autoload/fugitive.vim
if exists('*fugitive#statusline')
    let &statusline='%< %f %{fugitive#statusline()} ... (other stuff)'
endif
