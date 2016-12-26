'Sort an array.
'Adapted from Beginning Programming for Dummies by Wallace Wang

mainwin 80 'give me 80 columns
MaxSize = 25
dim NumArray(MaxSize)
for i = 1 to MaxSize
  NumArray(i) = int(rnd(1)*10) + 1
  print NumArray(i); " ";
next i
print "(Initial array)"

call QSort 1, MaxSize

for i = 1 to MaxSize
  print NumArray(i); " ";
next i
print "(Sorted array)"
end

sub QSort Start, Finish
  i = Start
  j = Finish
  x = NumArray(int((i+j)/2))
  while i <= j
    while NumArray(i) < x
      i = i + 1
    wend
    while NumArray(j) > x
      j = j - 1
    wend
    if i <= j then
      a = NumArray(i)
      NumArray(i) = NumArray(j)
      NumArray(j) = a
      i = i + 1
      j = j - 1
    end if
  wend
  for k = 1 to Finish
    print NumArray(k); " ";
  next k
  print
  if j > Start then call QSort Start, j
  if i < Finish then call QSort i, Finish
end sub
