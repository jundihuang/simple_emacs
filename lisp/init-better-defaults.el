
(setq ring-bell-function 'ignore)

(global-hungry-delete-mode)

;; 自动加载外部修改过的文件
(global-auto-revert-mode t)

;; 关闭行号
(global-linum-mode -1)

;; 关闭菜单栏
(menu-bar-mode -1)

;; 关闭工具栏
(tool-bar-mode -1)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(abbrev-mode t)
 (define-abbrev-table 'global-abbrev-table '(
                                              ;; signature
                                              ("8en" "jayce")
                                              ))

;; 关闭自动备份文件
(setq make-backup-files nil)

;; 关闭自动保存文件
(setq auto-save-default nil)

(recentf-mode 1)			
(setq recentf-max-menu-items 25)

;; 匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(delete-selection-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(require 'popwin)    ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode t)

;; markdown command
(custom-set-variables
 '(markdown-command "/usr/local/bin/pandoc"))

(setq ring-bell-function 'ignore)

(fset 'yes-or-no-p 'y-or-n-p)

(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; 配置 Occur Mode 使其默认搜索当前被选中的或者在光标下的字符串
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)

(provide 'init-better-defaults)
