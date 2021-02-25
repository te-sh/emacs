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
              (setq js-indent-level 2)))

;; add snippets for procon
(if (file-directory-p "~/.emacs.d/procon/snippets")
    (progn
      (add-to-list 'yas-snippet-dirs "~/.emacs.d/procon/snippets")
      (yas-reload-all)))
