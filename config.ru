def list(env)
  vars = env.inject('') { |h, (k, v)|
    h << "<dt>%s</dt><dd>%s</dd>" % [k, v]
    h
  }
  (<<-HTML).gsub(/__LIST__/, vars)
    <html>
      <head>
        <title>rack env</title>
        <style type="text/css">
          *{font-family:monospace;}dt{float:left;font-weight:bold; margin-right:1em;}dd{color:#333;}
        </style>
      </head>
      <body>
        <dl>
          __LIST__
        </dl>
      </body>
    </html>
  HTML
end
run lambda { |env| 
  [200, { 'Content-Type' => 'text/html' }, list(env)]  
}