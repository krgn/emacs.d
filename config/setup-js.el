(use-package js3-mode
  :disabled t) 

(use-package js2-mode
  :init
  (progn
    (setq c-basic-offset 2)
    (flymake-mode-on)

    (use-package flymake-jshint
      :init
      (progn
        (add-hook 'js2-mode-hook 'flymake-jshint-load)))

    (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
    (add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))))
