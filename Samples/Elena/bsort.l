#class BSort
{
    #field theArray.

    #method of : anArray
    [
        theArray := anArray.

        'indexscan of:(theArray::getEnumerator of:{::getStart = theArray::getCount / 2 - 1; ::getEnd = 0; ::getStep = -1})
            run: {
                proceed : anIndexer
                [
                    self $downHeap:
                        {::getMinimal = anIndexer::getIndex; ::getMaximal = anArray::getCount - 1 }.
                ]
            }.

        'indexscan of:theArray::getBackwardEnumerator
            run: {
                proceed : anIndexer
                [
                    anIndexer exchange:(theArray::getIndexer goto:0).

                    self $downHeap:{::getMinimal = 0; ::getMaximal = anIndexer::getIndex - 1}.
                ]
            }.
        
    ]

    #method $downHeap : aRange
    [
        #var aRoot := 'Integer << aRange::getMinimal.
        #var aBottom := aRange::getMaximal.

        'loop of:{ ? [ ^ (aRoot * 2 < aBottom)?. ]}
            run: {
                proceed [
                    #var aMaxChild := 'nil.
                    #var aChild := aRoot * 2 + 1.
                    (aChild==aBottom)?
                        [ aMaxChild := aChild. ]
                        | ![
                            ((theArray at:aChild) > (theArray at:(aChild + 1)))?
                                [ aMaxChild := aChild. ]
                                | ![ aMaxChild := aChild + 1. ].
                        ].

                    ((theArray at:aRoot) < (theArray at:aMaxChild))?
                        [  
                            theArray::getIndexer goto:aRoot exchange:(theArray::getIndexer goto:aMaxChild).
                        ]
                        | ! [ ^self fail. ].

                    aRoot << aMaxChild.
                ]
            }.
    ]
}


#class Program
{
    #method readArray : anArray
    [
        'indexscan of:anArray::getEnumerator
            run: {
                proceed : anIndexer
                [
                    anIndexer set:('Integer << ext'console'Reader).
                ]
            }.
    ]

    #method bsortArray : anArray
    [
        BSort of:anArray.
    ]

    #method printArray : anArray
    [
        ext'console'patterns'ListPrint proceed:anArray.
    ]

    #method new
    [
        'Console << "Enter the array size:".

        #var aSize := 'Integer << ext'console'Reader.

        #var anArray := std'memory'ArrayFactory create:aSize.

        self readArray:anArray
             bsortArray:anArray
             printArray:anArray.
    ]
}
