(require 'powerline)

(custom-set-faces
 '(powerline-active1 ((t (:foreground "#444" :background "OliveDrab" :box nil))))
 '(powerline-active2 ((t (:foreground "#444" :background "GreenYellow" :box nil)))))

 ;; give your mode-line curves
(setq powerline-arrow-shape 'arrow14)
(powerline-default-theme)


(provide 'krgn-powerline)
