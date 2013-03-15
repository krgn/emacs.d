(load-theme 'dichromacy)

;; font
(set-default-font "Monospace-10")
(setq default-frame-alist '((font . "Monospace-10")))

(custom-set-faces
 '(hl-line ((t (:background "grey90")))))

;; turn off clutter
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(provide 'krgn-theme)
