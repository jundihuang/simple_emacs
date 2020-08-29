(yas-global-mode 1)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(setq ruby-insert-encoding-magic-comment nil)


;; copy line

(defun copy-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (move-beginning-of-line 1)
  )

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )

(defun duplicate-region()
  (interactive)
  (kill-sentence)
  (yank)
  (open-line 1)
  (next-line 2)
  (yank)
  )

(global-set-key (kbd "C-c l") 'copy-line)
(global-set-key (kbd "C-c n") 'duplicate-line)
(global-set-key (kbd "C-c c r") 'duplicate-region)

(global-set-key (kbd "C-c C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-;") 'comment-line)

;; 保存去除多余空格
(add-hook 'before-save-hook 'my-prog-nuke-trailing-whitespace)

(defun my-prog-nuke-trailing-whitespace ()
  (when (derived-mode-p 'prog-mode)
    (delete-trailing-whitespace)))

;; 自动在最后加入一行
(setq require-final-newline t)

;; 系统剪贴复制
(setq x-select-enable-clipboard t)

(provide 'init-edit)
