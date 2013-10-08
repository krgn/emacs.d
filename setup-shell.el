(use-package ansi-term
  :init
  (progn
    (global-set-key (kbd "<f11>") 'ansi-term)
    (setq explicit-shell-file-name "/usr/bin/zsh")
    (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)))
