(require 'chicken-scheme)

(setq scheme-program-name "csi -:c")
(setq scheme-tags-location "~/.emacs.d/scheme-tags")

;; indent handle-exceptions like defines
(put 'handle-exceptions 'scheme-indent-function 'defun)

(provide 'krgn-scheme)
