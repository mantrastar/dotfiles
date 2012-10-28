; UI
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

; Meta
(global-set-key "\C-x\C-m" 'execute-extended-command)

; Load path
(add-to-list 'load-path "~/.emacs.d/ven")
(add-to-list 'load-path "~/.emacs.d/world")
(add-to-list 'load-path "~/.emacs.d/world/auto-complete")
(add-to-list 'load-path "~/.emacs.d/world/dirtree")

; Color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-monokai)

; Auto complete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/world/auto-complete/dict")
(require 'auto-complete-config)
(ac-config-default)

; Directory tree
(require 'dirtree)

; Window movement
(require 'windmove)
(windmove-default-keybindings)
;;(global-set-key (kbd "M-<left>")  'windmove-left)
;;(global-set-key (kbd "M-<right>") 'windmove-right)
;;(global-set-key (kbd "M-<up>")    'windmove-up)
;;(global-set-key (kbd "M-<down>")  'windmove-down)

; Auto revert buffers when file changes on disk
(global-auto-revert-mode 1)

; Kill all buffers
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer 
        (delq (current-buffer) 
              (remove-if-not 'buffer-file-name (buffer-list)))))

; Whitespace
(require 'whitespace)
(define-key text-mode-map (kbd "<tab>") 'tab-to-tab-stop)
(setq tab-stop-list (number-sequence 2 120 2))
(setq-default tab-width 2)
(setq-default c-basic-indent 2)
(setq-default c-tab-always-indent nil)
(setq-default sh-indentation 2)
(setq-default sh-basic-offest 2)
(setq-default indent-tabs-mode nil)

(defun set-tab-stop-width (width)
  "Set all tab stops to WIDTH in current buffer.
    
  This updates `tab-stop-list', but not `tab-width'.
    
  By default, `indent-for-tab-command' uses tabs to indent, see
  `indent-tabs-mode'."
  (interactive "nTab width: ")
  (let* ((max-col (car (last tab-stop-list)))
         ;; If width is not a factor of max-col,
         ;; then max-col could be reduced with each call.
         (n-tab-stops (/ max-col width)))
    (set (make-local-variable 'tab-stop-list)
         (mapcar (lambda (x) (* width x))
                 (number-sequence 1 n-tab-stops)))
    ;; So preserve max-col, by adding to end.
    (unless (zerop (% max-col width))
      (setcdr (last tab-stop-list)
              (list max-col)))))

(defun local-text-mode-hook-fun ()
  (set-tab-stop-width 2)
  (setq indent-tabs-mode nil))
    
(add-hook 'text-mode-hook 'local-text-mode-hook-fun)
(add-hook 'sh-mode-hook 'local-text-mode-hook-fun)

; Column numbers
(setq column-number-mode t)

; Make Emacs UTF-8 compatible for both display and editing:
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; save backup files in ~/.emacs_saves
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq auto-save-list-file-prefix "~/.emacs.d/.saves/auto-save-list/.saves-")

;; always make backups by copying
(setq backup-by-copying t)

;; UTF-8 everywhere by default
(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(add-to-list 'load-path "~/Source/lisp/slime/")

;;; Note that if you save a heap image, the character
;;; encoding specified on the command line will be preserved,
;;; and you won't have to specify the -K utf-8 any more.
(setq inferior-lisp-program "/usr/local/bin/ccl64 -K utf-8")

(require 'slime)
(setq slime-net-coding-system 'utf-8-unix)
(slime-setup '(slime-fancy))

;; Erlang
(load "erlang")

;; Shell scripting
(setq auto-mode-alist
      (append '(
                ("\\.zsh" . shell-script-mode)
                ("\\.zshrc" . shell-script-mode)
                ) auto-mode-alist))
