(helm-mode 1)

(setq helm-adaptative-mode t)
(setq helm-adaptive-history-length 100)
(setq helm-quick-update t)
(setq helm-reuse-last-window-split-state t)
(setq helm-candidate-number-limit 20)
(setq helm-split-window-in-side-p nil)
(setq helm-default-external-file-browser "pcmanfm")
(setq helm-m-occur-idle-delay 0.1)
<<<<<<< variant A
(setq helm-ff-transformer-show-only-basename nil)
>>>>>>> variant B
(setq helm-findutils-ignore-boring-files t)
(setq helm-ff-transformer-show-only-basename nil)
####### Ancestor
======= end

(loop for mode in '(enh-ruby-mode js3-mode html-mode android-mode java-mode css-mode)
      do (add-to-list 'helm-buffers-favorite-modes mode))

(loop for ext in '("\\.swf$" "\\.elc$" "\\.pyc$" "\\.o$" ".#$")
      do (add-to-list 'helm-boring-file-regexp-list ext))

(loop for name in '("\\*magit-process" "\\*magit-edit-log" "\\*Customize.*$")
      do (add-to-list 'helm-boring-buffer-regexp-list name))

;; for jumping around between sources
(define-key helm-map (kbd "<C-tab>") 'helm-next-source)

(global-set-key (kbd "M-t") 'helm-projectile)
(global-set-key (kbd "C-x f") 'helm-for-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(provide 'krgn-helm)
