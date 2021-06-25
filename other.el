;; -*- mode: emacs-lisp -*-

;;==============================
;; other settings
;;==============================

;; use command/option for meta/alt
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char))

;; set js-mode indent
(add-hook 'js-mode-hook
            (lambda ()
              (make-local-variable 'js-indent-level)
              (setq js-indent-level 2)
              (make-local-variable 'js-switch-indent-offset)
              (setq js-switch-indent-offset 2)))

;; customize variables
(custom-set-variables
 '(create-lockfiles nil)
 '(indent-tabs-mode nil)
 '(make-backup-files nil)
 '(ruby-insert-encoding-magic-comment nil)
 '(tool-bar-mode nil))
