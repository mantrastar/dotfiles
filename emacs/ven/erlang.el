;; Erlang mode for emacs.
;; See http://www.erlang.org/doc/apps/tools/erlang_mode_chapter.html
(setq load-path (cons (file-truename "/usr/local/erlang/lib/tools-2.6.8/emacs") load-path))
(setq erlang-root-dir (file-truename "/usr/local/erlang"))
(setq exec-path (cons (file-truename "/usr/local/erlang/bin") exec-path))
(require 'erlang-start)

;; Check erlang syntax on the fly.
(require 'erlang-flymake)
