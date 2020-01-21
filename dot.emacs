;;==============================
;; package
;;==============================

;; initialize
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)
(setq use-package-always-ensure t)

;;------------------------------
;; packages for behaviours
;;------------------------------

(use-package exec-path-from-shell
  :if (eq system-type 'darwin)
  :config
  (exec-path-from-shell-initialize))

(use-package solarized-theme
  :config
  (load-theme 'solarized-light t))

(use-package ivy
  :diminish ivy-mode
  :bind ("C-c s" . counsel-rg)
  :config
  (ivy-mode 1))

(use-package ivy-hydra
  :after (ivy))

(use-package counsel
  :diminish counsel-mode
  :config
  (counsel-mode 1))

(use-package swiper
  :bind ("C-s" . swiper)
  :custom
  (swiper-include-line-number-in-search t))

(use-package wgrep)

(use-package magit
  :bind ("C-c g" . magit-status)
  :custom
  (magit-repository-directories '(("~/projects" . 1))))

(use-package shackle
  :custom
  (shackle-rules '(("\\magit\\(-refs\\)?: .*" :regexp t :same t)))
  :config
  (shackle-mode 1))

(use-package flycheck
  :config
  (global-flycheck-mode))

(use-package flycheck-d-unittest
  :custom
  (flycheck-dmd-include-path '("~/projects/procon2/codes-d"))
  :config
  (setup-flycheck-d-unittest))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package vterm
  :config
  (when (eq system-type 'darwin)
    (setq vterm-shell "/bin/zsh")))

;;------------------------------
;; packages for modes
;;------------------------------

(use-package crystal-mode
  :mode "\\.cr\\'")

(use-package d-mode)

(use-package dockerfile-mode
  :mode "Dockerfile\\'")

(use-package json-mode)

(use-package markdown-mode
  :mode "\\.md\\'"
  :custom
  (markdown-enable-math t))

(use-package nim-mode)

(use-package yaml-mode
  :mode "\\.yml\\'")

;;==============================
;; other settings
;;==============================

;; add snippets for procon
(add-to-list 'yas-snippet-dirs "~/projects/procon2/emacs/snippets")
(yas-reload-all)
