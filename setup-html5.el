(add-to-list 'load-path "~/.emacs.d/site-lisp/html5-el")

(eval-after-load "rng-loc" '(add-to-list 'rng-schema-locating-files "~/.emacs.d/site-lisp/html5-el/schemas.xml"))

(require 'whattf-dt)

;; html should trigger nxml-mode
;;(add-to-list 'auto-mode-alist '("\\.html\\'" . nxml-mode))

;; css indentation like js/c
(setq css-indent-offset 2)

(provide 'setup-html5)
