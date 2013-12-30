;; for your local additions
(add-to-list 'load-path "~/.emacs.d")

;; for my additions
(add-to-list 'load-path "~/.emacs-ben")

;; use tabs, and display them as four spaces
(setq indent-tabs-mode t)
;;(setq-default indent-tabs-mode t)
(setq default-tab-width 4)
;;(setq tab-width 4)
(global-set-key (kbd "TAB") 'self-insert-command)

(setq-default show-trailing-whitespace t)

;; add/style line numbers
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%3d ")

;; better wrapping (no more /s)
(set-display-table-slot standard-display-table 'wrap ?\ )
;; see also http://www.emacswiki.org/emacs/LineWrap

;; stop the creation of those STUPID ~ backup files (let me handle backups, thank-you-very-much)
(setq backup-inhibited t)
;; stop the creation of those equally irritating ## files (which are autosave files, but it leaves them around if I quit without saving!	clean up after yourself, you SLOB of an editor!)
(setq auto-save-default nil)

;; auto-completion
(add-to-list 'load-path "~/.emacs-ben/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs-ben/auto-complete/dict")
(ac-config-default)

(custom-set-variables
	;; custom-set-variables was added by Custom.
	;; If you edit it by hand, you could mess it up, so be careful.
	;; Your init file should contain only one such instance.
	;; If there is more than one, they won't work right.
	'(cua-mode t nil (cua-base))
	'(inhibit-startup-screen t)
	'(scroll-bar-mode (quote right))
	'(show-paren-mode t))

(custom-set-faces
	;; custom-set-faces was added by Custom.
	;; If you edit it by hand, you could mess it up, so be careful.
	;; Your init file should contain only one such instance.
	;; If there is more than one, they won't work right.
)

;; ruby mode
(add-to-list 'auto-mode-alist
	'("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
	'("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

;; vim:set ft=lisp:

;; change graphic emacs backround color
(when (display-graphic-p)
	(set-background-color "darkgrey"))
