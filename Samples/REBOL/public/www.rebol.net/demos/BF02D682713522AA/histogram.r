REBOL [
 Title: "Histogram 3d - Demo Contest Entry"
 Author: "Andrew Hoadley"
 Version: 1.0.0
]


; Copyright (c) 2006, Andrew Hoadley

; Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
; and associated documentation files (the "Software"), to deal in the Software without restriction,
; including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
; and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
; subject to the following conditions:

; The above copyright notice and this permission notice shall be included in all copies or substantial 
; portions of the Software.

; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT 
; NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES 
; OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


;---------------------------------------
; Rave on about the engine ;-)
;

about-r3d: layout [
       
  size 500x520
  backeffect [gradient 0x1 blue water]
  Origin 10x10
  space 0x0
  text bold "Histogram and R3d engine created for January 2006 Demo contest" snow navy 480
            
  text black snow as-is font-size 11 480 
  { Histogram is an example of how to do REAL 3d graphing in Rebol. It is based on the R3d engine. The r3d engine contains code to render a "3d world" to a series of Pen, Fill-Pen and Triangle statements suitable for the draw dialect.

 Data for the Histogram is stored in a block called Graph-Data of the form: 
     [  [ label1 value1 ] [ label2 value2 ] ]

 Histogram will automatically scale the size of the graph based on the number of elements in this block. Currently the colours for elements in the histogram are generated automatically by a function called GetColour which generates a colour based on the value. 

 It would be trivial to include colour, or any other information in the data structure above if you chose to.

 R3d was written as a separate library, composed of r3d-Matrix.r and r3d-engine.r. These, along with the sample model used, were all encorporated in this script for portability. The seperate R3d libraries, including various unit tests and a standalone r3d object viewer can be made available on request.

History:

 - R3d and objective were my first Rebol scripts (through many iterations of course) started 2 weeks before the contest ship date. 
 - I-Rebot was designed to show how complex objecs could be built up from simple primitives. 
 - Histogram was an example of how the 3d library could be used to enhance the most boring of business applications. ;-)

 It is suprisingly easy to add 3d to your scripts. Once the contest is over I will extract the engine from these scripts to demonstrate how few lines you need to create 3d if you choose to include the R3d script.

  Cheers,
  Andrew Hoadley }     label "Close" #"^M" [unview/only about-r3d] 480 right snow navy ]



; ---------------------------------------------------------
; Contents of r3d-matrix.r - matrix and vector library
;

; create different types of transformations

r3d-identity: 
[
            1.0 0.0 0.0 0.0
            0.0 1.0 0.0 0.0 
            0.0 0.0 1.0 0.0 
            0.0 0.0 0.0 1.0 
]

r3d-perspective: func [
    "Create a perspective matrix with a vanishing point d units from the camera"
    d [decimal!] "d is the distance to the vanishing point - don't set it to zero !!"
][
            
    reduce [1.0 0.0 0.0     0.0
            0.0 1.0 0.0     0.0 
            0.0 0.0 0.0     0.0 
            0.0 0.0 1.0 / d 1.0 ]
]


r3d-translate: func [
    "Create a translation matrix"
    X [decimal!] "translate X units along the x axis"
    Y [decimal!] "translate Y units along the y axis"
    Z [decimal!] "translate Z units along the z axis"
][
    reduce [1.0 0.0 0.0 X 
            0.0 1.0 0.0 Y 
            0.0 0.0 1.0 Z 
            0.0 0.0 0.0 1.0 ]
]

r3d-scale: func [
    "Create a scale matrix"
    X [decimal!] "scale object by a factor of X along the x axis"
    Y [decimal!] "scale object by a factor of Y along the y axis"
    Z [decimal!] "scale object by a factor of Y along the z axis"
][
    reduce [X   0.0 0.0 0.0 
            0.0 Y   0.0 0.0 
            0.0 0.0 Z   0.0 
            0.0 0.0 0.0 1.0 ]
]

r3d-rotateX: func [
    X [decimal!] 
][
    ; calculate once and store the sin and cos values
    sineX:   sine X
    cosineX: cosine X

    reduce [1.0     0.0         0.0         0.0
            0.0     cosineX     (- sineX)  0.0 
            0.0     sineX       cosineX     0.0 
            0.0     0.0         0.0         1.0 ]
]

r3d-rotateY: func [
    Y [decimal!] 
][

    ; calculate once and store the sin and cos values
    sineY:   sine Y
    cosineY: cosine Y

    reduce [cosineY     0.0     sineY     0.0
            0.0         1.0     0.0       0.0
            (- sineY)   0.0     cosineY  0.0 
            0.0         0.0     0.0       1.0 ]
]


r3d-rotateZ: func [
    Z [decimal!]
][

    ; calculate once and store the sin and cos values
    sineZ:   sine Z
    cosineZ: cosine Z

    reduce [cosineZ     (- sineZ)   0.0     0.0
            sineZ       cosineZ     0.0     0.0 
            0.0         0.0         1.0     0.0 
            0.0         0.0         0.0     1.0 ]
]

r3d-face-direction: func [
    DOF     [block!] "Vector3 specifying direction of flight"
    up      [block!] "Up vector may be in any direction except parallel to DOF"
    /local xaxis yaxis zaxis
][
    zaxis: r3d-normalise DOF
    xaxis: r3d-normalise r3d-crossproduct up dOF
    yaxis: r3d-normalise r3d-crossproduct DOF xaxis 
 
    reduce [ xaxis/1    yaxis/1     zaxis/1     0.0
             xaxis/2    yaxis/2     zaxis/2     0.0
             xaxis/3    yaxis/3     zaxis/3     0.0
             0.0        0.0         0.0         1.0 ]
]



r3d-position-object: func [
    object_position     [block!] ; all 3 parameters are 3 dimensional vectors
    position_to_look_at [block!] 
    up                  [block!]
    /local DOF
][
    DOF: r3d-Subtract position_to_look_at object_position 
    zaxis: r3d-normalise DOF
    xaxis: r3d-normalise r3d-crossproduct dOF up
    yaxis: r3d-normalise r3d-crossproduct DOF xaxis 
 
    reduce [ xaxis/1    yaxis/1     zaxis/1     object_position/1
             xaxis/2    yaxis/2     zaxis/2     object_position/2
             xaxis/3    yaxis/3     zaxis/3     object_position/3
             0.0        0.0         0.0         1.0 ]
]



r3d-m4xm4: func [
    m1 [block!] m2 [block!]
    /local result
][
    result: copy []
    foreach [a b c d] m1 [
        append result reduce [ 
            (a * m2/1) + (b * m2/5) + (c * m2/9) + (d * m2/13)          
            (a * m2/2) + (b * m2/6) + (c * m2/10) + (d * m2/14) 
            (a * m2/3) + (b * m2/7) + (c * m2/11) + (d * m2/15) 
            (a * m2/4) + (b * m2/8) + (c * m2/12) + (d * m2/16) 
        ]        
    ]
    result
]

r3d-m4xv3: func [
    m [block!] v [block!]
    /local result 
][
    tempres: copy []
    result: copy []

    foreach [a b c d] m [
        append tempres reduce [ 
            (a * v/1) + (b * v/2) + (c * v/3) + d 
        ]        
    ]

    ; create 1/w so we only divide once and tehn multiply by a fraction (faster) 
    inv-w: reduce (1.0 / tempres/4)
    append result reduce tempres/1 * inv-w
    append result reduce tempres/2 * inv-w
    append result reduce tempres/3 * inv-w
    append result 1.0

    return result
]

r3d-m4xv3-array: func [
    vertices [block!] 
    m4 [block!]
    /local result vertex
][
    result: copy []
    foreach vertex vertices [
        append result reduce [ r3d-m4xv3 m4 vertex ]
    ]

    return result
]


r3d-compose-m4: func [
    matrixlist [block!] ; a list of at least 1 4x4 matrix
    /local result
][

    cm4-len: length? matrixlist

    ; if there are no entries return the identity matrix
    if cm4-len = 0 [ 
        return r3d-identity
    ]

    ; initialise the result with the first entry in the list
    result: copy matrixlist/1

    ; if there is one entry return that entry
    if cm4-len = 1 [ 
        return result 
    ]

    ; for each rentry past the first
    for cm4-i 2 cm4-len 1 [
        ; multiply the previous result by the next element
        result: r3d-m4xm4 pick matrixlist cm4-i result  
    ]   

    return result
]

r3d-transpose-m4: func [
    m [block!]
    /local result
][
    ; transpose a 4x4 matrix
    result: reduce [ m/1 m/5 m/9 m/13 m/2 m/6 m/10 m/14 m/3 m/7 m/11 m/15 m/4 m/8 m/12 m/16]
]

r3d-inverse-m4: func [
    m [block!]
    /local result pairs m4inv-res det
][
    ; ok here we go...

    ; calculate pairs for first 8 elements
    pairs: reduce [ m/11 * m/16     
                    m/12 * m/15     
                    m/10 * m/16
                    m/12 * m/14
                    m/10 * m/15
                    m/11 * m/14
                    m/9  * m/16
                    m/12 * m/13
                    m/9  * m/15
                    m/11 * m/13
                    m/9  * m/14
                    m/10 * m/13]

    ; calculate first 8 elements
    m4inv-res: reduce [
((pairs/1 * m/6) + (pairs/4 * m/7) + (pairs/5 * m/8)) -
((pairs/2 * m/6) + (pairs/3 * m/7) + (pairs/6 * m/8))

((pairs/2 * m/5) + (pairs/7 * m/7) + (pairs/10 * m/8)) -
((pairs/1 * m/5) + (pairs/8 * m/7) + (pairs/9 * m/8))

((pairs/3 * m/5) + (pairs/8 * m/6) + (pairs/11 * m/8)) -
((pairs/4 * m/5) + (pairs/7 * m/6) + (pairs/12 * m/8)) 
                
((pairs/6 * m/5) + (pairs/9 * m/6) + (pairs/12 * m/7)) -
((pairs/5 * m/5) + (pairs/10 * m/6) + (pairs/11 * m/7)) 
                    
((pairs/2 * m/2) + (pairs/3 * m/3) + (pairs/6 * m/4)) -
((pairs/1 * m/2) + (pairs/4 * m/3) + (pairs/5 * m/4)) 

((pairs/1 * m/1) + (pairs/8 * m/3) + (pairs/9 * m/4)) -
((pairs/2 * m/1) + (pairs/7 * m/3) + (pairs/10 * m/4)) 

((pairs/4 * m/1) + (pairs/7 * m/2) + (pairs/12 * m/4)) -
((pairs/3 * m/1) + (pairs/8 * m/2) + (pairs/11 * m/4)) 

((pairs/5 * m/1) + (pairs/10 * m/2) + (pairs/11 * m/3)) -
((pairs/6 * m/1) + (pairs/9 * m/2) + (pairs/12 * m/3)) 

]

    ; calculate pairs for second 8 elements 
    pairs: reduce [ m/3 * m/8
                    m/4 * m/7       
                    m/2 * m/8
                    m/4 * m/6
                    m/2 * m/7
                    m/3 * m/6
                    m/1 * m/8
                    m/4 * m/5
                    m/1 * m/7
                    m/3 * m/5
                    m/1 * m/6
                    m/2 * m/5]

    ; calculate second 8 elements (cofactors)
    m4inv-res: append m4inv-res reduce [
((pairs/1 * m/14) + (pairs/4 * m/15) + (pairs/5 * m/16)) -
((pairs/2 * m/14) + (pairs/3 * m/15) + (pairs/6 * m/16))

((pairs/2 * m/13) + (pairs/7 * m/15) + (pairs/10 * m/16)) -
((pairs/1 * m/13) + (pairs/8 * m/15) + (pairs/9 * m/16))

((pairs/3 * m/13) + (pairs/8 * m/14) + (pairs/11 * m/16)) -
((pairs/4 * m/13) + (pairs/7 * m/14) + (pairs/12 * m/16)) 
                
((pairs/6 * m/13) + (pairs/9 * m/14) + (pairs/12 * m/15)) -
((pairs/5 * m/13) + (pairs/10 * m/14) + (pairs/11 * m/15)) 
                    
((pairs/3 * m/11) + (pairs/6 * m/12) + (pairs/2 * m/10)) -
((pairs/5 * m/12) + (pairs/1 * m/10) + (pairs/4 * m/11)) 

((pairs/9 * m/12) + (pairs/1 * m/9) + (pairs/8 * m/11)) -
((pairs/7 * m/11) + (pairs/10 * m/12) + (pairs/2 * m/9)) 

((pairs/7 * m/10) + (pairs/12 * m/12) + (pairs/4 * m/9)) -
((pairs/11 * m/12) + (pairs/3 * m/9) + (pairs/8 * m/10)) 

((pairs/11 * m/11) + (pairs/5 * m/9) + (pairs/10 * m/10)) -
((pairs/9 * m/10) + (pairs/12 * m/11) + (pairs/6 * m/9))
]

    ; calculate determinate
    det: (m/1 * m4inv-res/1) + 
         (m/2 * m4inv-res/2) + 
         (m/3 * m4inv-res/3) + 
         (m/4 * m4inv-res/4)

    ; invert to avoid doing multiple divisions
    det: 1.0 / det

    result: copy []
    foreach x m4inv-res [ append result reduce ( x * det ) ]

    return r3d-transpose-m4 result  
]


r3d-dotproduct: func [
    v1 [block!] v2 [block!]
    /local result
][
    result: reduce (v1/1 * v2/1) + (v1/2 * v2/2) + (v1/3 * v2/3)
]

r3d-crossproduct: func [
    v1 [block!] v2 [block!]
    /local result
][


    result: reduce [ (v1/2 * v2/3) - (v1/3 * v2/2)
                     (v1/3 * v2/1) - (v1/1 * v2/3)
                     (v1/1 * v2/2) - (v1/2 * v2/1) ]
    return result            
]

r3d-length: func [
    v [block!]
    /local result
][
    result: reduce square-root ( (v/1 * v/1) + (v/2 * v/2) + (v/3 * v/3) )
]

r3d-Add: func [
    "Add a to b - a and b can be either matrices or vectors but types must match"
    a [block!]
    b [block!]
    /local item result
][
    result: copy []
    for item 1 length? a 1 [
        append result reduce ( pick a item ) + ( pick b item )
    ]
    return result
]

r3d-Subtract: func [
    "Subtract b from a - a and b can be either matrices or vectors but types must match"
    a [block!]
    b [block!]
    /local item result
][
    result: copy []
    for item 1 length? a 1 [
        append result reduce ( pick a item ) - ( pick b item )
    ]
    return result
]

r3d-Multiply: func [
    "Multiply a by n - a and b can be either a matrix or vector, n is decimal"
    a [block!]
    n [decimal!]
    /local item result
][
    result: copy []
    for item 1 length? a 1 [
        append result reduce ( pick a item ) * n
    ]
    return result
]

r3d-Divide: func [
    "Divide a by n - a and b can be either a matrix or vector, n is non-zero decimal"
    a [block!]
    n [decimal!]
    /local item result div
][
    result: copy []
    if n = 0.0 [ Print "Divide by zero attempted" return a ]
    div: 1.0 / n    
    for item 1 length? a 1 [
        append result reduce ( pick a item ) * div
    ]
    return result
]



r3d-normalise: func [
    v [block!]
    /local result
][
    ; try to normalise a zero vector and you will get a zero vector back
    len: r3d-length v
    either ( len = 0 ) [
        result: [ 0.0 0.0 0.0 ]
    ] [
        result: reduce [ v/1 / len 
                         v/2 / len
                         v/3 / len ]
    ]

    return result   
]

r3d-print-m4: func [
    m [block!]
][
    foreach [ a b c d ] m [
        print [ a b c d ]
    ]
    print []
]

r3d-print-v3: func [
    v [block!]
][
    foreach elem v [
        print elem  
    ]
    print []
]

;-------------------------------------------------
;
; contents of r3d-engine.r  - r3d render engine
;


Render: func [
    world [block!]
    camera [block!]
    projection [block!]
    canvasSize [pair!]
    /local result transvert trans2d model modelworld triangles
][
    result: copy []
    triangles: copy []
    cameraInverse: r3d-inverse-m4 camera

    foreach r3dobject world [

        model: r3dObject/1
        modelworld: r3dobject/2
        objcolor: r3dObject/3

        ModelCamera: r3d-m4xm4  cameraInverse modelWorld 

        ; transform the vertices into 3d space relative to the camera
        transVert: r3d-m4xv3-array model/1 modelcamera
        faces: model/2

        ; faceinfo contains 2 blocks of n entries, a) face normals and b) furthest Z offset
        faceInfo: r3d-CalculateFaceNormals transVert faces

        ; transform the vertices again using the projection matrix
        trans2d: r3d-m4xv3-array transvert projection
        append triangles r3d-Render2dTriangles-simple trans2d faces faceInfo canvasSize objcolor
    ]

    ; depth sort
    
    triangles: sort/reverse triangles

    foreach triangle triangles [
        fillcolour: triangle/5 
        ; make the outline slightly brighter than the fill colour 
        append result reduce [ 'pen ( fillcolour * 1.10) ]
        ; get fill colour based on lighting calcs
        append result reduce [ 'fill-pen fillcolour ]

        append result 'triangle
        append result triangle/2
        append result triangle/3
        append result triangle/4
    ]

    return result
]


r3d-CalculateFaceNormals: func [
    vertices [block!] 
    faces [block!]
    /local result depthvals v1 v2 v3 vtmp1 vtmp2 vcp largest 
][
    result: copy []
    depthvals: copy []

    foreach face faces [
        ; get the vertices pointed to by each index in the face
        v1: pick vertices face/1 
        v2: pick vertices face/2
        v3: pick vertices face/3

        ; get face normal
        vtmp1: r3d-subtract v2 v1
        vtmp2: r3d-subtract v3 v2
        
        vcp: r3d-crossproduct vtmp1 vtmp2
        vcp: r3d-normalise vcp

        append/only result  vcp

        ; get furthest z co-ord
        largest: -10000.0
        if v1/3 > largest [ largest: v1/3 ]
        if v2/3 > largest [ largest: v2/3 ]
        if v3/3 > largest [ largest: v3/3 ]
        append depthvals largest        
    ]

    reduce [ result depthvals ]
]

r3d-Render2dTriangles-Simple: func [
    transformedVertices [block!] 
    faces [block!]
    faceInfo [block!]
    canvasSize [pair!]
    objColor [tuple!]
    /local result temptriangle v face index origin count facez
][
    result: copy []
    ; todo - Accurate lighting

    ; determine the origin
    origin: (canvasSize * 0.5)

    faceNormals: faceInfo/1
    depthvals: faceinfo/2

    count: 1    
    foreach face faces [
        ; check if this face needs to be backface culled    
        facenormal: pick faceNormals count
        depthval: pick depthvals count
        count: count + 1
        faceZ: facenormal/3
        if faceZ < 0 [

            ; make the depthval the first entry in the block so that the block will be depth sorted by this value
            temptriangle: copy []
            append temptriangle depthval

            foreach index face [
                ; get the vertex pointed to by this index
                v: pick transformedVertices index 
                append temptriangle reduce ( origin + as-pair v/1 v/2 )
            ]
            
            ; todo lighting
            facez: - facez + 0.1
            append temptriangle ( objColor * facez )
            append/only result temptriangle
        ]
    ]

    result
]

r3d-Load-OFF: func [
    offdata [block!]
    /local result verts faces numVerts numFaces numEdges vert face numvertsforthisface largest mx my mz tri
] [

	if offdata/1 <> 'OFF [
		print "Block is not an OFF file"
        return []
    ]

	numVerts: offdata/2
    numfaces: offdata/3
    numedges: offdata/4

    result: copy []
    verts: copy []
    faces: copy []

	largest: 0.0
    smallest: 0.0

    index: 5
    repeat vert numVerts [
        append/only verts reduce [ mx: to-decimal (pick offdata index) 
                                   my: to-decimal (pick offdata index + 1) 
                                   mz: to-decimal (pick offdata index + 2) ]
        index: index + 3
    ]

    if mx > largest [ largest: mx ]
    if my > largest [ largest: my ]
    if mz > largest [ largest: mz ]

    if mx < smallest [ smallest: mx ]
    if my < smallest [ smallest: my ]
    if mz < smallest [ smallest: mz ]


    repeat face numfaces [

        numvertsForThisFace: pick offdata index

        ; vertex indexes in an OFF file are zero based, so we need to add one to each
		repeat tri (numVertsForThisFace - 2 ) [
   	       append/only faces reduce [ (1 + pick offdata index + 1) 
                                      (1 + pick offdata index + tri + 1) 
                                      (1 + pick offdata index + tri + 2) ]
        ]        

		index: index + 1 + numVertsForThisFace
    ]

    result: reduce [ verts faces (largest - smallest) ]

]

;----------------------------------------
;
; Load the base model 
;
; The Graph is constructed from scaled cubes, however arbitrarily complex
; models can be used. See below as an exanple of how to create models for the R3d engine
;
; Note: R3d supports the loading of .OFF files using the function r3d-load-OFF
;

cube-model: [ 
    ; vertices
    [
        [ 1.0 1.0 0.0 ]
        [ 1.0 -1.0 0.0 ]
        [ -1.0 -1.0 0.0 ]
        [ -1.0 1.0 0.0 ]
        [ 1.0 1.0 1.0 ]
        [ 1.0 -1.0 1.0 ]
        [ -1.0 -1.0 1.0 ]
        [ -1.0 1.0 1.0 ]

    ]
    ; faces - anticlockwise winding
    [
        [ 1 5 6 ]
        [ 1 6 2 ]
        [ 2 6 7 ]
        [ 2 7 3 ]
        [ 3 7 8 ]
        [ 3 8 4 ]
        [ 4 8 5 ]
        [ 4 5 1 ]
        [ 8 7 6 ]
        [ 8 6 5 ]
        [ 1 2 3 ]
        [ 1 3 4 ]
    ]
]


;----------------------------------------
;
; Histogram demo script
;


;------------------------------------------
;
; Histogram - data, declarations and defaults
;


graph-data: [ [ "Jan" 11.0 ]
              [ "Feb" 22.0 ]
              [ "Mar" 25.0 ]
              [ "Apr" 55.0 ]
              [ "May" 35.0 ]
              [ "Jun" 75.0 ]
              [ "Jul" 20.0 ]
              [ "Aug" 33.0 ]
              [ "Sep" 21.0 ]
              [ "Oct" 55.0 ]
              [ "Nov" 65.0 ]
              [ "Dec" 45.0 ] ]

; camera translation and 'look at' value
cameraTransx: -30.0
cameraTransy: -300.0
cameraTransz: 150.0
cameraLookatx: -20.0
cameraLookaty: 0.0
cameraLookatz: 100.0

displayLabel: true
displayValue: true
colouredLabels: true 

; ------------------------------------------------
;
; declare and initialise the world object
;
world: copy []


get-Colour: func [ 
    data-value [decimal!]
    /local dval
] [
    if data-value > 60.0 [ return 250.30.30 ]
    if data-value > 50.0 [ return 200.50.50 ]
    if data-value > 50.0 [ return 150.50.100 ]
    if data-value > 40.0 [ return 100.50.200 ]
    if data-value > 30.0 [ return 50.50.200 ]
    if data-value > 20.0 [ return 30.30.150 ]
    if data-value > 10.0 [ return 0.0.100 ]
    return 0.0.30
]

; -------------------------------------------------
; 
; Update function - this builds the world, sets up the camera and renders the world, filling the 'RenderTriangles'
; block with all of the Triangle, pen and fill-pen commands neccessary to draw the world (in reverse Z order)
;
; In an environment where more speed is required, it would be better to retain at least parts of the world
; between frames, modifying only items which have changed position / orientation
;
; In this demonstration, the entire world is being rebuilt from scratch each frame for clarity.
;

update: func [] [

     ; re-create the world
     world: copy []

     startx: -400.0
     endx: 400.0
     numvalues: length? graph-data

     xcursor: startx
     xstep: ( endx - startx ) / to-decimal numvalues
     barscale: ( xstep * 0.5 - 8.0 )

     foreach entry graph-data [

         data-value: entry/2    
         bar-modelworld: r3d-m4xm4 r3d-translate xcursor 0.0 0.0 r3d-scale barscale barscale data-value * 3.0
         bar-object: reduce [ cube-model bar-modelworld get-Colour data-value ]
         append world reduce [ bar-object ]
         xcursor: xcursor + xstep 
     ]


     ; NEXT - SET UP THE CAMERA TO VIEW THE WORLD -------------------------
     ; create the transform for the camera
     camera: r3d-position-object   reduce [ cameratransx cameratransy cameratransz ]
                                   reduce [ cameraLookatx cameralookaty cameralookatz ]
                                   [ 0.0 0.0 1.0 ] 

     ; Get Projection matrix -------------------------------------
     Projection:    r3d-perspective 250.0

     RenderTriangles: render world camera Projection 400x360

     ; now calculate and append the text labels by positioning them in the 3d world

     invCamera: r3d-inverse-m4 camera
     trans: r3d-m4xm4 projection invcamera 

     if not colouredLabels [ append renderTriangles [ 'pen white ] ]

     xcursor: startx
     foreach entry graph-data [  

        ; display label

        labelheight: -30.0

        if ColouredLabels [ append renderTriangles reduce [ 'pen get-Colour entry/2 ] ]

        if DisplayLabel [

            textWorldPosition: reduce [ xcursor 0.0 labelheight ]
            screenPos: r3d-m4xv3 trans textworldposition
            screenposxy: 200x180 + as-pair screenpos/1 screenpos/2 
    
            append RenderTriangles reduce [  'text screenposxy entry/1  ]

            labelheight: -60.0
        ]

        ; display value

        if DisplayValue [
            textWorldPosition: reduce [ xcursor 0.0 labelheight ]
            screenPos: r3d-m4xv3 trans textworldposition
        
            screenposxy: 200x180 + as-pair screenpos/1 screenpos/2 

            append RenderTriangles reduce [  'text screenposxy to-string entry/2  ]

        ]

        xcursor: xcursor + xstep

     ]

     rendertriangles
]


;-----------------------------------------------------
; forward declaration for the RenderTriangles block
;
RenderTriangles: copy []

;-----------------------------------------------------
; View Layout for displaying the Graph and controlling the Camera
;

out: layout [
 style lab label 55 right yellow
 style lab2 label 38 right
 style lab3 label 100 right yellow 

 origin 1x5
 backeffect [gradient 0x1 blue water]
 
 at 0x0 r3d-viewport: box 400x360 black effect [draw RenderTriangles]

 across
 vh2 "Graph" 
 pad 317
 btn-help [ view/new about-r3d ]
 return
 across
 lab3 "Display Labels"
 dispLab: check [DisplayLabel: dispLab/data update show r3d-viewport]
 lab3 "Display Values"
 dispVal: check [DisplayValue: dispVal/data update show r3d-viewport]
 lab3 "Colour Labels"
 colLab: check [ColouredLabels: colLab/data update show r3d-viewport]

 return

 vh2 "Camera" return
 across
 lab "Position"
 lab2 "x" cpos_x: slider 60x16 [ cameratransx: ( value * 600 - 300.0) update show r3d-viewport ]
 lab2 "y" cpos_y: slider 60x16 [ cameratransy: ( value * 600 - 300.0) update show r3d-viewport ]
 lab2 "z" cpos_z: slider 60x16 [ cameratransz: ( value * 600) update show r3d-viewport ]
 return 
 lab "Look at"
 lab2 "x" clook_x: slider 60x16 [ cameraLookatx: ( value * 400 - 200.0) update show r3d-viewport ]
 lab2 "y" clook_y: slider 60x16 [ cameraLookaty: ( value * 400 - 200.0) update show r3d-viewport ]
 lab2 "z" clook_z: slider 60x16 [ cameraLookatz: ( value * 200 ) update show r3d-viewport ]

]


;--------------------------------------------------------------
;
; Default slider positions to match object and camera defaults
;

cpos_x/data: 0.45
cpos_y/data: 0.0
cpos_z/data: 0.25
clook_x/data: 0.45
clook_y/data: 0.5
clook_z/data: 0.5

dispLab/data: true
dispVal/data: true
collab/data: true

;----------------------------------------------------------------
; 
; Call the initial update to build the world on the first frame
;

update 

;----------------------------------------------------------------
;
; Display the layout
;
; Display the layout, allow the user to modify values using the sliders and then call Update at each modification
; to re-render the world with the new parameters
;

view out