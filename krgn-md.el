(require 'markdown-mode)
(require 'flyspell)

;; globally set markdown-mode to handle .md text files
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; enable flymake by default for all markdown buffers
(add-hook 'markdown-mode-hook '(lambda () (flyspell-mode t)))

;; highlight certain keywords like TODO/FIXME etc..
(add-hook 'markdown-mode-hook '(lambda () (highlight-todo)))

(provide 'krgn-md)
