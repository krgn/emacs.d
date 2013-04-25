(require 'js3-mode)

(setq c-basic-offset 2)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js3-mode))

(provide 'krgn-js)
