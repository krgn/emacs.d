(require 'js3-mode)

(setq c-basic-offset 2)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js3-mode))

;; this is needed to keep my bindings intact across major modes
(define-key js3-mode-map (kbd "C-x n") 'next-multiframe-window)
(define-key js3-mode-map (kbd "C-x p") 'previous-multiframe-window)

(provide 'krgn-js)
