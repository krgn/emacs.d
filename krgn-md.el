(require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(add-hook 'markdown-mode-hook (lambda () (highlight-todo)))
            

(provide 'krgn-md)
