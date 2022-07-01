;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(display-line-numbers t)
 '(display-line-numbers-width nil)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(global-hl-line-mode nil)
 '(horizontal-scroll-bar-mode nil)
 '(icomplete-mode t)
 '(inhibit-startup-screen nil)
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (company auctex add-hooks tide lsp-mode js2-mode rust-mode multiple-cursors cl-lib vscode-dark-plus-theme ample-theme list-packages-ext neotree magit iedit yasnippet-snippets find-file-in-project elpy)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 112 :width normal :foundry "ENVY" :family "Envy Code R VS"))))
 '(bold ((t (:weight normal))))
 '(border ((t nil)))
 '(scroll-bar ((t (:background "#f2f1f0" :foreground "#4c4c4c" :width ultra-condensed))))
 '(success ((t (:foreground "chocolate3" :weight bold))))
 '(term-color-blue ((t (:background "deep sky blue" :foreground "deep sky blue"))))
 '(tty-menu-disabled-face ((t (:background "turquoise1" :foreground "lightgray"))))
 '(tty-menu-enabled-face ((t (:background "turquoise" :foreground "yellow" :weight normal)))))

;; -*- mode: elisp -*-

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen


;;Set transparency of emacs
;;https://www.emacswiki.org/emacs/TransparentEmacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))
(set-frame-parameter (selected-frame) 'alpha '95)


;; Electric pair mode
(electric-pair-mode)

;; Show the matching parenthesis
(show-paren-mode 1)

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (package-initialize)
(put 'set-goal-column 'disabled nil)

;; Keybindings
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-d") 'mc/mark-next-like-this-word)
(global-set-key (kbd "C-c C-d") 'mc/mark-all-words-like-this)
(global-set-key (kbd "C-c C-i") 'mc/mark-previous-line)
(global-set-key (kbd "C-c C-k") 'mc/mark-next-line)

;; Bash shell
(setq-default explicit-shell-file-name "/bin/bash")

;; Menu and tool bars
(menu-bar-mode -1)
(tool-bar-mode  -1)

;; VS Code theme
(load-theme 'vscode-dark-plus t)

;; Character count on line
(setq global-mode-string
      '(:eval (format "%d chars" (- (line-end-position) (line-beginning-position)))))

;; yasnippet setup
;; (require 'yasnippet)
;; (yas-global-mode 1)

;;rust-mode indent
;; (add-hook 'rust-mode-hook
;;           (lambda () (setq indent-tabs-mode nil)))

;;use-package
;; (require 'use-package)

;; NVM
(setq exec-path (append exec-path '("~/.nvm/versions/node/v14.17.3/bin")))

;;js2-mode
;; (use-package lsp-mode
;;   :ensure t)

;;flycheck
;; (use-package flycheck)

;;add-hooks
;; (require 'add-hooks)

;; company mode global
;; (add-hook 'after-init-hook 'global-company-mode)

;;auctex
;; (eval-after-load "tex" '(add-to-list 'TeX-command-list '("Make" "make" TeX-run-compile nil t)))
;; (setq-default TeX-master nil)
;; (setq TeX-parse-self t)
;; (setq TeX-auto-save t)
;; (setq-default TeX-PDF-mode t)

;; Disable the splash screen (to enable it again, replace the t with 0)
(setq inhibit-startup-screen t)
(put 'narrow-to-region 'disabled nil)
