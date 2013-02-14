;; init.el
;; ------------------------
;; in large parts copied from all over the place,
;; but in particular from http://github/bodil/emacs.d :)

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

(require 'krgn-theme)
(require 'krgn-elpa)
(require 'krgn-ido-imenu)
(require 'krgn-auto-complete)
(require 'krgn-window-split)
(require 'krgn-move-lines)
(require 'krgn-yaml)
(require 'krgn-compile)
(require 'krgn-magit)
(require 'krgn-org)
(require 'krgn-cua)
(require 'krgn-rails)
(require 'krgn-rhtml)
(require 'krgn-general)
(require 'krgn-bindings)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("944f3086f68cc5ea9dfbdc9e5846ad91667af9472b3d0e1e35a9633dcab984d5" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "grey12")))))
