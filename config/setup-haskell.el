(use-package haskell-mode
  :init
  (progn
    (use-package hi2
      :init
      (progn
        (add-hook 'haskell-mode-hook 'turn-on-hi2)))

    (add-hook 'haskell-mode-hook 'turn-on-haskell-doc)
    (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)

    (add-hook 'haskell-mode-hook 'flymake-haskell-multi-load)))
