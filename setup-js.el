(use-package js3-mode
  :init
  (progn
    (setq c-basic-offset 2)
    (add-to-list 'auto-mode-alist '("\\.js\\'" . js3-mode))
    (add-to-list 'auto-mode-alist '("\\.json\\'" . js3-mode))))
