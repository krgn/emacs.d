;; Zenburn theme and fixes for other modes
(load-theme 'zenburn t)

(custom-set-faces
 '(hl-line 
   ((t (:background "grey20"))))
 '(helm-ff-directory 
   ((t :background "grey20")))
 '(helm-source-header 
   ((t (:family "Sans Serif" :height 1.0 :weight bold :underline nil :box
                (:line-width -1 :color nil :style released-button)
                :foreground "#F0DFAF" :background "#2B2B2B"))))
 '(helm-selection 
   ((t (:underline nil :background "gold" :foreground "black")))))

;; font
(set-default-font "Monospace-10")
(setq default-frame-alist '((font . "Monospace-10")))

(set-face-attribute 'mode-line nil :background "MidnightBlue" :box nil)
(set-face-attribute 'mode-line-buffer-id nil :foreground "#fff" :box nil)
(set-face-attribute 'mode-line-emphasis nil :box nil)
(set-face-attribute 'mode-line-highlight nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;; linum mode
(set-face-attribute 'linum nil :foreground "#666" )

;; turn off clutter
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(provide 'krgn-theme)
