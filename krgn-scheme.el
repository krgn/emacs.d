(require 'chicken-scheme)

(setq scheme-program-name "csi -:c")
(setq scheme-tags-location "~/.emacs.d/scheme-tags")

;; indent just like define
(put 'handle-exceptions 'scheme-indent-function 'defun)
(put 'make-request 'scheme-indent-function 'defun)

(provide 'krgn-scheme)
