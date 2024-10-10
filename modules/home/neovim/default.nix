{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;

    withNodeJs = true;
    withPython3 = true;

    coc.enable = true;
    coc.settings = {
      "suggest.noselect" = true;
      "suggest.enablePreview" = true;
      "suggest.enablePreselect" = false;
      "suggest.disableKind" = true;
    };

    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-code-dark
      lightline-vim
      vim-floaterm
    ];

    extraConfig = ''
            set nocompatible
            set encoding=utf-8
            set autoindent
            set smartindent

            :colorscheme codedark

            command! -nargs=0 -bang RUN call SmartRun()

            function! SmartRun()
             let filename = expand('%')
             let file_extension = fnamemodify(filename, ':e')
             let current_dir = getcwd()

             if file_extension ==# 'c'
               let cmd = "cd " . current_dir . " && gcc % -o %:r.out && ./%:r.out && rm ./%:r.out"
             else if file_extension =# 'cpp'
               let cmd = "cd " . current_dir . " && g++ % -o &:r.out && ./%:r.out && rm ./%:r.out"
             else
               let cmd = ""
             endif

             if !empty(cmd)
               let cmd .= " && read -p 'Press Enter to continue'"
      	 execute "FloatermNew --wintype=normal --height=0.4 --position=bottom sh -c " . shellescape('clear && ' .cmd )
             else
               echo "Unsupported file type!"
             endif
            endfunction
            
            set laststatus=2
            let g:lightline = {
              \ 'colorscheme': 'nord',
      	\ 'active': {
      	\    'left': [ ['mode', 'paste'], ['readonly', 'filename', 'modified', 'lineinfo'] ],
      	\    'right': [ ['filetype'] ]
      	\ },
      	\ }

            function! LightlineLineInfo()
              let current_line = line('.')
      	let total_lines = line('$')
      	let percent = current_line * 100 / total_lines
      	return 'Line' . current_line . '(' . percent . '%)'
            endfunction

            let g:lightline.component_function = {
              \ 'lineinfo': 'LightlineLineInfo',
      	\ }

    '';

    extraPackages = with pkgs; [
      # Nix
      nil
      deadnix
      statix
      alejandra

      # Lua
      lua-language-server
      stylua

      # C/C++
      gcc
      clang
      clang-tools # for headers stuff

      # Etc
      rust-analyzer
      ripgrep
      fd
    ];
  };

}
