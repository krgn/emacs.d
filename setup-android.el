(require 'android-mode)
(require 'javap-mode)

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
 
(defun javap-handler (op &rest args)
  "Handle .class files by putting the output of javap in the buffer."
  (cond
   ((eq op 'get-file-buffer)
    (let ((file (car args)))
      (with-current-buffer (create-file-buffer file)
        (call-process "javap" nil (current-buffer) nil "-verbose"
                      "-classpath" (file-name-directory file)
                      (file-name-sans-extension (file-name-nondirectory file)))
        (setq buffer-file-name file)
        (setq buffer-read-only t)
        (set-buffer-modified-p nil)
        (goto-char (point-min))
        (java-mode)
        (current-buffer))))
   ((javap-handler-real op args))))
 
(defun javap-handler-real (operation args)
  "Run the real handler without the javap handler installed."
  (let ((inhibit-file-name-handlers
         (cons 'javap-handler
               (and (eq inhibit-file-name-operation operation)
                    inhibit-file-name-handlers)))
        (inhibit-file-name-operation operation))
    (apply operation args)))

(setq android-mode-sdk-dir "/opt/android-sdk/")

(add-hook 'android-mode-hook (highlight-todo))

(provide 'setup-android)
