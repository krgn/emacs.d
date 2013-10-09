(use-package jde-mode
  :mode ("\\.java\\'" . jde-mode)
  :load-path "site-lisp/jdee-2.4.1/lisp"
  :init
  (progn
    (autoload 'jde-mode "jde" "JDE mode" t)))
