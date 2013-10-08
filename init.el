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


;; first, elpa needs to be set up for anything else to happen...
(load-file "~/.emacs.d/setup-elpa.el")
;; next, use-package is second most important library to load 
(require 'use-package)

(load-file "~/.emacs.d/setup-path.el")
(load-file "~/.emacs.d/setup-font.el")
(load-file "~/.emacs.d/setup-aliases.el")
(load-file "~/.emacs.d/setup-utilities.el")
(load-file "~/.emacs.d/setup-general.el")
(load-file "~/.emacs.d/setup-evil.el")
(load-file "~/.emacs.d/setup-auto-complete.el")
(load-file "~/.emacs.d/setup-win.el")
(load-file "~/.emacs.d/setup-yaml.el")
(load-file "~/.emacs.d/setup-compile.el")
(load-file "~/.emacs.d/setup-magit.el")
(load-file "~/.emacs.d/setup-org.el")
(load-file "~/.emacs.d/setup-ruby.el")
(load-file "~/.emacs.d/setup-android.el")
(require 'setup-js)
(require 'setup-yasnippet)
(require 'setup-erc)
(require 'setup-scheme)
(require 'setup-clojure)
(require 'setup-keychain)
(require 'setup-md)
(require 'setup-ido-imenu)
(require 'setup-bindings)
(require 'setup-dired)
(require 'setup-workgroups)
(require 'setup-shell)
(require 'setup-smartparens)
(require 'setup-theme)
(require 'setup-mu)
(require 'setup-supercollider)
