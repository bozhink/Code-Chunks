REBOL [
 Title: "Objective - R3d Object Viewer"
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

; x29_plane.off is shipped with geomview and is public domain

;
; Snuck in the ability to load OFF models from a file, however this could not be made 100% bulletproof within the time available
; to enable, set the following to true
;

load-models: false


;---------------------------------------
; Rave on about the engine ;-)
;

about-r3d: layout [
       
  size 500x600
  backeffect [gradient 0x1 blue water]
  Origin 10x10
  space 0x0
  text bold "Objective and R3d engine created for January 2006 Demo contest" snow navy 480
            
  text black snow as-is font-size 11 480 
  { Objective is a sample application using the R3d engine. It allows you to rotate, translate, scale and view 3d objects from any angle. 

 Objective can be easily modified to load the native .R3d format, or load the OFF format - native to GeomView http://www.geom.uiuc.edu/projects/visualization/ . This Demo loads a sample OFF file from compressed data because I was unsure about whether content files would be a part of the 32k limit. I have loaded files up to about 260k in size with no problem, except of course for the inevitable slowdown in frame rate.

The r3d engine contains code to render a "3d world" to a series of Pen, Fill-Pen and Triangle statements suitable for the draw dialect. R3d was written as a separate library, composed of r3d-Matrix.r and r3d-engine.r. These, along with the sample model used, were all encorporated in this script for portability. The seperate R3d libraries, including various unit tests and a standalone r3d object viewer can be made available on request.

Due to the amount of data required to display the sample 3d model, some unused functions were removed from this version of the R3d matrix and engine modules. eg the ability to print matrices and vectors, the ability to add 2 vectors together (subtraction is still used), and to multiply and divide vectors and matrices by a scalar value.

 R3d supports:

  - completely accurate 3d transformations through the included r3d-matrix library
       ie translation, rotation about all axes, perspective, scaling, matrix inversion, 
           "Place object" mode that allows you to position an object and tell it to look at a position
  - complex scene graph
  - multiple cameras per world.
  - backface culling and depth sorting of triangles
  - dynamic colouring and shading of objects

  R3d does not use short cuts or tricks to position the objects in space, each object in the world is specified mathematically correctly using the model and a model-world matrix to define it's placement and scale. You can also specify the object colour when placing it in the world.

  R3d and Objective were my first attempts at coding in Rebol, started 2 weeks before the closing date for the competition. 

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
        repend result [ 
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
        repend tempres [ 
            (a * v/1) + (b * v/2) + (c * v/3) + d 
        ]        
    ]

    ; create 1/w so we only divide once and tehn multiply by a fraction (faster) 
    inv-w: reduce (1.0 / tempres/4)
    repend result [ 
      tempres/1 * inv-w   
      tempres/2 * inv-w 
      tempres/3 * inv-w 
      1.0 
    ]

    return result
]

r3d-m4xv3-array: func [
    vertices [block!] 
    m4 [block!]
    /local result vertex
][
    result: copy []
    foreach vertex vertices [
        repend result [ r3d-m4xv3 m4 vertex ]
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
    m4inv-res: repend m4inv-res [
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
    foreach x m4inv-res [ append result x * det ]

    return r3d-transpose-m4 result  
]


r3d-dotproduct: func [
    v1 [block!] v2 [block!]
][
    (v1/1 * v2/1) + (v1/2 * v2/2) + (v1/3 * v2/3)
]

r3d-crossproduct: func [
    v1 [block!] v2 [block!]
][


    reduce [ 
      (v1/2 * v2/3) - (v1/3 * v2/2)
      (v1/3 * v2/1) - (v1/1 * v2/3)
      (v1/1 * v2/2) - (v1/2 * v2/1) 
    ]
               
]

r3d-length: func [
    v [block!]
][
    square-root (v/1 * v/1) + (v/2 * v/2) + (v/3 * v/3) 
]


r3d-Subtract: func [
    "Subtract b from a - a and b can be either matrices or vectors but types must match"
    a [block!]
    b [block!]
    /local result
][
    result: copy []
    repeat item length? a [
        repend result ( pick a item ) - ( pick b item )
    ]
    return result
]

r3d-normalise: func [
    v [block!]
    /local result
][
    ; try to normalise a zero vector and you will get a zero vector back
    len: r3d-length v
    result: either zero? len [
         [ 0.0 0.0 0.0 ]
    ] [
        reduce [ 
            v/1 / len 
            v/2 / len
            v/3 / len 
        ]
    ]

    return result   
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

        ; note - tried testing to see if the fill colour hasn't changed and not set the pen in this case
        ;        overhead was higher than the cost of setting the pen

        ; get fill colour based on lighting calcs
        ; set fill colour
        ; write triangle

        repend result 
        [ 
           'pen fillcolour * 1.10
           'fill-pen fillcolour 
           'triangle triangle/2 triangle/3 triangle/4
        ]
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
    ; todo - lighting, sorting, backface culling

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
; choose a model to load by uncommenting one of these options
;

; Option 1 - load an OFF file using the OFF file parser: 
; This is the default but I didn't know how this would fit within the 32k limit of the comp
; model: r3d-load-OFF load %x29_plane.off

; load the same model from a compressed block
planeModel: model: r3d-load-off load decompress debase {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}


;------------------------------------------

; object translation and scale

; calculate default scale from model/3 if it exists
modelsize: 1.0
if model/3 [ modelsize: model/3 ]
if modelsize < 1.0 [ modelsize: 1.0 ]
defaultScale: 200.0 / modelsize

objectScaleX: defaultscale
objectScaleY: defaultscale
objectScaleZ: defaultscale
objectRotateX: 0.0
objectRotateY: 0.0
objectRotateZ: 0.0
objectTranslateX: 0.0
objectTranslateY: 0.0
objectTranslateZ: 0.0

; camera translation and 'look at' value
cameraTransx: -200.0
cameraTransy: -200.0
cameraTransz: 200.0
cameraLookatx: 0.0
cameraLookaty: 0.0
cameraLookatz: 0.0

; world object
world: copy []

update: func [ ] [

	 ; re-create the world
	 world: copy []

	 ; PLACE MODEL IN THE WORLD
	 ; first scale the model
     ; rotate it so it's orientation is correct
     ; then move it
	 modelWorld: r3d-compose-m4 reduce [ r3d-scale objectScaleX objectScaleY objectScaleZ
										 r3d-translate objectTranslateX objectTranslateY objectTranslateZ
										 r3d-rotatex objectRotateX
										 r3d-rotatey objectRotateY 
										 r3d-rotatez objectRotateZ
										  ]
	 r3d-object: reduce [ model modelWorld blue ] 
	 append world reduce [ r3d-object ] 

	 ; NEXT - SET UP THE CAMERA TO VIEW THE WORLD
	 ; create the transform for the camera
	 camera: r3d-position-object   reduce [ cameratransx cameratransy cameratransz ]
                                   reduce [ cameraLookatx cameralookaty cameralookatz ]
                                   [ 0.0 0.0 1.0 ] 

 	 ; Get Projection matrix
	 Projection:	r3d-perspective 250.0

	 RenderTriangles: render world camera Projection 400x350

]

; flag set when the Viewport is dirty and needs to be re-rendered
; ie only renders when one of the parameters has been changed
ViewPortDirty: true

RenderTriangles: copy []
bx: copy []

out: layout [
 origin 0x5
 backeffect [gradient 0x1 blue water]
 
 led 0:00:00.01 [
    if ViewPortDirty [
        update 
        show bx
        ViewPortDirty: false
    ]
 ]

 at 0x0 bx: box 400x350 black effect [draw RenderTriangles]

 across
 vh2 "Object"
 pad 77 
 loadb1: btn 100 "Sample Plane" [ model: planeModel ]  
 loadb2: btn 100 "Load .off" [ if r3dfile: request-file/only/keep/filter "*.off" [ if not model: r3d-load-off load r3dfile [ model: planeModel ]]]
 btn-help [ view/new about-r3d ]

 return
 style lab label 100 right yellow
 style slid slider 65x16
 across
 lab "Scale"
 text "x" sx: slid [ objectScaleX: ( value / 0.5 * defaultScale ) ViewPortDirty: true ]
 text "y" sy: slid [ objectScaleY: ( value / 0.5 * defaultscale ) ViewPortDirty: true ]
 text "z" sz: slid [ objectScaleZ: ( value / 0.5 * defaultscale ) ViewPortDirty: true ]
 return
 lab "Rotation"
 text "x" slid [ objectRotateX: ( value * 200.0 ) ViewPortDirty: true ]
 text "y" slid [ objectRotateY: ( value * 200.0 ) ViewPortDirty: true ]
 text "z" slid [ objectRotateZ: ( value * 200.0 ) ViewPortDirty: true ]
 return 
 lab "Translation"
 text "x" tr_x: slid [ objectTranslateX: ( value * 400.0 - 200.0) ViewPortDirty: true ]
 text "y" tr_y: slid [ objectTranslateY: ( value * 400.0 - 200.0) ViewPortDirty: true ]
 text "z" tr_z: slid [ objectTranslateZ: ( value * 400.0 - 200.0) ViewPortDirty: true ]
 return 

 vh2 "Camera" return
 lab "Position"
 text "x" cpos_x: slid [ cameratransx: ( value * 400 - 200.0) ViewPortDirty: true ]
 text "y" cpos_y: slid [ cameratransy: ( value * 400 - 200.0) ViewPortDirty: true ]
 text "z" cpos_z: slid [ cameratransz: ( value * 400 - 200.0) ViewPortDirty: true ]
 return 
 lab "Look at"
 text "x" clook_x: slid [ cameraLookatx: ( value * 400 - 200.0) ViewPortDirty: true ]
 text "y" clook_y: slid [ cameraLookaty: ( value * 400 - 200.0) ViewPortDirty: true ]
 text "z" clook_z: slid [ cameraLookatz: ( value * 400 - 200.0) ViewPortDirty: true ]
 return

]

; default slider positions to match object and camera defaults

sx/data: 0.5
sy/data: 0.5
sz/data: 0.5

tr_x/data: 0.5
tr_y/data: 0.5
tr_z/data: 0.5

cpos_z/data: 1.0
clook_x/data: 0.5
clook_y/data: 0.5
clook_z/data: 0.5

if not load-models [
   loadb1/show?: false
   loadb2/show?: false
]

update

view out

; view/new out
; tmstart: now/precise
; loop 100 [ update show bx ]
; tmend: now/precise
; print tmend/time - tmstart/time
; do-events

