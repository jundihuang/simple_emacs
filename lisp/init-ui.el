

;; 打开即全屏
(setq  initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode t)


;; 关闭工具栏， tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 高亮当前行
(global-hl-line-mode)

;; 设置光标样式
(setq-default cursor-type 'box)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 设置字体大小
(set-face-attribute 'default nil :height 120)

;; 主题
;;(load-theme 'sanityinc-tomorrow-bright t)
(load-theme 'atom-one-dark t)

(provide 'init-ui)
