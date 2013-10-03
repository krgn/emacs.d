;; I don't suspend like that
(global-set-key "\C-z" nil)

;; redo+
(global-set-key (kbd "C-+") 'redo)

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
(global-set-key (kbd "C-c i") 'ido-goto-symbol)
(global-set-key (kbd "C-c p") 'mine-goto-symbol-at-point)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; toggle buffer layout
(global-set-key (kbd "C-x t") 'toggle-window-split)

;; replace-regexp binding
(global-set-key (kbd "C-x w") 'replace-regexp)

;; don't want this binding at all (lead to 'emacs release news')
(global-set-key (kbd "C-h C-n") nil)

;; global ace jump thing
(global-set-key (kbd "C-c f") 'ace-jump-mode)
(global-set-key (kbd "C-x b") 'switch-to-buffer)
(global-set-key (kbd "C-x C-b") 'ace-jump-buffer)

(provide 'krgn-bindings)

