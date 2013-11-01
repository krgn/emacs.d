(use-package zenburn-theme
  :init
  (progn
    (load-theme 'wombat t)

    (use-package powerline
      :init
      (progn
        (powerline-default-theme)
        (set-face-attribute 'mode-line nil :box nil)
        ;; ;; mode-line stuff
        ;; (set-face-attribute 'mode-line nil :background "dim gray" :foreground "gainsboro" :box nil)
        ;; (set-face-attribute 'mode-line-buffer-id nil :background "dim gray" :foreground "gainsboro" :box nil)
        ;; (set-face-attribute 'mode-line-emphasis nil :box nil)
        ;; (set-face-attribute 'mode-line-highlight nil :box nil)
        ;; (set-face-attribute 'mode-line-inactive nil :background "White"  :foreground  "DimGrey" :box nil)
        ))
    
    ;; turn off clutter
    (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
    (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
    (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))))
