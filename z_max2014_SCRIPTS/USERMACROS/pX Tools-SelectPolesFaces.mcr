macroScript SelectPolesFaces category:"pX Tools" buttonText:"Select Poles Faces"
(

	on isEnabled return 
	(
		selection.count == 1 and classOf selection[1].baseobject == Editable_Poly
	)

	on execute do
	(
		 local face_selection = #{}
		 local base_obj = $.baseobject
		 local num_verts = polyop.getNumVerts base_obj
		 local currentVert = #()

		 for f = 1 to num_verts do
		 (
			currentVert[1] = f 
			local LinkedFaces = (polyop.getFacesUsingVert base_obj currentVert)			
			if (LinkedFaces as array).count>5 do face_selection = face_Selection + LinkedFaces
		 )--end f loop

		 polyop.setFaceSelection base_obj face_selection
		 max modify mode
		 modPanel.setCurrentObject base_obj
		 subobjectlevel = 4
	)--end on execute
)--end script  