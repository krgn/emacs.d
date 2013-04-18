;; I don't suspend like that
(global-set-key "\C-z" nil)

;; navigation
(global-set-key "\M-{" nil)
(global-set-key "\M-}" nil)
(global-set-key "\M-n" 'forward-paragraph)
(global-set-key "\M-p" 'backward-paragraph)

;; move lines
(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)

;; don't just close emacs
(global-set-key (kbd "C-x C-c") 'ask-before-closing)

;; magit
(global-set-key "\C-xg" 'magit-status)

;; jumping between windows
(global-set-key (kbd "C-x n") 'next-multiframe-window)
(global-set-key (kbd "C-x p") 'previous-multiframe-window)

;; my compile shortcute (for rspec, mostly)
(global-set-key (kbd "C-c r") 'compile)

;; ido/menu stuff
(global-set-key "\C-ci" 'ido-goto-symbol)
(global-set-key "\C-cp" 'mine-goto-symbol-at-point)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'krgn-bindings)

