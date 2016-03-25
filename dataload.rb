require 'csv'

def dataload(inputfilepath)
  puts('inputdata:')
  words = []
  CSV.foreach('sample.csv', col_sep: '#').each_with_index do |row, index|
    words[index] = row
    p row
  end
  return words
end
