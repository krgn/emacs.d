(require 'android-mode)

;; <--- default keymap --->
;; (defconst android-mode-keys
;;   '(("d" . android-start-ddms)
;;     ("e" . android-start-emulator)
;;     ("l" . android-logcat)
;;     ("C" . android-ant-clean)
;;     ("c" . android-ant-debug)
;;     ("i" . android-ant-installd)
;;     ("r" . android-ant-reinstall)
;;     ("u" . android-ant-uninstall)
;;     ("a" . android-start-app)))

(add-to-list 'file-name-handler-alist '("\\.class$" . javap-handler))
 
(setq android-mode-sdk-dir "/opt/android-sdk/")

(add-hook 'android-mode-hook (highlight-todo))

(provide 'krgn-android)
