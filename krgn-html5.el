(add-to-list 'load-path "~/.emacs.d/site-lisp/html5-el")

(eval-after-load "rng-loc" '(add-to-list 'rng-schema-locating-files "~/.emacs.d/site-lisp/html5-el/schemas.xml"))

(require 'whattf-dt)

(setq css-indent-offset 2)

(provide 'krgn-html5)
