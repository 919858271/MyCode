import gmail

username    = 'xxxx@163.com' #发件人
passwd      = 'xxxx' #授权码
host        = 'smtp.163.com' #服务器
reviver     = ['xxxx@qq.com','xxxx@qq.com']#收件人
reviver_cc  = ['xxxx@qq.com','xxxx@qq.com']#抄送人
title       = u'python邮件测试'#主题
contents    = u'测试内容' #邮件内容
attachments = r'C:\Users\xxxx\Desktop\test.txt' #附件

mail = gmail.SMTP(user = username, password = passwd, host=host)
mail.send(to=reviver,cc=reviver_cc, subject = title,contents = contents, attachments=attachments)