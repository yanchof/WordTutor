def output(path:, data:, mode: 0)
  File.open(path, "w") do |file|
    #ヘッダ部分
    file.puts("<!DOCTYPE html>")
    file.puts("<html>")
    file.puts("<head>")
    file.puts('<meta charset="utf-8">')
    file.puts('<link rel="stylesheet" type="text/css" href="print.css">')
    file.puts("</head>")
    #ボディ部分
    file.puts("<body>")
    file.puts("<article>")
    
    data.each_with_index do |wordset, index|
      if index % 14 == 0 then
        file.puts('<section class="sheet">')
      end
      
      if index % 7 == 0 then
        file.puts('<div class="half-sheet">')
      end

      putbox(index, wordset, file, mode: mode)

      #half-sheet end
      if index % 7 == 6 then
        file.puts('</div>')
      end

      #section end
      if index % 14 == 13 then
        file.puts('</section>')
      end
    end

    if (data.length-1) % 14 <= 6 then
      file.puts('</div>')
      puts('putted blank half-sheet')
      file.puts('<div class="half-sheet">')
      file.puts('</div>')
      
      file.puts('</section>')
    end

    file.puts('</article>')
    file.puts('</body>')
    file.puts('</html>')
  end
end

def putbox(index, wordset, file, mode: 0)
  file.print('<!--第', index, '項目-->', "\n")
  file.puts('<div class="problem-box">')
  file.puts('<div class="number">')
  file.print('<p>', index+1, '</p>', "\n")
  file.puts('</div>')
  file.puts('<div class="word-box">')
  #question part
  file.puts('<div class="question">')
  file.print('<span class="text">')
  if mode == 0 then
    file.print(wordset[0])
  elsif mode == 1 then
    file.print(wordset[0])
  elsif mode == 2 then
    file.print(wordset[1])
  end
  file.print('</span>')
  file.print("\n")
  file.puts('</div>')
  #answer part
  file.puts('<div class="answer">')
  file.print('<span class="text">')
  if mode == 0 then
    file.print(wordset[1])
  elsif mode == 1 then
    file.print('')
  elsif mode == 2 then
    file.print('')
  end
  file.print('</span>')
  file.print("\n")
  file.puts('</div>')

  file.puts('</div>') #word-box
  file.puts('</div>') #problem-box
end
