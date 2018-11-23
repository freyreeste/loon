

::oo::class create ::loon::classes::Scatterplot3D_View {
    
    superclass ::loon::classes::withCanvasAndItemBindings\
	::loon::classes::Decorated_View
	
    variable controller rotate3DX_var rotate3DY_var axesGuides rotationOriginGuide
    
    constructor {Path} {
        my variable canvas map
        
        next $Path
        
        foreach state {rotate3DX rotate3DY} {
            set ${state}_var ""
        }
        
        set controller [::loon::classes::Scatterplot3D_Controller new [self]]
        set axesGuides [::loon::classes::Axes3DVisual new "axes3D" $canvas $map]
        #set rotationOriginGuide [::loon::classes::RotationOrigin3DVisual new "rotationOrigin3D" $canvas $map]
    }
    
    method setPlotModel {Model} {
        my variable plotModel map
        
        next $Model
        set ns [info object namespace $plotModel] 
        foreach state {rotate3DX rotate3DY} {
            set ${state}_var [uplevel #0 ${ns}::my varname $state]
            $map set[string toupper $state 0] [set [set ${state}_var]]
        }
        $controller setModel $Model
    }
    
    method plotUpdateDict {events} {   
        my variable map plotModel
        
        set needCoordsUpdate FALSE
        if {[dict exists $events "rotate3DX"] } {
            set needCoordsUpdate TRUE
            $map setRotate3DX [set $rotate3DX_var]
        }
        if {[dict exists $events "rotate3DY"]} {
            set needCoordsUpdate TRUE
            $map setRotate3DY [set $rotate3DY_var]
        }
        if {$needCoordsUpdate} {
            dict append events "needCoordsUpdate" TRUE
            my redrawAxes3D
        }
        next $events
    }
    
    method redraw {} {
        next
        my redrawAxes3D
        #$rotationOriginGuide redraw
    }
    
    method updateCoords {} {
        next
        my redrawAxes3D
        #$rotationOriginGuide redraw
    }
    
    method redrawAxes3D {} {
        my variable plotModel
        
        set newAxesCoords [$plotModel getAxesCoords]
        set newAxesX [dict get $newAxesCoords x]
        set newAxesY [dict get $newAxesCoords y]
        set newAxesZ [dict get $newAxesCoords z]
        $axesGuides setAxesCoords [list [lindex $newAxesX 0] [lindex $newAxesY 0] [lindex $newAxesZ 0]] \
                                  [list [lindex $newAxesX 1] [lindex $newAxesY 1] [lindex $newAxesZ 1]] \
                                  [list [lindex $newAxesX 2] [lindex $newAxesY 2] [lindex $newAxesZ 2]]
        $axesGuides redraw
    }
}
