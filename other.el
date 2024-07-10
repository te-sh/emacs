;; -*- mode: emacs-lisp -*-

;;==============================
;; other settings
;;==============================

;; use command/option for meta/alt
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char))

;; customize variables
(custom-set-variables
 '(create-lockfiles nil)
 '(indent-tabs-mode nil)
 '(make-backup-files nil)
 '(tool-bar-mode nil))
