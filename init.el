;; init.el
;; ------------------------
;; in large parts copied from all over the place,
;; but in particular from http://github/bodil/emacs.d :)

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

(require 'krgn-theme)
(require 'krgn-elpa)
(require 'krgn-general)
(require 'krgn-bindings)
(require 'krgn-ido-imenu)
(require 'krgn-auto-complete)
