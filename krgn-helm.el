(helm-mode 1)

(global-set-key (kbd "M-t") 'helm-projectile)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(provide 'krgn-helm)
