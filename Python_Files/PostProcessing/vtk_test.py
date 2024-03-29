# Libraries
import numpy as np                      # Import numpy library
import vtk                              # Import vtk library
from vtk.util import numpy_support

# Start function for render
def render_marchingCubes(array3D):

    arr2rnd = array3D                   # New variable that store the input

    arrayMax = np.max(arr2rnd)          # Select the maximum value of the input array
    arrayMin = np.min(arr2rnd)          # Select the minimun value of the input array
    arr_range = arrayMax - arrayMin     # Obtain the range of the input array

    arr2rnd_norm = (arr2rnd - arrayMin) / arr_range     # Numpy normalized

    arr2rnd_shape = arr2rnd_norm.shape      # array shape
    # Converting a numpy array to vtk array
    arr2rnd_vtk = numpy_support.numpy_to_vtk(num_array=arr2rnd_norm.ravel(), deep=True, array_type=vtk.VTK_FLOAT)

    vtk_data = vtk.vtkImageData()           
    vtk_data.SetOrigin(0, 0, 0)             # Set origin as necessary
    vtk_data.SetSpacing(1, 1, 1)            # Set spacing as necessary
    vtk_data.SetDimensions(arr2rnd_shape[2], arr2rnd_shape[1], arr2rnd_shape[0])
    vtk_data.AllocateScalars(numpy_support.get_vtk_array_type(arr2rnd_vtk.dtype),1)
    vtk_data.GetPointData().SetScalars(arr2rnd_vtk)

    # marching cubes
    surface = vtk.vtkMarchingCubes()
    surface.SetInputData(vtk_data)
    surface.ComputeNormalsOn()
    surface.ComputeGradientsOn()
    surface.SetValue(0, 0.3)

    # to remain largest region
    filter = vtk.vtkPolyDataConnectivityFilter()
    filter.SetInputConnection(surface.GetOutputPort())
    filter.SetExtractionModeToLargestRegion()

    mapper = vtk.vtkPolyDataMapper()
    mapper.SetInputConnection(filter.GetOutputPort())
    mapper.ScalarVisibilityOff()

    actor = vtk.vtkActor()
    actor.SetMapper(mapper)

    render = vtk.vtkRenderer()
    renderWin = vtk.vtkRenderWindow()
    renderWin.AddRenderer(render)
    rend = vtk.vtkRenderWindowInteractor()
    rend.SetRenderWindow(renderWin)

    rend.Initialize()

    render.ResetCamera()
    render.GetActiveCamera().Zoom(2)
    renderWin.Render()

    rend.Start()
