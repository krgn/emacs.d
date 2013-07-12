(require 'smartparens)
(require 'smartparens-config)

;; global mode 
(smartparens-global-mode t)

;; highlights matching pairs
(show-smartparens-global-mode t)

(sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

;;; markdown-mode
(sp-with-modes '(markdown-mode html-mode nxml-mode sgml-mode)
  (sp-local-tag "<"  "<_>" "</_>" :transform 'sp-match-sgml-tags))

;;; lisp modes
(sp-with-modes sp--lisp-modes
  (sp-local-pair "(" nil :bind "C-("))

(provide 'krgn-smartparens)
