;; init.el
;; ------------------------
;; in large parts copied from all over the place,
;; but in particular from http://github/bodil/emacs.d :)

;; FIND VAR NAMES:
;; <YoungFrog> krgn: if you hit RET (or clic) on "State" and use ":" (show saved
;;             lisp expr), you'll get the exact variable name on the left and the
;;             value on the right (in the box)  [12:03]

;; emacs -batch -f batch-byte-compile *.el

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

(load-file "~/.emacs.d/setup-path.el")
(load-file "~/.emacs.d/setup-font.el")

(require 'setup-elpa)
(require 'setup-auto-complete)
(require 'setup-win)
(require 'setup-move-lines)
(require 'setup-yaml)
(require 'setup-compile)
(require 'setup-magit)
(require 'setup-org)
(require 'setup-cua)
(require 'setup-general)
(require 'setup-rails)
(require 'setup-rhtml)
(require 'setup-android)
(require 'setup-js)
(require 'setup-yasnippet)
(require 'setup-erc)
(require 'setup-scheme)
(require 'setup-clojure)
(require 'setup-keychain)
(require 'setup-md)
(require 'setup-html5)
(require 'setup-ido-imenu)
(require 'setup-bindings)
(require 'setup-dired)
(require 'setup-workgroups)
(require 'setup-shell)
(require 'setup-aliases)
(require 'setup-smartparens)
(require 'setup-theme)
(require 'setup-mu)
(require 'setup-supercollider)
