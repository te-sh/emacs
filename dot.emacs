;; -*- mode: emacs-lisp -*-

;;==============================
;; key config
;;==============================

;; use command/option for meta/alt
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char))

;;==============================
;; other settings
;;==============================

(add-hook 'js-mode-hook
            (lambda ()
              (make-local-variable 'js-indent-level)
              (setq js-indent-level 2)))

;; add snippets for procon
(add-to-list 'yas-snippet-dirs "~/projects/procon2/emacs/snippets")
(yas-reload-all)
