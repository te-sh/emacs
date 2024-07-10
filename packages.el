;;==============================
;; packages
;;==============================

;; initialize
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)
(setq use-package-always-ensure t)

;;------------------------------
;; packages for behaviours
;;------------------------------

(use-package diminish)

(use-package exec-path-from-shell
  :config
  (when (eq system-type 'darwin)
    (setq shell-file-name "/bin/zsh"))
  (exec-path-from-shell-initialize))

(use-package add-node-modules-path
  :hook (js-mode web-mode))

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

(use-package highlight-indent-guides
  :hook
  ((crystal-mode web-mode yaml-mode) . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-responsive t)
  (highlight-indent-guides-method 'bitmap))

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
  (global-flycheck-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode))

(use-package flycheck-crystal)

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

(use-package coffee-mode)

(use-package css-mode
  :ensure nil
  :custom
  (css-indent-offset 2))

(use-package crystal-mode
  :mode "\\.cr\\'")

(use-package d-mode)

(use-package groovy-mode
  :mode "\\.gradle\\'")

(use-package nim-mode)

(use-package restclient)

(use-package rjsx-mode
  :custom
  (js2-strict-missing-semi-warning nil)
  (js2-missing-semi-one-line-override nil)
  (js-switch-indent-offset 2)
  :custom-face
  (rjsx-attr ((t . (:inherit font-lock-type-face)))))

(use-package rspec-mode)

(use-package web-mode
  :mode
  (("\\.html\\(\\.erb\\)?\\'" . web-mode))
  :custom
  (web-mode-code-indent-offset 2)
  (web-mode-markup-indent-offset 2))

;;==============================
;; treesit
;;==============================

(package-install 'setup)
(require 'setup)

(setup-define :mode-remap
  (lambda (src-mode)
    `(add-to-list 'major-mode-remap-alist '(,src-mode . ,(setup-get 'feature)))))

(setup treesit
  (:option treesit-language-source-alist
           '((astro "https://github.com/virchau13/tree-sitter-astro")
             (css "https://github.com/tree-sitter/tree-sitter-css")
             (dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")
             (go "https://github.com/tree-sitter/tree-sitter-go")
             (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
             (json "https://github.com/tree-sitter/tree-sitter-json")
             (markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown"
                       "split_parser" "tree-sitter-markdown/src")
             (markdown-inline "https://github.com/tree-sitter-grammars/tree-sitter-markdown"
                              "split_parser" "tree-sitter-markdown-inline/src")
             (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
             (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
             (yaml "https://github.com/ikatyang/tree-sitter-yaml")))
  (mapc (lambda (lang)
          (unless (treesit-language-available-p lang nil)
            (treesit-install-language-grammar lang)))
        (mapcar #'car treesit-language-source-alist)))

(setup astro-ts-mode
  (:package astro-ts-mode)
  (:file-match "\\.astro\\'"))

(setup dockerfile-ts-mode
  (:file-match "[/\\]\\(?:Containerfile\\|Dockerfile\\)\\(?:\\.[^/\\]*\\)?\\'"))

(setup go-ts-mode
  (:file-match "\\.go\\'")
  (:option go-ts-mode-indent-offset 4)
  (:option tab-width 4))

(setup js-ts-mode
  (:file-match "\\.m?js\\'")
  (:mode-remap javascript-mode))

(setup json-ts-mode
  (:file-match "\\.json\\'")
  (:option js-indent-level 2))

(setup markdown-ts-mode
  (:package markdown-ts-mode)
  (:autoload-this)
  (:file-match "\\.md\\'"))

(setup typescript-ts-mode
  (:file-match "\\.ts\\'"))

(setup yaml-ts-mode
  (:file-match "\\.ya?ml\\'"))
