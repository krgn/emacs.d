(global-set-key (kbd "<f11>") 'shell)

(setq explicit-shell-file-name "/bin/zsh")
(setq shell-file-name "zsh")
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

(provide 'krgn-shell)
